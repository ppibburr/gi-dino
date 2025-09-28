LIBXMPP_VALA_VER = '0.1'
LIBDINO_VER      = '0.1'
LIBQLITE_VER     = '0.1'

LIBS = ['libdino.so', 'libxmpp-vala.so', 'libqlite.so'].map do |l| [l,"#{l}.0"] end.flatten.push('libcrypto-vala.so.0')


DINO_REPO   = ENV['DINO_REPO'] ||= 'https://github.com/dino/dino';
DINO_SOURCE = File.expand_path(ENV['DINO_SOURCE_DIR'] ||= './git/dino/')
DINO_BUILD  = File.expand_path(ENV['DINO_BUILD_DIR']  ||= "#{ENV['DINO_SOURCE_DIR']}/build")
DINO_UI     = File.expand_path("./dino-ui")
BUILD       = File.expand_path("./build")
LIB_INSTALL = ENV['LIB_INSTALL'] ||= File.expand_path("/usr/lib/")
TYPELIB_INSTALL = ENV['TYPELIB_INSTALL'] ||= "/usr/lib/girepository-1.0/"
VAPI_INSTALL    = ENV['VAPI_INSTALL']    ||= "/usr/share/vala/vapi/"

TYPELIBS   = ["Xmpp-#{LIBXMPP_VALA_VER}", "Dino-#{LIBDINO_VER}", "Qlite-#{LIBQLITE_VER}"].map do |f|
  "#{BUILD}/#{f}.typelib"
end

VAPIS = ["Dino-#{LIBDINO_VER}","Xmpp-#{LIBXMPP_VALA_VER}","Qlite-#{LIBQLITE_VER}","DinoUI-#{LIBDINO_VER}","icu-uc"].map do |v|
  "#{v}.vapi"
end

