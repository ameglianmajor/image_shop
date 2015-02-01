require 'rails_helper'
require 'open-uri'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ImagesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Image. As you add validations to Image, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all images as @images" do
      image = Image.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      image = Image.create! valid_attributes
      get :show, {:id => image.to_param}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "GET new" do
    it "assigns a new image as @image" do
      get :new, {}, valid_session
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe "GET edit" do
    it "assigns the requested image as @image" do
      image = Image.create! valid_attributes
      get :edit, {:id => image.to_param}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Image" do
        expect {
          post :create, {:image => valid_attributes}, valid_session
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        post :create, {:image => valid_attributes}, valid_session
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it "redirects to the created image" do
        post :create, {:image => valid_attributes}, valid_session
        expect(response).to redirect_to(Image.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved image as @image" do
        post :create, {:image => invalid_attributes}, valid_session
        expect(assigns(:image)).to be_a_new(Image)
      end

      it "re-renders the 'new' template" do
        post :create, {:image => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested image" do
        image = Image.create! valid_attributes
        put :update, {:id => image.to_param, :image => new_attributes}, valid_session
        image.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested image as @image" do
        image = Image.create! valid_attributes
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "redirects to the image" do
        image = Image.create! valid_attributes
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(response).to redirect_to(image)
      end
    end

    describe "with invalid params" do
      it "assigns the image as @image" do
        image = Image.create! valid_attributes
        put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "re-renders the 'edit' template" do
        image = Image.create! valid_attributes
        put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      image = Image.create! valid_attributes
      expect {
        delete :destroy, {:id => image.to_param}, valid_session
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      image = Image.create! valid_attributes
      delete :destroy, {:id => image.to_param}, valid_session
      expect(response).to redirect_to(images_url)
    end
  end

  describe "GET process_image" do
    it "obtains the resized image" do
      url = "http://www.aboutlawsuits.com/wp-content/uploads/baby-bottle-220.jpg"
      uri_encoded_url = URI::encode(url)
      new_width = 400
      new_height = 500

      image_body = "\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x02\x00\x00d\x00d\x00\x00\xFF\xEC\x00\x11Ducky\x00\x01\x00\x04\x00\x00\x00<\x00\x00\xFF\xEE\x00\x0EAdobe\x00d\xC0\x00\x00\x00\x01\xFF\xDB\x00\x84\x00\x06\x04\x04\x04\x05\x04\x06\x05\x05\x06\t\x06\x05\x06\t\v\b\x06\x06\b\v\f\n\n\v\n\n\f\x10\f\f\f\f\f\f\x10\f\x0E\x0F\x10\x0F\x0E\f\x13\x13\x14\x14\x13\x13\x1C\e\e\e\x1C\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x01\a\a\a\r\f\r\x18\x10\x10\x18\x1A\x15\x11\x15\x1A\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xC0\x00\x11\b\x00\xDC\x00\xDC\x03\x01\x11\x00\x02\x11\x01\x03\x11\x01\xFF\xC4\x00\x9D\x00\x01\x00\x02\x03\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x06\x01\x03\x04\a\x02\b\x01\x01\x00\x03\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x06\x05\a\x10\x00\x02\x01\x03\x02\x04\x03\x04\x05\t\x05\t\x01\x00\x00\x00\x00\x01\x02\x11\x03\x04\x12\x05!1\x13\x06AQ\"aq\x81\a\x91\xA1\xB12\x14\xC1\xD1Bbr\x82\#$\x15\xE1R\xA23\x16\xF1\xB2\xD2Ss\xB34d5\x17\x11\x01\x00\x02\x02\x01\x03\x03\x04\x02\x03\x01\x00\x00\x00\x00\x00\x00\x01\x02\x11\x031!\x122\xA1\x04\x05Aaq\x13Q\"\xB1BR3\xFF\xDA\x00\f\x03\x01\x00\x02\x11\x03\x11\x00?\x00\xFDR\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x001)F1r\x93\xA4b\xAA\xDF\x92Bdy\xCFqw\x96\xF1z\xE4\x96\x05\xC7\x8B\x8B\x17H8\xA5\xAEIx\xB6\xFE\xC4yoy\xF2\xDB&\xD8\xA7\xF5\xAB\xED\xFBocH\x8F\xED\xD6\\\x9D\xB3\xF3\x13s\xB1\xB9Z\xC3\xDD\xAE~#\x12\xFC\x94\x15\xE9$\xA7nRtM\xB5J\xAF2\xFE\xC7\xE5\xAF\xDD\x15\xD99\x89O\xBA\xF8\xEA\xF6\xF7S\xA4\xC3\xD4\x8FL\xF8`\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0Em\xCF\xFF\x00\x9D\x95\xFF\x00F\xE7\xFB\xAC\xCB\x7F\xFEv\xFCJ\xFA\xBC\xA3\xF2\xF2\xCD\xC2\xDA\xE8/q\xE1vGG\xA4\xD7\xCA\xB5z\xC2\x96D\x17*\xC9*\xFB\xD9JGWL\xCFG\xBF\xDBT\xB7\x15Z\xD1%_\x81\xFA\fp\xF2\x12\xFA%\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\a\x16\xF5=\eF\\\xBC\xADK\xEBT9\xFD\xDC\xE3U\xBF\x12\xD7Df\xF1\xF9y~\xE7:Z\x8A\xF6\x1E#l\xBD\x1E\xB8Wgq~&\xDF\xED\xAF\xB4\xA6\xBEa\xD11\xD2^\xFD\aXE\xFB\x11\xFA\f<|\xB2H\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00V\xBB\xDFw\x866\a\xE0\xA0\xEB\x7F\"\x8EK\xCA\t\xD7\xEBh\xF9\x1F/\xEEb\x9A\xFB#\x9B\x7F\x87w\xB1\xD5\xDDn\xEF\xA4<\xDB?&sT\xF2<\xA5\xB3/\xBDH\x88@d\xDD\x92\x9DI\xAD[e\xEF\x1D\xAF\xBCY\xDD\xF6<\\\xCBn\xB2pP\xBD\x1F\x18\xDC\x8A\xA4\x93\xFBOs\xED7F\xCDqg\x94\xF7\x1A\xA6\x97\x98J\x9D\f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\a\xCD\xDB\x90\xB5jwf\xE9\b')?$\x95Y\x138\x8C\xCAb38y6\xED\xBA~;6\xF6U\xD9\xAA\xCD\xFAS|\xA2\xB9/\xA0\xF1~\xEBt\xED\xBC\xDA^\x87N\xAE\xCA\xC4 3r\xAC\xAA\xFA\x91\xCC\xEB\xADe\v\x95\x95k\x8F\xA8\x98i\x15\x95\xCF\xE5'qtw\x89\xEDr\x95l\xE6\xA6\xE0\xBC\xAEAU}*\xA8\xFB\x7F\x13\xBF\xB6\xFD\xBFK>_\xC9\xE8\xCD{\xBF\x87\xB0\x9E\x89\xF0\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03T\xEE\xCFSQK\x87\x8B-\x108w\\K\x9B\x86\r\xDC;\x97:p\xBA\xA8\xE5\n\xA9*:\xF9\x99\xEE\xD1]\x95\x9A\xCEz\xAF\xAFd\xD2\xD10\xA4\xE7\xF6>\x15\x98\xB6\xF2\xEE\xBF\xDD\x87\xE68#\xE05O\xFB[\xD1\xDD\x1F'\x7F\xE2=U}\xCB\xB60cT\xB2/W\xF7\x7F1Y\xF8\r_\xF5oF\x91\xF2\xDB#\xE9_U_p\xD8\xB1c_\xE3\xDE\xFF\x00\x0F\xE6)?\t\xAE?\xDA\xDE\x8Dc\xE5\xEF\xFF\x005\xF5pm\xF3[N}\x9C\xCC|\x9B\xEA\xF5\x89\xC6\xE4\x1Db\xB8\xC5\xD7\xC8\x9A\xFC]k11i\xE8\x8B\xFC\x95\xAF\x13\x13X\xF5zu\x8F\x9E\xED\xC9F\xEE\xD2\xB8\xF8\xC6\xF3\xFC\xB1>\x9Fs\xE5~\xB7\xA0v\xAFs\xE3\xF7\x0E\x04\xB2\xEC\xD9\x95\x8D\x12\xD3(I\xA7\xC6\x95\xE0\xD1e&0\x9A\b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03K\xA6\xB7\xEF.\x87-\x897nu|\xA74\xBD\xC9\x97\x91\x15\xBC*\xC1\x9B\xD3\x81S\x9C#,\xEB\x11j\xA9\xDC\x8Ak\xD9\xA9\x11)Q\xFB\x82T\xDF\xB7+iz\x15\xD7\xA5x#\x9E\xDC\xCBH\xE2\x15\xCC\xC6\xB5>\x06VZ\x1C\x91\x92\xF2\xE2Qg\xBD\xFC\x9F\xA7\xF4\e\xF4\xE1\xFCU\xF6\x17\x86W_\tP\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0E\x19\xE5[\x8C\xDB\x95\xC8C\x8F):3\\!\xCE\xAEB\x11\x92\x85\xEBmJR\x97\x17\xE6\xEB\xE0\xCB\x88\x8D\xCE\xF4\xE5\x16\xB5\xC1\xFE\xCDM\xA3\x18\x15\x9C\x8B\xB3\xB5~\x17\x92\xD4\xED\xC9I/::\x95\x94\xA9\xDB\xC65\xDB\xBB\x86VZ\x8C\xBF\x98\x96\xAD\x14\xE5\xF10\xB4u\x99i\n\xEEn&U[V\xE4\xFE\x06S\x12\xB6\\\n\xC6Zt\xE9\xBF\xA1\x99\xE2S\x98{o\xC9\xBD\xC23\xC2\xCB\xC2\x94%\e\x91j\xEAo\x95>\xED\v\xC3;\xBD \x95\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA4\xFC\xCA\xED\x8CM\xD6\xD6\x16C\xCA\xB9\x83\x95nn\xDCr,\xBE.\r9ik\x974m\xA6\xF3\f\xB6\xD7(-\xA7\xE5\xCD\xEC\x9CX\xB5\xDC\xDB\x94+U[n\t\xFDH\xD2\xDBq\xF4\x85k\xAF\xEE\xD9\x93\xF2o\"\xE4$\xE7\xDE[\xEB\\\xF4\xAB\x96\xE9\xFF\x00l\xCB\xF6\xCA\xFF\x00\xAD\b\xFENz\xB8\xF7N\xF6\xFD\xED?\xAFA~\xF9W\xB2\x1D\x18\x9F%\xDA\xB8\x9C\xBB\xAFy\x8CW\x82\x94\x13\xFA\\\x19\x13\xB2S\x14HO\xE52\xB3\rK\xB9\xF7[\x94\xFF\x00\x99+O\xEC\x82&6\xFD\x89\xD7\xF7A^\xEC\e\xB1\xDD\xEDcKy\xC9\x92\x9C%%9(\xB7\xC1\xA4\xD5~&\xBF\xB3\xA7\f\xA6\x9Dy{\x16\xCF\xB5\xE2\xED\xBB}\x8CLd\xDC-AENTs\x97\x8Dd\xCE;Ne\xD3\x11\x88v\x90\x90\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00*}\xD5\xBAF\xE5\xC8\xE2\xDAu\xD2\xDC[^o\x9F\xD0m\xAE\xBFVw\x96\xFD\x9E\xEC\xECX\x84\x17$\xB9\v&\x12S\xDCf\xD5\x11L-\x96\xB7v\xB1\xAB\xA5@\xCCr(\xB9\x8C\x0F\x8B\xD7\x94\xE3N\x02\x11*\xF6\xEDm[\xBBo)G\xD5i\xF1\x7F\xAA\xF9\x9A\xD5K-\xBBNdrq \xEBYE$\xFD\xC66\x8CKH\x97iT\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8F\xDFw\x15\x81\xB7N\xEA\xE3vm[\xB4\xBFZ_\x99q-H\xCC\xABi\xC4){v5\xCC\xBC\x97~|U}5\xF27\x99\xC3(\x8C\xAD8\xD8r\xD0e2\xD2 \xBBa\xC4e8h\x95h\x10\xCCk\xE2H\xFB\xA1\x03\x93/\x1D\\\x8C\xA2\xD5b\xD1h\x949v,\xBB\x98Yj\xC4\xDDa_\xF0\xBF\xCCM\xA30\x8A\xCE\x173\x06\xA0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00+\x1D\xE1u\xCA\xEE>585\xAB\xE3'O\xB1\x1A\xEBgv\xFD\xA7\x0E\xDCm\xC5$-)\x88NZ\x84\x12\xA23\x99]\xAB&\xC2pm\b\x94\"\xA7\x16\x9BL\xBA\xAF\xAB\x16e7E\xF4\x89\x94\xE1\xD6\xB0\xE9\x1AWS\xF2Er\x9C92,\xE9\xAA|\x1F\x8A-\x12\x89\x84.{\x85\xAB\xD6\xAEr\xB9\x19S\xDE\x9F\x02\xF0\xA4\xAD\xF8\x17z\xB8vn\x7Fz(\xC6yi\r\xE4$\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\xA1\xDC\xB75w\x15\xABO\x95\xBCxO\xE9\x9C\xD7\xE46\xA7\f\xED\xCA_\x01+\x96S\x8Bq\xF0\xAA++BJ*u\xE3\xC2>i\x94Y\xF7s\xFC\xB6@\x89\xBF\x1A92\xEA\xBA0Ua_2%0\xEE\x8A\xA2*\x97>\xE3n2\xB0\xE7\xE3\x1F\x1Fa5D\xAA;\xA4\xA3r\xC4\xE5\xA9'm\xA9\xD7\xD9\x16\x9B7\x86r\xB1\xF6\x9D\xE5\x7F\xB7po'Ur\xDE\xA4\xF9\xF3\x932\xD9\xCC\xAFN\x12\xC5\x16\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA5\xF7B\x94{\x96\xD4\xFF\x00FX\xF0\x8F\xD1+\x8C\xDB_\x8B+r\x98\xD8[xq\xAF=R\xFBY[\xF2\xBDRm\xDE\xD0\xFC\x1F\x83\x8A\xD4\xD7\xC1\x95K]\xDB9\x0E\xC3I\xCBS\x8F\x1A\xBE5\xAF\x1E>\x1F@\xC8\xE1\xB9n\xEC-\xBE\xA7\x17E\xF4\xF8\x92\x87N\x03\xFE\x0F\x02%0\x90\x8B\xA1T\xB4\xE7q\xC5\xB9\xEE&9D\xA8\xDB\x8C\x1A\xC3\xCA\x97\x1AJ\xDC\x95>\xA3\xA2\x19J\xD5\xDA\x16\x9D\x9E\xDA\xDB\xED5G\vI5Jro\xC1\x18\xEC\xF2\x96\x94\xE1.Q`\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\ngv\xC9\xAD\xEE\xDA\xF0\xE8A\xD7\xF7\xAE\ek\xE1\x95\xF9Jl\x0E\x98\xAA\xBC\x12o\x9F\xBC\x8B\xADT\xBD\xAE\xB6\xA9j\xFB\xB5\xF4\xFB\x8C\xD6m\x93\xF4?q\tF\xE4\xFA\xA1\"\xE8}\xED\xCA\x96\xDA\xF6\x89!\xDC\x9F\x1A\x95KVs\xFEZ\xE7\xEC\xB1\b\x95/w\xAF\xF4\xCC\x87Z'\x06\xB8\xFBZF\xF5\xE5\x9D\xB8Z{ZW%\xDB\xBB{\xBBN\xA7F:\x9Cy7\xE6\x8C\xAF\xE5+\xD3\x84\xA1E\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00)\x1D\xDF'\xFE\xA1\xB6\xBF\xF5`\xEB\xFB\xF37\xD7\xC3+\xF2\x98\xD8\xA3\xAB\x0E\x9C\xAA\xDF\xDAR\xCBU1\e~m\xBF/\x0F\xB0\xA2\xEF\xB9\xFD\xC7\xEE F^~\x89\x97Cn\xDC\xFD<H\x92\x1D\xC4%\xAB7\xFF\x00\x1E\xE7\xEC\xB1\b\x95/z\xAA\xDBn\xC5s\xA7\x05\xFB\xE8\xDE\xBC\xB3\xB7\vOk\\\x95\xCE\xDE\xC1\x9C\x9B\x93v\x97\x16\x92m&\xD2\xAD(\x8Co\xCC\xAFN\x12\x85V\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA2w\xB2\x9F\xFA\x82\xD6\x9A\xB7,X\xA8\xC7\x92\xAFVf\xFA\xB8c~S\x9D\xBE\xEB\x86\x9F\xEB?\xB4\xA5\xD7\xAF\tHF\xF4$\x93\x9FQx\xD7\x83\xFA\x8A\xAC\xDFs\xEE2\x12\x8B\xCB\xE1bE\xA1Y}m\xF7)m!$$\x94\x97:\x94Y\xAB2K\xF0\xD7?e\x93\b\x95\x1Fv\xB8\xE7\x85\x91\xE7\x15U\xE3\xCAh\xE8\xAF,\xAD\xC2\xD1\xD9\x97aw\xB5\xB6\xCB\x90\xAAR\xB1\x17F\x9Ai\xF8\xA6\x9F\xB4\xC7g\x94\xB4\xA7\x10\x99(\xB0\x00\x00\x00\x00\x00\x00\x01P\x00\x00\x00\x00\x00\x00\x00(=\xF7~\x16w\xFCg%_\xE5\xE2\xF8s\xFF\x002f\xFA\xA3\xA3\x1D\x9C\xA5{{*+mS\x8Cu%6\xA8\x9F\x9F\x12/\x1DW\xAC\xF4KX\xFC&:r\x84\x9C\xE5\xFAO\xEFI\x94\x9C\xCA\xD0\xCEF\xE2\xD5\xAAF\xCC\xAB)(\xADMF\xB5\xE6\xF8U\xF0\"*e\xA7-\xA9\xD8M\x13\b\x97>%\xD9(\xAA|I\x98!'\t\xAA*\x95KF\xE1v\x98\xD3\xE3\xE0\xC9\x82T\xBD\xCEzv\xDC\xC9R\xADZn\x9Etu6\xAF,\xA7\x85\xB3\xB2\x1C_jm\xBAc\x18%kN\x98WJ\xA3k\x85x\xD0\xC7g\x94\xAFN!8Qp\x00\x00\x00\x00\x00\x00\a\xCD@T\x05@T\x05@T\x05@\xCD@T\x0F9\xF9\x85qG\xB91\x93m/\xC2\xAE4m}\xF9\x9D:\xBCXl\xE55\xDA\xAE\xDD\xDD\xB2-:\xC5\xBA\xA6\x93^\x1F\x02\x97\xE5zp\x97\xB38\xDF\x94\x94\xAC\xBBj4\xA3\x93\xA3\x7FAE\x9DR\xB1m[\xA3\x8DR\xE2\x9B\xE2\xEB\xEFde.l\xA8\xD6\xD2H\x98\x1Cx\xFC%O\x02eXw\xC1\xB2\x16sn\x8F\xF9Y{\x89\xAA%J\xDDu=\xAB9V\x8EV\xE4\x93\xFD\xA6\x91\xB5ye<.]\x88\xDB\xED\r\xA9\xCB\xEF;\t\xCB\xDE\xDB\xAF3\r\xBER\xD3_\x8C'\x8A.\x00\xA8\n\x81\x8A\x80\xA8\n\x80\xA8\n\x81\xAE\xA0f\xA0*\x02\xA0b\xA0f\xA0*\x02\xA0f\xA0y\xD7~\xA7.\xE7\xC7\xA2\xFB\xB8\xF0\xAB|\xB8\xCA\xE9\xD1\xAB\xC5\x86\xCES}\xABXm\xB0T\xAB\x8F\x82\xF7rEo\xCA\xF4\xE1+j\xFEU\xE9\xA9\xB8J\xCC\x17(\xCA\x8E\xBFJ)\x88Y\xDD7\xE8*\xB3\x9A\xFB\xE0\xBD\xE4\xA1\xC3\x19\x7F\x11\xD3\xE9,\xAB\xAA\xDC\xB9\x10\xB3F\xEB7\xF8y'\xE4\xC9\xAA%K\xDE*\xF6\xCC\xA5\xCA\xB1J\xBF\xBE\x8D\xAB\xCB+p\xB8\xF6\nQ\xEC\xDD\xA65oM\x85\x1A\xC9\xD5\xF0mq~&;|\xA5\xA6\xBF\x18O\xD4\xCDr\xA0*\x06*\x06*\x02\xA0*\x02\xA0f\xA0j\xD4\x03P\r@5\x00\xD4\x03P\x19\xD4\x03P\r@P\xBB\xD99w\f\x1Cx\xC9bE\xA5\xEDR\xB9NgF\xAE\x18\xEC\xE5)\xDB\x92\x95\x8D\xB2\xCB\x94][\x8A\xA3\xA5x\xFB\x8A\xDF\x95\xAB\xC2q\xE5\xD9\x8C\xA5\x16\xDA\x94x?K\xFA\xB8q3\xC2\xF9g'?\x1A\xD5\x8Dw.(\xC5\xB4\x95kZ\xBEI.u\x11\x04\xCBND\xFD\x11k\xCC\x91\xC7\xA9u\x19e]P\x9F\"\xAB9\xF7IW\x1E^\xE6MQ*\x8E\xE9W\x81\x91N.\x89\xAF\x84\x91\xB5yen\x16\xFE\xC4r\xFF\x00Hmz\x92\x8C\xBA<c\x1EK\xD4\xF9T\xC7o\x94\xB4\xD7\xE3\t\xEA\x99\xAET\fT\x06\xA0>u\x00\xD4\x03P\r@5\x01\xCF\xD4@:\x80:\x80:\x88\aQ\x00\xEA \x1DT\x03\xAA\x03\xAA\xBC\xC0\xA5wj\x8C\xBB\x86\xD7\x1FT\xF1\xA8\x97\xB19\x7F\xC4o\xAF\x86W\xE53\xB1\xCA\x10\xC4\xB5m\xD1\xE9Ir\xE1TV\xDC\xADW~U\xCB\x17-\xDC\xC7\xB97\x17r\x0F\xD5\x14\xEA\x97\x9D|\xF8\x15\x84\xCBZ\xC7\xC6\x9A\xB7y=R^\xA8\\^\x97\xC5\f\x98|\xE4\xCFM\x9AG\xC0A.{)\xCF\xD4\xB9\x96Cv\xA9F\\HK^T\xB5\xDA\x94_*1\b\x95cr\x8D0r]xhf\xB5\xE5\x9C\xF0\xB9v\xBCU\xAE\xDE\xC1\xB6\xB8(\xDB\xA2_\x16c~e\xAD8JkE\x165\xA0\x1A\xC0\xC6\xB05;\xBC_\x10\x1D_h\x0E\xAF\xB4\aW\xDA\x03\xAB\xED\x03\x93\xAA\xC0u@u@u@u@\xC7T\aU\x80\xEA\xB0\x1DV\x05+\xBD\xAF\\\xB3\xBCb_\\\xBA-/m$\xEB\xF6\x9D:c1,vr\xE6\xDB\xBB\xAB\"\xCC\x94%e\\\x87\x94[R-mJ\xC5\xD2\x97{\x92\xCD\xEFTl\xB8I\xC5\xC1\xCAW\x14y\xFB\x15Jv/\xDEK\xB82\x1D\xB8\xC2\xD5\xCBpQT\xD4\xD3\x9C\x9F\xC5\xB8\xAF\xA8vA\xDC\xD3s\xB92m\xE9Jv\xEE\xD7\x87\x1AG\xF2\xB1\xD9\b\xEFJ\xED;\x8E\xBB\n\xEC\xE5\n\xC9\xBE\v\xFB\n\xDA\xABVR\x8F7\x16k\xF4[^\nJ\xBF]\n\xE1l\xAA\xFB\xF7tt\xA5+6\xED\xBBJ\xB4w%G\xF6T\xD6\x9A\xD9\xDA\xE8\f\xDC\x99K\x12z\xA4\xEA\xF8Q\xBF3X\x8E\xAAL\xF4z\x1Fm_\x94\xB6\x1C)>n\xDF\xE5g&\xCF)oN\x12]R\x8B\x1DP\x1DP\x1DP4;\xBCX\x0E\xA8\x0E\xA8\x0E\xAB\x01\xD5`i\xE2\x03\x88\x0E c\x88\x19U\x03\x1C@\xC5X\n\x80\xA8\x14\x8F\x9Br\xBF\x8D\xDB+t\xC6\x94#\x7F\n\xEC}\x17\x1D:\x90\xB8\xF4\xB8\xC7\xF5\xABFt{i\xFE\xD8c\xBA:e\xE5[O\x7Fd]\xC6\xB8\xAE\xE3E)z'r\xADQyU\xD0\xEC\xEC\xCB\x9B\xBF\r\xD1\xEE\xCC8\xC5\xB9\xDE\x94\x97\xF7\xA2\xD4\x92\xF8\xA1\xDB\asm\xBE\xF4\xC2\x8D)}\xBAr\xD5\xFE\xD2;!=\xED\xFF\x00\xEB<\e\xAE)\xCBV\x9FRqR\xA7\xD4#Y\xDE\xEF\xC6\xEF\xED\xB2\xC5\x9D4\x9C\x14j\xDE\x8A\xA5\xF5\x95\x9DKF\xC8f_4v\xC6\xFAX\xEAS\xBB%\xC2.Pr\xFA\xE4V5\xC7\xF2\x9F\xD8\xE6\x97p\xE7g\xF0\xB3\x8A\xBC\xF5]\xBD\bS\xDD\xC5\x97\xED\x88S\xBB/\xB7\x7F\x7FW,ce\xF4,Z\xBF$\xADJW+\x14\xF9sK\x97\x11\xD1=^\xDF\x87f8\xB8\x96q\xA0\xEB\e0\x8C\x13\xF3\xD2\xA9_\x89\xF3\xA6s9vDa\xBB[!&\xA6\x06u\x00\xD4\xC0\xD4\xDB\xAB\x03\x15\x01P\x15`*\x06\xFE\x98\x0E\x98\x0E\x98\x0E\x98\x05o\x98\x18v\xC0\xF9v\xC0\xC7L\fh`S\xFE`\xE0\xC3p\x86&\x15\xD8+\x96b\xDD\xE9A\xAA\xA7/\xBB\x1E\x1E\xCE&\xFAg\x19\x96[#*.g\xCB\xEE\xDF\xCF\x84\xA1\x93\x84\x95\xC9/NE\xA7+wb\xFF\x00j\x0E.\x86\xD3l\xB3\x8A\xA3\xBF\xFC_j\x8E<\xF1\xE1\x97\x95\v7U.Bw%\xEAUo\x8B\xA2\xAF?2;\xCE\xC7=\x8F\x90\x9B-\x988\xC2\xFED\x93\xE5\xAA\xF5\xD7OsR+\x16\x84\xCDd\x9F\xC9L\v\x12N\x19\x996\x954\xA5\xD7\xB9O\xAE\xA5\xA2\xD0\x89\xA4\xBB\xB0\xFECm\xD9\x0E\xD6M\xCC\xFC\xA9\xB8\xBE0y\x17\\%G\xFAQ\xAA\xA9[^2\x98\xA4\xE1e\xC2\xF9Sg\x16\x12\x8C2tFK\x8A\x8C}\\?Yz\xBE\xB1\xFB\xBE\xC9\xFD_t>wa`cdI\xA8\xDC\xBFu\xBA9\xDD\xD4\xDD=\x8E\xE6\xA6\xBE\x93J\xDDI\xA3\xA6]\xBB\x8Dk\x15h\xB7\xC5QU\xD5\xF0\xF2\xA3\xA8\x8B\x9D\xAFS\xD8\xEE\\\xBD\xB3\xE1\xCE\x7F\x7F\xA5\x15&\xFC\xE3\xE9\xFC\x87\x1D\xE3\xAC\xBAk\xC3\xBA\x85R\xCE\x902\xA0\a\xD2\x80\x1A\xDD\xBE,\ft\xC0t\xC0t\xC0\xC6\x80:\xB8\x00\xE0\x03\x80\x0E\x008\x00\xE0\x06\x1E\x900\xF4\x81\x8FH\x10\xFB\xB7\xE0\xFF\x00\x19k\xAB\xCFG\x0F\xA5\x97\xAEp\xAC\xF2\xCE'\xF4\xDA\xFF\x00\x0FF\xBF\x85D\xE4\x8C7\xDE\xE9x\xFD\xDD/\xC8\x88KE\xDF\xE9:\x17[F\xAA~\x955|i\xC4\x98\xCA:>#\xFD#\xF4t|\x7F\xB4u:6\xE2\xFE\x0F\xF44\xD2\xA2r\x98vK\x92\xA7/aT\xB87\x1F\xC0\xF4\xDF\xE2i\xEC\xAF?\x81z\xE5Y\xC2\v#\xF0\x1D\x19s\xA7\xC0\xD22\xA7E\xABi\xE9\x7FN\xC7\xE9\xFD\xCD\x1C\fm\xCBH\xE1\xD7\xE9*\x96V\x902\xA8\a\xD2\xA0\x1F\x0FM@z@\xC7\xA4\a\xA4\a\xA4\x0F\xFF\xD9"
      stub_request(:get, url).
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
        to_return(:status => :ok, :body => image_body, :headers => { 'Content-Type' => 'image/jpeg'})

      put :resize_image,
          url: uri_encoded_url,
          width: new_width.to_s,
          height: new_height.to_s
      expect(response).to have_http_status(:ok)
      resized_image = ::Magick::ImageList.new()
      resized_image.from_blob(response.body)
      expect(resized_image.columns).to eq(new_width)
      expect(resized_image.rows).to eq(new_height)
    end

    it "obtains the cropped image" do
      url = "http://www.aboutlawsuits.com/wp-content/uploads/baby-bottle-220.jpg"
      uri_encoded_url = URI::encode(url)
      upper_left_corner = {x: 50, y: 50}
      new_width = 150
      new_height = 150

      image_body = "\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x02\x00\x00d\x00d\x00\x00\xFF\xEC\x00\x11Ducky\x00\x01\x00\x04\x00\x00\x00<\x00\x00\xFF\xEE\x00\x0EAdobe\x00d\xC0\x00\x00\x00\x01\xFF\xDB\x00\x84\x00\x06\x04\x04\x04\x05\x04\x06\x05\x05\x06\t\x06\x05\x06\t\v\b\x06\x06\b\v\f\n\n\v\n\n\f\x10\f\f\f\f\f\f\x10\f\x0E\x0F\x10\x0F\x0E\f\x13\x13\x14\x14\x13\x13\x1C\e\e\e\x1C\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x01\a\a\a\r\f\r\x18\x10\x10\x18\x1A\x15\x11\x15\x1A\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xC0\x00\x11\b\x00\xDC\x00\xDC\x03\x01\x11\x00\x02\x11\x01\x03\x11\x01\xFF\xC4\x00\x9D\x00\x01\x00\x02\x03\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x06\x01\x03\x04\a\x02\b\x01\x01\x00\x03\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x06\x05\a\x10\x00\x02\x01\x03\x02\x04\x03\x04\x05\t\x05\t\x01\x00\x00\x00\x00\x01\x02\x11\x03\x04\x12\x05!1\x13\x06AQ\"aq\x81\a\x91\xA1\xB12\x14\xC1\xD1Bbr\x82\#$\x15\xE1R\xA23\x16\xF1\xB2\xD2Ss\xB34d5\x17\x11\x01\x00\x02\x02\x01\x03\x03\x04\x02\x03\x01\x00\x00\x00\x00\x00\x00\x01\x02\x11\x031!\x122\xA1\x04\x05Aaq\x13Q\"\xB1BR3\xFF\xDA\x00\f\x03\x01\x00\x02\x11\x03\x11\x00?\x00\xFDR\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x001)F1r\x93\xA4b\xAA\xDF\x92Bdy\xCFqw\x96\xF1z\xE4\x96\x05\xC7\x8B\x8B\x17H8\xA5\xAEIx\xB6\xFE\xC4yoy\xF2\xDB&\xD8\xA7\xF5\xAB\xED\xFBocH\x8F\xED\xD6\\\x9D\xB3\xF3\x13s\xB1\xB9Z\xC3\xDD\xAE~#\x12\xFC\x94\x15\xE9$\xA7nRtM\xB5J\xAF2\xFE\xC7\xE5\xAF\xDD\x15\xD99\x89O\xBA\xF8\xEA\xF6\xF7S\xA4\xC3\xD4\x8FL\xF8`\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0Em\xCF\xFF\x00\x9D\x95\xFF\x00F\xE7\xFB\xAC\xCB\x7F\xFEv\xFCJ\xFA\xBC\xA3\xF2\xF2\xCD\xC2\xDA\xE8/q\xE1vGG\xA4\xD7\xCA\xB5z\xC2\x96D\x17*\xC9*\xFB\xD9JGWL\xCFG\xBF\xDBT\xB7\x15Z\xD1%_\x81\xFA\fp\xF2\x12\xFA%\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\a\x16\xF5=\eF\\\xBC\xADK\xEBT9\xFD\xDC\xE3U\xBF\x12\xD7Df\xF1\xF9y~\xE7:Z\x8A\xF6\x1E#l\xBD\x1E\xB8Wgq~&\xDF\xED\xAF\xB4\xA6\xBEa\xD11\xD2^\xFD\aXE\xFB\x11\xFA\f<|\xB2H\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00V\xBB\xDFw\x866\a\xE0\xA0\xEB\x7F\"\x8EK\xCA\t\xD7\xEBh\xF9\x1F/\xEEb\x9A\xFB#\x9B\x7F\x87w\xB1\xD5\xDDn\xEF\xA4<\xDB?&sT\xF2<\xA5\xB3/\xBDH\x88@d\xDD\x92\x9DI\xAD[e\xEF\x1D\xAF\xBCY\xDD\xF6<\\\xCBn\xB2pP\xBD\x1F\x18\xDC\x8A\xA4\x93\xFBOs\xED7F\xCDqg\x94\xF7\x1A\xA6\x97\x98J\x9D\f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\a\xCD\xDB\x90\xB5jwf\xE9\b')?$\x95Y\x138\x8C\xCAb38y6\xED\xBA~;6\xF6U\xD9\xAA\xCD\xFAS|\xA2\xB9/\xA0\xF1~\xEBt\xED\xBC\xDA^\x87N\xAE\xCA\xC4 3r\xAC\xAA\xFA\x91\xCC\xEB\xADe\v\x95\x95k\x8F\xA8\x98i\x15\x95\xCF\xE5'qtw\x89\xEDr\x95l\xE6\xA6\xE0\xBC\xAEAU}*\xA8\xFB\x7F\x13\xBF\xB6\xFD\xBFK>_\xC9\xE8\xCD{\xBF\x87\xB0\x9E\x89\xF0\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03T\xEE\xCFSQK\x87\x8B-\x108w\\K\x9B\x86\r\xDC;\x97:p\xBA\xA8\xE5\n\xA9*:\xF9\x99\xEE\xD1]\x95\x9A\xCEz\xAF\xAFd\xD2\xD10\xA4\xE7\xF6>\x15\x98\xB6\xF2\xEE\xBF\xDD\x87\xE68#\xE05O\xFB[\xD1\xDD\x1F'\x7F\xE2=U}\xCB\xB60cT\xB2/W\xF7\x7F1Y\xF8\r_\xF5oF\x91\xF2\xDB#\xE9_U_p\xD8\xB1c_\xE3\xDE\xFF\x00\x0F\xE6)?\t\xAE?\xDA\xDE\x8Dc\xE5\xEF\xFF\x005\xF5pm\xF3[N}\x9C\xCC|\x9B\xEA\xF5\x89\xC6\xE4\x1Db\xB8\xC5\xD7\xC8\x9A\xFC]k11i\xE8\x8B\xFC\x95\xAF\x13\x13X\xF5zu\x8F\x9E\xED\xC9F\xEE\xD2\xB8\xF8\xC6\xF3\xFC\xB1>\x9Fs\xE5~\xB7\xA0v\xAFs\xE3\xF7\x0E\x04\xB2\xEC\xD9\x95\x8D\x12\xD3(I\xA7\xC6\x95\xE0\xD1e&0\x9A\b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03K\xA6\xB7\xEF.\x87-\x897nu|\xA74\xBD\xC9\x97\x91\x15\xBC*\xC1\x9B\xD3\x81S\x9C#,\xEB\x11j\xA9\xDC\x8Ak\xD9\xA9\x11)Q\xFB\x82T\xDF\xB7+iz\x15\xD7\xA5x#\x9E\xDC\xCBH\xE2\x15\xCC\xC6\xB5>\x06VZ\x1C\x91\x92\xF2\xE2Qg\xBD\xFC\x9F\xA7\xF4\e\xF4\xE1\xFCU\xF6\x17\x86W_\tP\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0E\x19\xE5[\x8C\xDB\x95\xC8C\x8F):3\\!\xCE\xAEB\x11\x92\x85\xEBmJR\x97\x17\xE6\xEB\xE0\xCB\x88\x8D\xCE\xF4\xE5\x16\xB5\xC1\xFE\xCDM\xA3\x18\x15\x9C\x8B\xB3\xB5~\x17\x92\xD4\xED\xC9I/::\x95\x94\xA9\xDB\xC65\xDB\xBB\x86VZ\x8C\xBF\x98\x96\xAD\x14\xE5\xF10\xB4u\x99i\n\xEEn&U[V\xE4\xFE\x06S\x12\xB6\\\n\xC6Zt\xE9\xBF\xA1\x99\xE2S\x98{o\xC9\xBD\xC23\xC2\xCB\xC2\x94%\e\x91j\xEAo\x95>\xED\v\xC3;\xBD \x95\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA4\xFC\xCA\xED\x8CM\xD6\xD6\x16C\xCA\xB9\x83\x95nn\xDCr,\xBE.\r9ik\x974m\xA6\xF3\f\xB6\xD7(-\xA7\xE5\xCD\xEC\x9CX\xB5\xDC\xDB\x94+U[n\t\xFDH\xD2\xDBq\xF4\x85k\xAF\xEE\xD9\x93\xF2o\"\xE4$\xE7\xDE[\xEB\\\xF4\xAB\x96\xE9\xFF\x00l\xCB\xF6\xCA\xFF\x00\xAD\b\xFENz\xB8\xF7N\xF6\xFD\xED?\xAFA~\xF9W\xB2\x1D\x18\x9F%\xDA\xB8\x9C\xBB\xAFy\x8CW\x82\x94\x13\xFA\\\x19\x13\xB2S\x14HO\xE52\xB3\rK\xB9\xF7[\x94\xFF\x00\x99+O\xEC\x82&6\xFD\x89\xD7\xF7A^\xEC\e\xB1\xDD\xEDcKy\xC9\x92\x9C%%9(\xB7\xC1\xA4\xD5~&\xBF\xB3\xA7\f\xA6\x9Dy{\x16\xCF\xB5\xE2\xED\xBB}\x8CLd\xDC-AENTs\x97\x8Dd\xCE;Ne\xD3\x11\x88v\x90\x90\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00*}\xD5\xBAF\xE5\xC8\xE2\xDAu\xD2\xDC[^o\x9F\xD0m\xAE\xBFVw\x96\xFD\x9E\xEC\xECX\x84\x17$\xB9\v&\x12S\xDCf\xD5\x11L-\x96\xB7v\xB1\xAB\xA5@\xCCr(\xB9\x8C\x0F\x8B\xD7\x94\xE3N\x02\x11*\xF6\xEDm[\xBBo)G\xD5i\xF1\x7F\xAA\xF9\x9A\xD5K-\xBBNdrq \xEBYE$\xFD\xC66\x8CKH\x97iT\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8F\xDFw\x15\x81\xB7N\xEA\xE3vm[\xB4\xBFZ_\x99q-H\xCC\xABi\xC4){v5\xCC\xBC\x97~|U}5\xF27\x99\xC3(\x8C\xAD8\xD8r\xD0e2\xD2 \xBBa\xC4e8h\x95h\x10\xCCk\xE2H\xFB\xA1\x03\x93/\x1D\\\x8C\xA2\xD5b\xD1h\x949v,\xBB\x98Yj\xC4\xDDa_\xF0\xBF\xCCM\xA30\x8A\xCE\x173\x06\xA0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00+\x1D\xE1u\xCA\xEE>585\xAB\xE3'O\xB1\x1A\xEBgv\xFD\xA7\x0E\xDCm\xC5$-)\x88NZ\x84\x12\xA23\x99]\xAB&\xC2pm\b\x94\"\xA7\x16\x9BL\xBA\xAF\xAB\x16e7E\xF4\x89\x94\xE1\xD6\xB0\xE9\x1AWS\xF2Er\x9C92,\xE9\xAA|\x1F\x8A-\x12\x89\x84.{\x85\xAB\xD6\xAEr\xB9\x19S\xDE\x9F\x02\xF0\xA4\xAD\xF8\x17z\xB8vn\x7Fz(\xC6yi\r\xE4$\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\xA1\xDC\xB75w\x15\xABO\x95\xBCxO\xE9\x9C\xD7\xE46\xA7\f\xED\xCA_\x01+\x96S\x8Bq\xF0\xAA++BJ*u\xE3\xC2>i\x94Y\xF7s\xFC\xB6@\x89\xBF\x1A92\xEA\xBA0Ua_2%0\xEE\x8A\xA2*\x97>\xE3n2\xB0\xE7\xE3\x1F\x1Fa5D\xAA;\xA4\xA3r\xC4\xE5\xA9'm\xA9\xD7\xD9\x16\x9B7\x86r\xB1\xF6\x9D\xE5\x7F\xB7po'Ur\xDE\xA4\xF9\xF3\x932\xD9\xCC\xAFN\x12\xC5\x16\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA5\xF7B\x94{\x96\xD4\xFF\x00FX\xF0\x8F\xD1+\x8C\xDB_\x8B+r\x98\xD8[xq\xAF=R\xFBY[\xF2\xBDRm\xDE\xD0\xFC\x1F\x83\x8A\xD4\xD7\xC1\x95K]\xDB9\x0E\xC3I\xCBS\x8F\x1A\xBE5\xAF\x1E>\x1F@\xC8\xE1\xB9n\xEC-\xBE\xA7\x17E\xF4\xF8\x92\x87N\x03\xFE\x0F\x02%0\x90\x8B\xA1T\xB4\xE7q\xC5\xB9\xEE&9D\xA8\xDB\x8C\x1A\xC3\xCA\x97\x1AJ\xDC\x95>\xA3\xA2\x19J\xD5\xDA\x16\x9D\x9E\xDA\xDB\xED5G\vI5Jro\xC1\x18\xEC\xF2\x96\x94\xE1.Q`\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\ngv\xC9\xAD\xEE\xDA\xF0\xE8A\xD7\xF7\xAE\ek\xE1\x95\xF9Jl\x0E\x98\xAA\xBC\x12o\x9F\xBC\x8B\xADT\xBD\xAE\xB6\xA9j\xFB\xB5\xF4\xFB\x8C\xD6m\x93\xF4?q\tF\xE4\xFA\xA1\"\xE8}\xED\xCA\x96\xDA\xF6\x89!\xDC\x9F\x1A\x95KVs\xFEZ\xE7\xEC\xB1\b\x95/w\xAF\xF4\xCC\x87Z'\x06\xB8\xFBZF\xF5\xE5\x9D\xB8Z{ZW%\xDB\xBB{\xBBN\xA7F:\x9Cy7\xE6\x8C\xAF\xE5+\xD3\x84\xA1E\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00)\x1D\xDF'\xFE\xA1\xB6\xBF\xF5`\xEB\xFB\xF37\xD7\xC3+\xF2\x98\xD8\xA3\xAB\x0E\x9C\xAA\xDF\xDAR\xCBU1\e~m\xBF/\x0F\xB0\xA2\xEF\xB9\xFD\xC7\xEE F^~\x89\x97Cn\xDC\xFD<H\x92\x1D\xC4%\xAB7\xFF\x00\x1E\xE7\xEC\xB1\b\x95/z\xAA\xDBn\xC5s\xA7\x05\xFB\xE8\xDE\xBC\xB3\xB7\vOk\\\x95\xCE\xDE\xC1\x9C\x9B\x93v\x97\x16\x92m&\xD2\xAD(\x8Co\xCC\xAFN\x12\x85V\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xA2w\xB2\x9F\xFA\x82\xD6\x9A\xB7,X\xA8\xC7\x92\xAFVf\xFA\xB8c~S\x9D\xBE\xEB\x86\x9F\xEB?\xB4\xA5\xD7\xAF\tHF\xF4$\x93\x9FQx\xD7\x83\xFA\x8A\xAC\xDFs\xEE2\x12\x8B\xCB\xE1bE\xA1Y}m\xF7)m!$$\x94\x97:\x94Y\xAB2K\xF0\xD7?e\x93\b\x95\x1Fv\xB8\xE7\x85\x91\xE7\x15U\xE3\xCAh\xE8\xAF,\xAD\xC2\xD1\xD9\x97aw\xB5\xB6\xCB\x90\xAAR\xB1\x17F\x9Ai\xF8\xA6\x9F\xB4\xC7g\x94\xB4\xA7\x10\x99(\xB0\x00\x00\x00\x00\x00\x00\x01P\x00\x00\x00\x00\x00\x00\x00(=\xF7~\x16w\xFCg%_\xE5\xE2\xF8s\xFF\x002f\xFA\xA3\xA3\x1D\x9C\xA5{{*+mS\x8Cu%6\xA8\x9F\x9F\x12/\x1DW\xAC\xF4KX\xFC&:r\x84\x9C\xE5\xFAO\xEFI\x94\x9C\xCA\xD0\xCEF\xE2\xD5\xAAF\xCC\xAB)(\xADMF\xB5\xE6\xF8U\xF0\"*e\xA7-\xA9\xD8M\x13\b\x97>%\xD9(\xAA|I\x98!'\t\xAA*\x95KF\xE1v\x98\xD3\xE3\xE0\xC9\x82T\xBD\xCEzv\xDC\xC9R\xADZn\x9Etu6\xAF,\xA7\x85\xB3\xB2\x1C_jm\xBAc\x18%kN\x98WJ\xA3k\x85x\xD0\xC7g\x94\xAFN!8Qp\x00\x00\x00\x00\x00\x00\a\xCD@T\x05@T\x05@T\x05@\xCD@T\x0F9\xF9\x85qG\xB91\x93m/\xC2\xAE4m}\xF9\x9D:\xBCXl\xE55\xDA\xAE\xDD\xDD\xB2-:\xC5\xBA\xA6\x93^\x1F\x02\x97\xE5zp\x97\xB38\xDF\x94\x94\xAC\xBBj4\xA3\x93\xA3\x7FAE\x9DR\xB1m[\xA3\x8DR\xE2\x9B\xE2\xEB\xEFde.l\xA8\xD6\xD2H\x98\x1Cx\xFC%O\x02eXw\xC1\xB2\x16sn\x8F\xF9Y{\x89\xAA%J\xDDu=\xAB9V\x8EV\xE4\x93\xFD\xA6\x91\xB5ye<.]\x88\xDB\xED\r\xA9\xCB\xEF;\t\xCB\xDE\xDB\xAF3\r\xBER\xD3_\x8C'\x8A.\x00\xA8\n\x81\x8A\x80\xA8\n\x80\xA8\n\x81\xAE\xA0f\xA0*\x02\xA0b\xA0f\xA0*\x02\xA0f\xA0y\xD7~\xA7.\xE7\xC7\xA2\xFB\xB8\xF0\xAB|\xB8\xCA\xE9\xD1\xAB\xC5\x86\xCES}\xABXm\xB0T\xAB\x8F\x82\xF7rEo\xCA\xF4\xE1+j\xFEU\xE9\xA9\xB8J\xCC\x17(\xCA\x8E\xBFJ)\x88Y\xDD7\xE8*\xB3\x9A\xFB\xE0\xBD\xE4\xA1\xC3\x19\x7F\x11\xD3\xE9,\xAB\xAA\xDC\xB9\x10\xB3F\xEB7\xF8y'\xE4\xC9\xAA%K\xDE*\xF6\xCC\xA5\xCA\xB1J\xBF\xBE\x8D\xAB\xCB+p\xB8\xF6\nQ\xEC\xDD\xA65oM\x85\x1A\xC9\xD5\xF0mq~&;|\xA5\xA6\xBF\x18O\xD4\xCDr\xA0*\x06*\x06*\x02\xA0*\x02\xA0f\xA0j\xD4\x03P\r@5\x00\xD4\x03P\x19\xD4\x03P\r@P\xBB\xD99w\f\x1Cx\xC9bE\xA5\xEDR\xB9NgF\xAE\x18\xEC\xE5)\xDB\x92\x95\x8D\xB2\xCB\x94][\x8A\xA3\xA5x\xFB\x8A\xDF\x95\xAB\xC2q\xE5\xD9\x8C\xA5\x16\xDA\x94x?K\xFA\xB8q3\xC2\xF9g'?\x1A\xD5\x8Dw.(\xC5\xB4\x95kZ\xBEI.u\x11\x04\xCBND\xFD\x11k\xCC\x91\xC7\xA9u\x19e]P\x9F\"\xAB9\xF7IW\x1E^\xE6MQ*\x8E\xE9W\x81\x91N.\x89\xAF\x84\x91\xB5yen\x16\xFE\xC4r\xFF\x00Hmz\x92\x8C\xBA<c\x1EK\xD4\xF9T\xC7o\x94\xB4\xD7\xE3\t\xEA\x99\xAET\fT\x06\xA0>u\x00\xD4\x03P\r@5\x01\xCF\xD4@:\x80:\x80:\x88\aQ\x00\xEA \x1DT\x03\xAA\x03\xAA\xBC\xC0\xA5wj\x8C\xBB\x86\xD7\x1FT\xF1\xA8\x97\xB19\x7F\xC4o\xAF\x86W\xE53\xB1\xCA\x10\xC4\xB5m\xD1\xE9Ir\xE1TV\xDC\xADW~U\xCB\x17-\xDC\xC7\xB97\x17r\x0F\xD5\x14\xEA\x97\x9D|\xF8\x15\x84\xCBZ\xC7\xC6\x9A\xB7y=R^\xA8\\^\x97\xC5\f\x98|\xE4\xCFM\x9AG\xC0A.{)\xCF\xD4\xB9\x96Cv\xA9F\\HK^T\xB5\xDA\x94_*1\b\x95cr\x8D0r]xhf\xB5\xE5\x9C\xF0\xB9v\xBCU\xAE\xDE\xC1\xB6\xB8(\xDB\xA2_\x16c~e\xAD8JkE\x165\xA0\x1A\xC0\xC6\xB05;\xBC_\x10\x1D_h\x0E\xAF\xB4\aW\xDA\x03\xAB\xED\x03\x93\xAA\xC0u@u@u@u@\xC7T\aU\x80\xEA\xB0\x1DV\x05+\xBD\xAF\\\xB3\xBCb_\\\xBA-/m$\xEB\xF6\x9D:c1,vr\xE6\xDB\xBB\xAB\"\xCC\x94%e\\\x87\x94[R-mJ\xC5\xD2\x97{\x92\xCD\xEFTl\xB8I\xC5\xC1\xCAW\x14y\xFB\x15Jv/\xDEK\xB82\x1D\xB8\xC2\xD5\xCBpQT\xD4\xD3\x9C\x9F\xC5\xB8\xAF\xA8vA\xDC\xD3s\xB92m\xE9Jv\xEE\xD7\x87\x1AG\xF2\xB1\xD9\b\xEFJ\xED;\x8E\xBB\n\xEC\xE5\n\xC9\xBE\v\xFB\n\xDA\xABVR\x8F7\x16k\xF4[^\nJ\xBF]\n\xE1l\xAA\xFB\xF7tt\xA5+6\xED\xBBJ\xB4w%G\xF6T\xD6\x9A\xD9\xDA\xE8\f\xDC\x99K\x12z\xA4\xEA\xF8Q\xBF3X\x8E\xAAL\xF4z\x1Fm_\x94\xB6\x1C)>n\xDF\xE5g&\xCF)oN\x12]R\x8B\x1DP\x1DP\x1DP4;\xBCX\x0E\xA8\x0E\xA8\x0E\xAB\x01\xD5`i\xE2\x03\x88\x0E c\x88\x19U\x03\x1C@\xC5X\n\x80\xA8\x14\x8F\x9Br\xBF\x8D\xDB+t\xC6\x94#\x7F\n\xEC}\x17\x1D:\x90\xB8\xF4\xB8\xC7\xF5\xABFt{i\xFE\xD8c\xBA:e\xE5[O\x7Fd]\xC6\xB8\xAE\xE3E)z'r\xADQyU\xD0\xEC\xEC\xCB\x9B\xBF\r\xD1\xEE\xCC8\xC5\xB9\xDE\x94\x97\xF7\xA2\xD4\x92\xF8\xA1\xDB\asm\xBE\xF4\xC2\x8D)}\xBAr\xD5\xFE\xD2;!=\xED\xFF\x00\xEB<\e\xAE)\xCBV\x9FRqR\xA7\xD4#Y\xDE\xEF\xC6\xEF\xED\xB2\xC5\x9D4\x9C\x14j\xDE\x8A\xA5\xF5\x95\x9DKF\xC8f_4v\xC6\xFAX\xEAS\xBB%\xC2.Pr\xFA\xE4V5\xC7\xF2\x9F\xD8\xE6\x97p\xE7g\xF0\xB3\x8A\xBC\xF5]\xBD\bS\xDD\xC5\x97\xED\x88S\xBB/\xB7\x7F\x7FW,ce\xF4,Z\xBF$\xADJW+\x14\xF9sK\x97\x11\xD1=^\xDF\x87f8\xB8\x96q\xA0\xEB\e0\x8C\x13\xF3\xD2\xA9_\x89\xF3\xA6s9vDa\xBB[!&\xA6\x06u\x00\xD4\xC0\xD4\xDB\xAB\x03\x15\x01P\x15`*\x06\xFE\x98\x0E\x98\x0E\x98\x0E\x98\x05o\x98\x18v\xC0\xF9v\xC0\xC7L\fh`S\xFE`\xE0\xC3p\x86&\x15\xD8+\x96b\xDD\xE9A\xAA\xA7/\xBB\x1E\x1E\xCE&\xFAg\x19\x96[#*.g\xCB\xEE\xDF\xCF\x84\xA1\x93\x84\x95\xC9/NE\xA7+wb\xFF\x00j\x0E.\x86\xD3l\xB3\x8A\xA3\xBF\xFC_j\x8E<\xF1\xE1\x97\x95\v7U.Bw%\xEAUo\x8B\xA2\xAF?2;\xCE\xC7=\x8F\x90\x9B-\x988\xC2\xFED\x93\xE5\xAA\xF5\xD7OsR+\x16\x84\xCDd\x9F\xC9L\v\x12N\x19\x996\x954\xA5\xD7\xB9O\xAE\xA5\xA2\xD0\x89\xA4\xBB\xB0\xFECm\xD9\x0E\xD6M\xCC\xFC\xA9\xB8\xBE0y\x17\\%G\xFAQ\xAA\xA9[^2\x98\xA4\xE1e\xC2\xF9Sg\x16\x12\x8C2tFK\x8A\x8C}\\?Yz\xBE\xB1\xFB\xBE\xC9\xFD_t>wa`cdI\xA8\xDC\xBFu\xBA9\xDD\xD4\xDD=\x8E\xE6\xA6\xBE\x93J\xDDI\xA3\xA6]\xBB\x8Dk\x15h\xB7\xC5QU\xD5\xF0\xF2\xA3\xA8\x8B\x9D\xAFS\xD8\xEE\\\xBD\xB3\xE1\xCE\x7F\x7F\xA5\x15&\xFC\xE3\xE9\xFC\x87\x1D\xE3\xAC\xBAk\xC3\xBA\x85R\xCE\x902\xA0\a\xD2\x80\x1A\xDD\xBE,\ft\xC0t\xC0t\xC0\xC6\x80:\xB8\x00\xE0\x03\x80\x0E\x008\x00\xE0\x06\x1E\x900\xF4\x81\x8FH\x10\xFB\xB7\xE0\xFF\x00\x19k\xAB\xCFG\x0F\xA5\x97\xAEp\xAC\xF2\xCE'\xF4\xDA\xFF\x00\x0FF\xBF\x85D\xE4\x8C7\xDE\xE9x\xFD\xDD/\xC8\x88KE\xDF\xE9:\x17[F\xAA~\x955|i\xC4\x98\xCA:>#\xFD#\xF4t|\x7F\xB4u:6\xE2\xFE\x0F\xF44\xD2\xA2r\x98vK\x92\xA7/aT\xB87\x1F\xC0\xF4\xDF\xE2i\xEC\xAF?\x81z\xE5Y\xC2\v#\xF0\x1D\x19s\xA7\xC0\xD22\xA7E\xABi\xE9\x7FN\xC7\xE9\xFD\xCD\x1C\fm\xCBH\xE1\xD7\xE9*\x96V\x902\xA8\a\xD2\xA0\x1F\x0FM@z@\xC7\xA4\a\xA4\a\xA4\x0F\xFF\xD9"
      stub_request(:get, url).
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(:status => :ok, :body => image_body, :headers => { 'Content-Type' => 'image/jpeg'})

      put :crop_image,
        url: uri_encoded_url,
        upper_left_corner: upper_left_corner,
        width: new_width.to_s,
        height: new_height.to_s
      expect(response).to have_http_status(:ok)
      cropped_image = ::Magick::ImageList.new()
      cropped_image.from_blob(response.body)
      expect(cropped_image.columns).to eq(new_width)
      expect(cropped_image.rows).to eq(new_height)
    end
  end

end
