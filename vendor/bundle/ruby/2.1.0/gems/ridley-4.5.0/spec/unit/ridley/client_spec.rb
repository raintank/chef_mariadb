require 'spec_helper'

describe Ridley::Client do
  let(:server_url) { "https://api.opscode.com" }
  let(:client_name) { "reset" }
  let(:client_key) { fixtures_path.join("reset.pem").to_s }
  let(:organization) { "vialstudios" }
  let(:encrypted_data_bag_secret_path) { fixtures_path.join("reset.pem").to_s }
  let(:chef_version) { "10.24.0-01" }

  let(:config) do
    {
      server_url: server_url,
      client_name: client_name,
      client_key: client_key,
      organization: organization,
      encrypted_data_bag_secret_path: encrypted_data_bag_secret_path,
      chef_version: chef_version
    }
  end

  describe "ClassMethods" do
    let(:options) do
      {
        server_url: "https://api.opscode.com/some_path",
        client_name: client_name,
        client_key: client_key
      }
    end

    describe "::initialize" do
      subject { described_class.new(options) }

      describe "parsing the 'server_url' option" do
        describe '#host' do
          subject { super().host }
          it { is_expected.to eql("api.opscode.com") }
        end

        describe '#scheme' do
          subject { super().scheme }
          it { is_expected.to eql("https") }
        end

        describe '#path_prefix' do
          subject { super().path_prefix }
          it { is_expected.to eql("/") }
        end
      end

      describe "with a server_url containing an organization" do
        before do
         options[:server_url] = "#{server_url}/organizations/#{organization}"
        end

        it "gets the host data from the server_url" do
          expect(subject.host).to eql("api.opscode.com")
          expect(subject.scheme).to eql("https")
        end

        it "takes the organization out of the server_url and assigns it to the organization reader" do
          expect(subject.organization).to eql(organization)
        end

        it "sets the 'path_prefix' of the connection the organization sub URI" do
          expect(subject.path_prefix).to eql("/organizations/#{organization}")
        end
      end

      it "raises 'ArgumentError' if a value for server_url is not given" do
        expect {
          described_class.new(
            client_name: client_name,
            client_key: client_key
          )
        }.to raise_error(ArgumentError, "Missing required option(s): 'server_url'")
      end

      it "raises if a value for client_name is not given" do
        expect {
          described_class.new(
            server_url: server_url,
            client_key: client_key
          )
        }.to raise_error(ArgumentError, "Missing required option(s): 'client_name'")
      end

      it "raises if a value for client_key is not given" do
        expect {
          described_class.new(
            server_url: server_url,
            client_name: client_name
          )
        }.to raise_error(ArgumentError, "Missing required option(s): 'client_key'")
      end

      it "raises a ClientKeyFileNotFound if the client_key is not found or an invalid key" do
        config[:client_key] = "/tmp/nofile.xxsa"

        expect {
          described_class.new(config)
        }.to raise_error(Ridley::Errors::ClientKeyFileNotFoundOrInvalid)
      end

      it "expands the path of the client_key" do
        config[:client_key] = "spec/fixtures/reset.pem"

        expect(described_class.new(config).client_key[0..4]).not_to eq("spec/")
      end

      it "accepts a client key as a string" do
        key = File.read(fixtures_path.join("reset.pem").to_s)
        config[:client_key] = key.dup
        expect(described_class.new(config).client_key).to eq(key)
      end

      it "assigns a 'chef_version' attribute from the given 'chef_version' option" do
        expect(described_class.new(config).chef_version).to eql("10.24.0-01")
      end
    end

    describe "::open" do
      it "instantiates a new connection, yields to it, and terminates it" do
        new_instance = double(alive?: true)
        expect(described_class).to receive(:new).and_return(new_instance)
        expect(new_instance).to receive(:hello)
        expect(new_instance).to receive(:terminate)

        described_class.open do |f|
          f.hello
        end
      end
    end
  end

  let(:instance) { described_class.new(config) }

  subject { instance }

  describe '#client' do
    subject { super().client }
    it { is_expected.to be_a(Ridley::ClientResource) }
  end

  describe '#cookbook' do
    subject { super().cookbook }
    it { is_expected.to be_a(Ridley::CookbookResource) }
  end

  describe '#data_bag' do
    subject { super().data_bag }
    it { is_expected.to be_a(Ridley::DataBagResource) }
  end

  describe '#environment' do
    subject { super().environment }
    it { is_expected.to be_a(Ridley::EnvironmentResource) }
  end

  describe '#node' do
    subject { super().node }
    it { is_expected.to be_a(Ridley::NodeResource) }
  end

  describe '#role' do
    subject { super().role }
    it { is_expected.to be_a(Ridley::RoleResource) }
  end

  describe '#sandbox' do
    subject { super().sandbox }
    it { is_expected.to be_a(Ridley::SandboxResource) }
  end

  describe "#encrypted_data_bag_secret" do
    subject { instance.encrypted_data_bag_secret }

    it { is_expected.to be_a(String) }

    context "when a encrypted_data_bag_secret_path is not provided" do
      before(:each) do
        instance.stub(encrypted_data_bag_secret_path: nil)
      end

      it "returns nil" do
        expect(subject).to be_nil
      end
    end

    context "when the file is not found at the given encrypted_data_bag_secret_path" do
      before(:each) do
        instance.stub(encrypted_data_bag_secret_path: fixtures_path.join("not.txt").to_s)
      end

      it "raises an EncryptedDataBagSecretNotFound erorr" do
        expect { subject }.to raise_error(Ridley::Errors::EncryptedDataBagSecretNotFound)
      end
    end
  end
end