XMPP=[
    'src/core/direct_tls_xmpp_stream.vala',
    'src/core/io_xmpp_stream.vala',
    'src/core/module_flag.vala',
    'src/core/namespace_state.vala',
    'src/core/stanza_attribute.vala',
    'src/core/stanza_node.vala',
    'src/core/stanza_reader.vala',
    'src/core/stanza_writer.vala',
    'src/core/starttls_xmpp_stream.vala',
    'src/core/stream_connect.vala',
    'src/core/tls_xmpp_stream.vala',
    'src/core/xmpp_log.vala',
    'src/core/xmpp_stream.vala',
    'src/glib_fixes.vapi',
    'src/module/bind.vala',
    'src/module/bookmarks_provider.vala',
    'src/module/conference.vala',
    'src/module/iq/module.vala',
    'src/module/iq/stanza.vala',
    'src/module/jid.vala',
    'src/module/message/module.vala',
    'src/module/message/stanza.vala',
    'src/module/presence/flag.vala',
    'src/module/presence/module.vala',
    'src/module/presence/stanza.vala',
    'src/module/roster/flag.vala',
    'src/module/roster/item.vala',
    'src/module/roster/module.vala',
    'src/module/roster/versioning_module.vala',
    'src/module/sasl.vala',
    'src/module/session.vala',
    'src/module/stanza.vala',
    'src/module/stanza_error.vala',
    'src/module/stream_error.vala',
    'src/module/util.vala',
    'src/module/xep/0004_data_forms.vala',
    'src/module/xep/0030_service_discovery/flag.vala',
    'src/module/xep/0030_service_discovery/identity.vala',
    'src/module/xep/0030_service_discovery/info_result.vala',
    'src/module/xep/0030_service_discovery/item.vala',
    'src/module/xep/0030_service_discovery/items_result.vala',
    'src/module/xep/0030_service_discovery/module.vala',
    'src/module/xep/0045_muc/flag.vala',
    'src/module/xep/0045_muc/module.vala',
    'src/module/xep/0045_muc/status_code.vala',
    'src/module/xep/0047_in_band_bytestreams.vala',
    'src/module/xep/0048_bookmarks.vala',
    'src/module/xep/0048_conference.vala',
    'src/module/xep/0394_message_markup.vala',
    'src/module/xep/0049_private_xml_storage.vala',
    'src/module/xep/0054_vcard/module.vala',
    'src/module/xep/0059_result_set_management.vala',
    'src/module/xep/0060_pubsub.vala',
    'src/module/xep/0065_socks5_bytestreams.vala',
    'src/module/xep/0066_out_of_band_data.vala',
    'src/module/xep/0077_in_band_registration.vala',
    'src/module/xep/0082_date_time_profiles.vala',
    'src/module/xep/0084_user_avatars.vala',
    'src/module/xep/0085_chat_state_notifications.vala',
    'src/module/xep/0104_http_scheme_url_data.vala',
    'src/module/xep/0115_entity_capabilities.vala',
    'src/module/xep/0166_jingle/component.vala',
    'src/module/xep/0166_jingle/content.vala',
    'src/module/xep/0166_jingle/content_description.vala',
    'src/module/xep/0166_jingle/content_node.vala',
    'src/module/xep/0166_jingle/content_security.vala',
    'src/module/xep/0166_jingle/content_transport.vala',
    'src/module/xep/0166_jingle/jingle_flag.vala',
    'src/module/xep/0166_jingle/jingle_module.vala',
    'src/module/xep/0166_jingle/jingle_structs.vala',
    'src/module/xep/0166_jingle/reason_element.vala',
    'src/module/xep/0166_jingle/session.vala',
    'src/module/xep/0166_jingle/session_info.vala',
    'src/module/xep/0167_jingle_rtp/content_parameters.vala',
    'src/module/xep/0167_jingle_rtp/content_type.vala',
    'src/module/xep/0167_jingle_rtp/jingle_rtp_module.vala',
    'src/module/xep/0167_jingle_rtp/payload_type.vala',
    'src/module/xep/0167_jingle_rtp/session_info_type.vala',
    'src/module/xep/0167_jingle_rtp/stream.vala',
    'src/module/xep/0176_jingle_ice_udp/candidate.vala',
    'src/module/xep/0176_jingle_ice_udp/jingle_ice_udp_module.vala',
    'src/module/xep/0176_jingle_ice_udp/transport_parameters.vala',
    'src/module/xep/0177_jingle_raw_udp.vala',
    'src/module/xep/0184_message_delivery_receipts.vala',
    'src/module/xep/0191_blocking_command.vala',
    'src/module/xep/0198_stream_management.vala',
    'src/module/xep/0199_ping.vala',
    'src/module/xep/0203_delayed_delivery.vala',
    'src/module/xep/0215_external_service_discovery.vala',
    'src/module/xep/0234_jingle_file_transfer.vala',
    'src/module/xep/0249_direct_muc_invitations.vala',
    'src/module/xep/0260_jingle_socks5_bytestreams.vala',
    'src/module/xep/0261_jingle_in_band_bytestreams.vala',
    'src/module/xep/0264_jingle_content_thumbnails.vala',
    'src/module/xep/0272_muji.vala',
    'src/module/xep/0280_message_carbons.vala',
    'src/module/xep/0297_stanza_forwarding.vala',
    'src/module/xep/0298_coin.vala',
    'src/module/xep/0300_cryptographic_hashes.vala',
    'src/module/xep/0308_last_message_correction.vala',
    'src/module/xep/0313_2_message_archive_management.vala',
    'src/module/xep/0313_message_archive_management.vala',
    'src/module/xep/0333_chat_markers.vala',
    'src/module/xep/0334_message_processing_hints.vala',
    'src/module/xep/0353_jingle_message_initiation.vala',
    'src/module/xep/0359_unique_stable_stanza_ids.vala',
    'src/module/xep/0363_http_file_upload.vala',
    'src/module/xep/0367_message_attaching.vala',
    'src/module/xep/0380_explicit_encryption.vala',
    'src/module/xep/0384_omemo/omemo_decryptor.vala',
    'src/module/xep/0384_omemo/omemo_encryptor.vala',
    'src/module/xep/0391_jingle_encrypted_transports.vala',
    'src/module/xep/0392_consistent_color/consistent_color.vala',
    'src/module/xep/0392_consistent_color/hsluv.vala',
    'src/module/xep/0402_bookmarks2.vala',
    'src/module/xep/0410_muc_self_ping.vala',
    'src/module/xep/0421_occupant_ids.vala',
    'src/module/xep/0428_fallback_indication.vala',
    'src/module/xep/0444_reactions.vala',
    'src/module/xep/0446_file_metadata_element.vala',
    'src/module/xep/0447_stateless_file_sharing.vala',
    'src/module/xep/0461_replies.vala',
    'src/module/xep/0482_call_invites.vala',
    "/src/module/xep/0231_bits_of_binary.vala",
    #'src/module/xep/pixbuf_storage.vala',
    'src/util.vala',
]

DINO = [
    'src/application.vala',
    'src/dbus/login1.vala',
    'src/dbus/notifications.vala',
    'src/dbus/upower.vala',
    'src/entity/account.vala',
    'src/entity/call.vala',
    'src/entity/conversation.vala',
    'src/entity/encryption.vala',
    'src/entity/file_transfer.vala',
    'src/entity/message.vala',
    'src/entity/settings.vala',
    'src/plugin/interfaces.vala',
    'src/plugin/loader.vala',
    'src/plugin/registry.vala',
    'src/service/avatar_manager.vala',
    'src/service/blocking_manager.vala',
    'src/service/call_store.vala',
    'src/service/call_state.vala',
    'src/service/call_peer_state.vala',
    'src/service/calls.vala',
    'src/service/chat_interaction.vala',
    'src/service/connection_manager.vala',
    'src/service/contact_model.vala',
    'src/service/content_item_store.vala',
    'src/service/conversation_manager.vala',
    'src/service/counterpart_interaction_manager.vala',
    'src/service/database.vala',
    'src/service/entity_capabilities_storage.vala',
    'src/service/entity_info.vala',
    'src/service/fallback_body.vala',
    'src/service/file_manager.vala',
    'src/service/file_transfer_storage.vala',
    'src/service/history_sync.vala',
    'src/service/jingle_file_transfers.vala',
    'src/service/message_correction.vala',
    'src/service/message_processor.vala',
    'src/service/message_storage.vala',
    'src/service/module_manager.vala',
    'src/service/muc_manager.vala',
    'src/service/notification_events.vala',
    'src/service/presence_manager.vala',
    'src/service/replies.vala',
    'src/service/reactions.vala',
    'src/service/registration.vala',
    'src/service/roster_manager.vala',
    'src/service/search_processor.vala',
    'src/service/sfs_metadata.vala',
    'src/service/stateless_file_sharing.vala',
    'src/service/stream_interactor.vala',
    'src/service/util.vala',
    'src/util/display_name.vala',
    'src/util/limit_input_stream.vala',
    'src/util/send_message.vala',
    'src/util/util.vala',
    'src/util/weak_map.vala',
    'src/util/weak_timeout.vala',
    "../build/libdino/version.vala",
    'src/service/occupant_id_store.vala'
  ]

QLITE = [
    'src/column.vala',
    'src/database.vala',
    'src/delete_builder.vala',
    'src/insert_builder.vala',
    'src/query_builder.vala',
    'src/row.vala',
    'src/statement_builder.vala',
    'src/table.vala',
    'src/update_builder.vala',
    'src/upsert_builder.vala',
]

CONVERT_OBJECT = {
  StanzaEntry: 'xmpp-vala/src/core/stanza_node.vala',
  Jid: 'xmpp-vala/src/module/jid.vala',
  Database: 'qlite/src/database.vala',
  Registry: 'libdino/src/plugin/registry.vala',
  SearchPathGenerator: 'libdino/src/util/util.vala',
  
}

task :convert_object do 
  next unless ENV['CONVERT_OBJECT']
  CONVERT_OBJECT.each do |t,f|
    buff = File.open(s="#{DINO_SOURCE}/"+f).read
    buff = buff.gsub(/class #{t} (\:|\{)/) do
      "class #{t} : GLib.Object#{($1 == ":") ? ', ' : ' {'}"
    end
    File.open(s,'w') do |o|
      o.puts buff
    end
  end
end



desc "dino source root path"
directory File.expand_path("#{DINO_SOURCE}/..")
desc "typelib build path"
directory "#{BUILD}"
desc "libdino-ui source path"
directory "#{DINO_UI}"

#=======================================================================
# libxmpp-vala
#=======================================================================
desc "make libxmpp-val .gir file"
file "#{BUILD}/Xmpp-#{LIBXMPP_VALA_VER}.gir" => ["#{BUILD}"] do |t|

  sh "cd #{BUILD} && valac -C -H xmpp.h --gir=Xmpp-#{LIBXMPP_VALA_VER}.gir "\
    "--library Xmpp-#{LIBXMPP_VALA_VER} "\
    "#{DINO_SOURCE}/xmpp-vala/#{XMPP.join(" #{DINO_SOURCE}/xmpp-vala/")} "\
    "--pkg Gio-2.0 --pkg gee-0.8 --pkg gdk-pixbuf-2.0 --pkg icu-uc "\
    "--vapidir=#{DINO_SOURCE}/xmpp-vala/vapi"

  search = /\<callback name\="OnInvalidCert".*?\<\/class\>/m

  fix = <<~EOC
    </class>
      <callback name="TlsXmppStreamOnInvalidCert" c:type="XmppTlsXmppStreamOnInvalidCert">
        <return-value transfer-ownership="full">
          <type name="gboolean" c:type="gboolean"/>
        </return-value>
        <parameters>
          <parameter name="peer_cert" transfer-ownership="none">
            <type name="Gio.TlsCertificate" c:type="GTlsCertificate*"/>
          </parameter>
          <parameter name="errors" transfer-ownership="none">
            <type name="Gio.TlsCertificateFlags" c:type="GTlsCertificateFlags"/>
          </parameter>
          <parameter name="user_data" transfer-ownership="none" closure="2">
            <type name="gpointer" c:type="void*"/>
          </parameter>
        </parameters>
      </callback>
  EOC
 
  pth = "#{BUILD}/Xmpp-#{LIBXMPP_VALA_VER}.gir"
  buff = open(pth).read
  
  File.open(pth,"w") do |f|
    f.puts buff.gsub(search, fix.strip)
  end  
end

desc "make Xmpp typelib"
file "#{BUILD}/Xmpp-#{LIBXMPP_VALA_VER}.typelib" => ["#{BUILD}/Xmpp-#{LIBXMPP_VALA_VER}.gir"] do |t|
  sh "g-ir-compiler --shared-library=libxmpp-vala "\
    "#{t.prerequisites.join(' ')} -o #{t.name}"
end

desc "test lib Xmpp"
task 'test-xmpp' do
  sh "LD_LIBRARY_PATH=#{BUILD}:#{DINO_BUILD}/xmpp-vala GI_TYPELIB_PATH=#{BUILD} ruby ./test/xmpp.rb"
end

#=======================================================================
# libqlite
#=======================================================================

desc "make Qlite .gir file"
file "#{BUILD}/Qlite-#{LIBQLITE_VER}.gir" => ["#{BUILD}"] do |t|
  sh "cd #{BUILD} && valac -C -H qlite.h --gir=Qlite-#{LIBQLITE_VER}.gir "\
    "--library Qlite-#{LIBQLITE_VER} "\
    "#{DINO_SOURCE}/qlite/#{QLITE.join(" #{DINO_SOURCE}/qlite/")} "\
    "--vapidir=#{DINO_SOURCE}/qlite/vapi "\
    "--pkg gee-0.8 --pkg sqlite3"
end

desc "make Qlite typelib"
file "#{BUILD}/Qlite-#{LIBQLITE_VER}.typelib" => ["#{BUILD}/Qlite-#{LIBQLITE_VER}.gir"] do |t|
  sh "g-ir-compiler --shared-library=libqlite "\
    "#{t.prerequisites.join(' ')} -o #{t.name}"
end

#=======================================================================
# libdino-ui
#=======================================================================

desc "extracts basic UI elements (primarily enough for audio/video calls) as libdino-ui"
task :extract_dino_ui => "#{DINO_UI}/ui.vala" do
  i=-1
	
  DINO_UI_FILES = ["./dino-ui/ui.vala",                       
	 "#{DINO_SOURCE}/main/src/ui/call_window/*.vala",    
	 "#{DINO_SOURCE}/main/src/ui/widgets/avatar_picture.vala",
	 "#{DINO_SOURCE}/main/src/ui/add_conversation/select_contact_dialog.vala",
	 "#{DINO_SOURCE}/main/src/ui/util/accounts_combo_box.vala",
	 "#{DINO_SOURCE}/main/src/ui/add_conversation/add_contact_dialog.vala",
	 "#{DINO_SOURCE}/main/src/ui/add_conversation/select_jid_fragment.vala",
	 "#{DINO_SOURCE}/main/src/ui/add_conversation/list_row.vala",
	 "#{DINO_SOURCE}/main/src/ui/add_conversation/roster_list.vala",
	 "#{DINO_SOURCE}/main/src/ui/util/helper.vala"].map do |q|
	q=File.expand_path("#{q}")
    Dir.glob(q).map do |q| q end
  end.flatten.map do |q|  
    i+=1
    next q if i == 0
	  
    sh "cp #{q} #{q="#{DINO_UI}/#{File.basename(q)}"}"
	  
	q
  end.join(" ")

  buff = open(pth="#{DINO_UI}/call_window_controller.vala").read
  File.open(pth,"w") do |f|
	f.puts buff.gsub("var app = GLib.Application.get_default() as", "//var app = GLib.Application.get_default() as").
	  gsub("inhibit_cookie = ", "inhibit_cookie = 1; //").
	  gsub("app.uninhibit", "//app.uninhibit")
  end
end

desc "make DinoUI .gir file"
file "#{BUILD}/DinoUI-#{LIBDINO_VER}.gir" => ["#{BUILD}", :extract_dino_ui] do |t|
  sh "cp #{DINO_SOURCE}/libdino/src/dino_i18n.h #{BUILD}/"
  sh "glib-compile-resources --sourcedir=#{DINO_SOURCE}/main/data #{DINO_SOURCE}/main/data/gresource.xml --generate-source --target=#{DINO_UI}/resources.c"
  sh "cd #{BUILD} && valac --gresourcesdir=#{DINO_UI} "\
    "--gresources #{File.expand_path("#{DINO_SOURCE}/main/data/gresource.xml")} "\
    "-X -DGETTEXT_PACKAGE='dino_not_gettext' -o ./libdino-ui.so -X -I./ -X -fPIC "\
    "-X -shared -H dino-ui.h --gir=DinoUI-#{LIBDINO_VER}.gir --library DinoUI-#{LIBDINO_VER} "\
    "#{DINO_UI}/resources.c "\
    "#{DINO_UI_FILES} ../test/dino.vala --vapidir=./ --vapidir=#{DINO_SOURCE}/main/vapi/ --pkg gtk4 "\
    "--vapidir=#{DINO_SOURCE}/libdino/vapi --vapidir=#{DINO_BUILD}/exports "\
    "--vapidir=#{BUILD} --pkg Dino-#{LIBDINO_VER} --pkg Xmpp-#{LIBXMPP_VALA_VER} --pkg gee-0.8 --pkg Qlite-#{LIBQLITE_VER} --pkg icu-uc --pkg Adw-1 --pkg posix"
end

desc "build libdino-ui and typelib for DinoUI"
file "#{BUILD}/DinoUI-#{LIBDINO_VER}.typelib" => ["#{BUILD}/DinoUI-#{LIBDINO_VER}.gir"] do |t|
  
  sh "GI_TYPELIB_PATH=#{BUILD} g-ir-compiler --includedir=#{BUILD} "\
    "--shared-library=libdino-ui #{t.prerequisites.join(' ')} -o #{t.name}"
end

# gettext :/
file "#{DINO_UI}/ui.vala" => [] do |t|
  File.open(t.name, "w") do |f|
    code = <<~EOC
      public string dino_not_gettext(string s) {
        return s;	
      }
      namespace Dino.Ui {
      public class Application : Dino.Application, Gtk.Application {
        public Database db {get;set;}
        public SearchPathGenerator? search_path_generator {get;set;}
        public StreamInteractor stream_interactor {get;set;}
        public Plugins.Registry plugin_regsitry {get;set;}
        public Dino.Entities.Settings settings {get;set;}
        public Application(string id, GLib.ApplicationFlags flags) {
          Object(application_id: id,flags: flags);
        }
        public void handle_uri(string a, string b, Gee.Map<string,string> c) {
        
        } 
      }
      }
    EOC
    
    f.puts code
  end 
end

#=======================================================================
# Dino
#=======================================================================

desc "clone dino-im/dino (https://github.com/dino-im/dino.git)"
task :'clone-dino' => File.expand_path("#{DINO_SOURCE}/..") do
  sh "cd #{File.expand_path("#{DINO_SOURCE}/..")} && git clone #{DINO_REPO}"
end

desc "Apply a few small changes to dino to support gobject-introspection"
task :fix_dino => :convert_object do
  buff = File.open(pth="#{DINO_SOURCE}/meson.build").read
  buff = buff.gsub("subdir('main')",'')
  File.open(pth,"w") do |o| o.puts buff end

  buff = File.open("#{DINO_SOURCE}/libdino/src/application.vala").read
  
  {
    "Database" => :db, "Dino.Entities.Settings" => :settings, "SearchPathGenerator?" => :search_path_generator, 
    "Plugins.Registry" => :plugin_registry, "StreamInteractor" => :stream_interactor
  }.each do |t,n|
	  replace = <<~EOC
		  public #{t} #{n} {
			get {
				var v=Value(typeof(#{t}));
				this.get_property("#{n}", ref v);
				return ((#{t})v);
			}
			
			set {
				var v=Value(typeof(#{t}));
				v = value;
				this.set_property("#{n}", v);
			}
		  }
	  EOC
	  
	  buff = buff.gsub(x="public abstract #{t} #{n} { get; set; }", replace)
	  p x
  end
  
  File.open("#{DINO_SOURCE}/libdino/src/application.vala","w") do |o|
    o.puts buff
  end

  buff = File.open(pth="#{DINO_SOURCE}/libdino/src/service/stream_interactor.vala").read
  buff = buff.gsub("public class StreamInteractor : Object {") do
    <<~EOC
      public class StreamInteractor : Object {
        public StreamInteractionModule? get_module_by_type(Type t) {
          foreach (StreamInteractionModule module in modules) {
            if (module.get_type() == t) return module;
          }
          return null;
        }
          
		public ArrayList<StreamInteractionModule> interaction_modules { 
		  owned get { 
			  
			  var a = new ArrayList<StreamInteractionModule>();
			  foreach (var m in modules) {
				  a.add(m);
			  }
			  return a;
		  }
		}    
        
    EOC
  end
  
  File.open(pth,"w") do |o| o.puts buff end
  
  buff = File.open(pth="#{DINO_SOURCE}/libdino/src/util/weak_map.vala").read
  
  File.open pth, "w" do |f|
    buff = "namespace Dino {\n#{buff}\n}\n"
    
    f.puts buff
  end
  
  buff = open(pth="#{DINO_SOURCE}/xmpp-vala/src/module/xep/0392_consistent_color/hsluv.vala").read
  
  File.open pth, "w" do |f|
    buff = "namespace Xmpp {\n#{buff}\n}\n"
    
    f.puts buff
  end
  
  buff = open(pth="#{DINO_SOURCE}/xmpp-vala/src/core/io_xmpp_stream.vala").read
  
  File.open pth, "w" do |f|
    buff = buff.gsub(x="public abstract class Xmpp.IoXmppStream : XmppStream {", "#{x}\n    public signal void stanza_send(StanzaNode node);\n")
    buff = buff.gsub(x="public override async void write_async(StanzaNode node, int io_priority = Priority.DEFAULT, Cancellable? cancellable = null) throws IOError {", "#{x}\n		stanza_send(node);\n")
    
    f.puts buff
  end
end


task :'build_dino_' => [:fix_dino] do
  sh "cd #{DINO_SOURCE} && meson setup build"
  sh "cd #{DINO_SOURCE} && meson compile -C build" 
  sh "cp #{DINO_BUILD}/plugins/*/*.so #{DINO_BUILD}/plugins/"
  sh "mkdir -p #{DINO_BUILD}/exports"
  sh "cp #{DINO_BUILD}/*/*.vapi #{DINO_BUILD}/exports/"
  sh "cp #{DINO_SOURCE}/main/vapi/*.vapi #{DINO_BUILD}/exports"
end

task :'fix-deps' do  
  ['xmpp-vala.deps', 'dino.deps', 'qlite.deps'].each do |f|
    b = f=='dino.deps'
    buff = open(pth="#{DINO_SOURCE}/#{((q=f.split(".")[0]) == 'dino') ? 'libdino' : q}/#{f}").read
    File.open(pth,"w") do |o| o.puts buff.gsub("-e ", "") end
  end   
end  

desc "build dino-im/dino (libqlite, libxmpp-vala, libdino)"
task :"build-dino" => [:'build_dino_', :'fix-deps'] do

end

#=======================================================================
# libdino
#=======================================================================

desc "make Dino .gir file" 
file "#{BUILD}/Dino-#{LIBDINO_VER}.gir" => ["#{BUILD}"] do |t|
  sh "cd #{BUILD} && valac -C -H dino.h --gir=Dino-#{LIBDINO_VER}.gir "\
    "--library Dino-#{LIBDINO_VER} #{DINO_SOURCE}/libdino/#{DINO.join(" #{DINO_SOURCE}/libdino/")} "\
    "--vapidir=./ --vapidir=#{DINO_SOURCE}/main/vapi/ --pkg gtk4 --vapidir=#{DINO_SOURCE}/libdino/vapi "\
    "--vapidir=#{DINO_BUILD}/exports --vapidir=#{BUILD} "\
    "--pkg Gio-2.0 --pkg gee-0.8 --pkg Xmpp-#{LIBXMPP_VALA_VER} --pkg Qlite-#{LIBQLITE_VER} "\
    "--pkg sqlite3 --pkg gdk-pixbuf-2.0  --pkg icu-uc"
end

desc "build typelib for libdino"
file "#{BUILD}/Dino-#{LIBDINO_VER}.typelib" => ["#{BUILD}/Dino-#{LIBDINO_VER}.gir"] do |t|
  sh "GI_TYPELIB_PATH=#{BUILD} g-ir-compiler --includedir=#{BUILD} "\
    "--shared-library=libdino #{t.prerequisites.join(' ')} -o #{t.name}"
end

desc "test libdino"
task :'test-dino' do
  sh "LD_LIBRARY_PATH=#{BUILD}:#{DINO_BUILD}/crypto-vala:#{DINO_BUILD}/xmpp-vala:#{DINO_BUILD}/qlite:#{DINO_BUILD}/libdino GI_TYPELIB_PATH=#{BUILD} ruby ./test/dino.rb"
end

#=======================================================================
# general tasks
#=======================================================================

desc "remove generated source,gir, typelib and .o files"
task :clean do
  sh "rm -rf #{DINO_UI} #{BUILD}/*.o #{BUILD}/*.c #{BUILD}/*.gir #{BUILD}/*.typelib"
rescue
end

desc "clobber"
task :clobber => :clean do
  sh "rm -rf #{DINO_SOURCE}"
end

task :install do
  sh "mkdir -p #{LIB_INSTALL}/gi-dino/plugins"
  sh "cp #{BUILD}/libdino-ui.so #{LIB_INSTALL}"
  
  LIBS.each do |l|
    sh "cp #{DINO_BUILD}/*/#{l} #{LIB_INSTALL}"
  end
  
  sh "cp #{DINO_BUILD}/plugins/*.so #{LIB_INSTALL}/gi-dino/plugins/"
  sh "cp #{BUILD}/*.typelib #{TYPELIB_INSTALL}/"
  sh "cp #{BUILD}/*.vapi #{VAPI_INSTALL}/"
  sh "cp #{DINO_BUILD}/exports/*.vapi #{VAPI_INSTALL}/"
  
  sh "mkdir -p sample/bin"
  
  puts "\n\nCompile Vala sample\n"
  
  sh "valac sample/dino.vala "\
    "--pkg gio-2.0 --pkg DinoUI-0.1 --pkg Dino-0.1 --pkg Xmpp-0.1 --pkg gee-0.8 "\
    "--pkg Qlite-0.1 --pkg gtk4 -X -I/usr/include/gi-dino -X -ldino "\
    "-o sample/bin/dino -X -fPIC"
    
  puts <<~EOC
    \n\nNOTE:\nvala sample @ ./sample/bin/dino
    # Basic usage of libdino via GObject-Introspection - Ruby example
    ruby sample/dino.rb
    # Reference implentation of the GIDX (GI Dino Xmpp) library in Ruby
    ruby sample/gidx.rb
  EOC
end

task :uninstall do
  sh "rm #{LIB_INSTALL}/libdino-ui.so"
  LIBS.each do |l|
    sh "rm #{LIB_INSTALL}/#{l}"
  end
  sh "rm -rf #{LIB_INSTALL}/gi-dino"
  TYPELIBS.each do |f|
    sh "rm /usr/lib/girepository-1.0/#{File.basename(f)}"
  end
  VAPIS.each do |v|
    sh "rm /usr/share/vala/vapi/#{v}"
  end
end

desc "builds all libs and typelibs for dino GI usage, run after `rake clone-dino && rake build-dino` "
task :default => [
	"#{DINO_UI}", "#{DINO_UI}/ui.vala", "#{BUILD}/Xmpp-#{LIBXMPP_VALA_VER}.typelib", 
	"#{BUILD}/Qlite-#{LIBDINO_VER}.typelib", "#{BUILD}/Dino-#{LIBDINO_VER}.typelib", 
	"#{BUILD}/DinoUI-#{LIBDINO_VER}.typelib"
] do
  
end

desc "build"
task :build => [:'build-dino', :default] do

end

desc "test py"
task :'test-python' do
  sh "LD_LIBRARY_PATH=#{BUILD}:#{DINO_BUILD}/crypto-vala:#{DINO_BUILD}/xmpp-vala:#{DINO_BUILD}/qlite:#{DINO_BUILD}/libdino GI_TYPELIB_PATH=#{BUILD} python3 ./test/dino.py"
end

desc "test"
task :test => [:'test-xmpp', :'test-dino', :'test-python'] do
  sh "valac test/dino.vala --vapidir=#{BUILD} --vapidir=#{DINO_BUILD}/exports "\
    "--pkg gio-2.0 --pkg DinoUI-0.1 --pkg Dino-0.1 --pkg Xmpp-0.1 --pkg gee-0.8 "\
    "--pkg Qlite-0.1 --pkg gtk4 -X -I#{BUILD} -X -L#{DINO_BUILD}/libdino -X -ldino "\
    "-X -L#{DINO_BUILD}/xmpp-vala -X -lxmpp-vala -X -L#{DINO_BUILD}/qlite -X -lqlite -o #{BUILD}/test_vala -X -fPIC"
  sh "LD_LIBRARY_PATH=#{DINO_BUILD}/libdino ./build/test_vala"
end

desc "help"
task :help do
  puts <<~EOH
    # export DINO_REPO="https://github.com/dino/dino"
    rake clone-dino
    # export DINO_SOURCE="./git/dino"
    # export DINO_BUILD="./git/dino/build"
    # export BUILD="./build"
    ## convert some types of GTypeInstance to inherit GObject instead
    # export CONVERT_OBJECT=true
    rake build
    rake test
    # export LIB_INSTALL="/usr/lib"
    rake install
  EOH
end
