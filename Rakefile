XMPP_VALA_VER = '0.1'
LIBDINO_VER   = '0.0'

directory "./build"
directory "./src/dino-ui"

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
    'src/module/xep/pixbuf_storage.vala',
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
    'src/version.vala'
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

def file_insert pth, match
  buff = open(pth).read
  
  File.open(pth, "w") do |f|
    if buff =~ match
    else
      buff = buff.strip
      buff[-1]="\n"
      buff << yield
    end
    f.puts buff
  end
end

def file_gsub pth, match, srch
  buff = open(pth).read
  
  File.open(pth, "w") do |f|
    if buff =~ match
    else
      buff = buff.gsub(srch, yield)
    end
    f.puts buff
  end
end

#
# xmpp-vala
#

file "./build/Xmpp-#{XMPP_VALA_VER}.gir" => ["./build"] do |t|
exit
  sh "cd build && valac -C -H xmpp.h --gir=Xmpp-#{XMPP_VALA_VER}.gir --library Xmpp-#{XMPP_VALA_VER} ../../dino/xmpp-vala/#{XMPP.join(" ../../dino/xmpp-vala/")} --pkg Gio-2.0 --pkg gee-0.8 --pkg gdk-pixbuf-2.0 --pkg icu-uc --vapidir=../../dino/xmpp-vala/vapi"

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
 
  pth = "./build/Xmpp-#{XMPP_VALA_VER}.gir"
  buff = open(pth).read
  
  File.open(pth,"w") do |f|
    f.puts buff.gsub(search, fix.strip)
  end  
end

file "./build/Xmpp-#{XMPP_VALA_VER}.typelib" => ["./build/Xmpp-#{XMPP_VALA_VER}.gir"] do |t|
  sh "g-ir-compiler --shared-library=../dino/build/libxmpp-vala.so #{t.prerequisites.join(' ')} -o #{t.name}"
end

#
# QLite
#

file "./build/Qlite-#{LIBDINO_VER}.gir" => ["./build"] do |t|
   sh "cd build && valac -C -H qlite.h --gir=Qlite-#{LIBDINO_VER}.gir --library Qlite-#{LIBDINO_VER} ../../dino/qlite/#{QLITE.join(" ../../dino/qlite/")}  --vapidir=../../dino/qlite/vapi --pkg gee-0.8 --pkg sqlite3"
end

file "./build/Qlite-#{LIBDINO_VER}.typelib" => ["./build/Qlite-#{LIBDINO_VER}.gir"] do |t|
  sh "g-ir-compiler --shared-library=../dino/build/qlite #{t.prerequisites.join(' ')} -o #{t.name}"
end

#
# libdino
#

file "./build/Dino-#{LIBDINO_VER}.gir" => ["./build"] do |t|
  sh "cd build && valac -C -H dino.h --gir=Dino-#{LIBDINO_VER}.gir --library Dino-#{LIBDINO_VER} ../../dino/libdino/#{DINO.join(" ../../dino/libdino/")} --vapidir=./ --vapidir=../../dino/main/vapi/ --pkg gtk4 --vapidir=../../dino/libdino/vapi --vapidir=../../dino/build/exports --vapidir=../build --pkg Gio-2.0 --pkg gee-0.8 --pkg Xmpp-0.1 --pkg Qlite-0.0 --pkg sqlite3 --pkg gdk-pixbuf-2.0  --pkg icu-uc"
end

desc "build typelib for libdino (Dino)"
file "./build/Dino-#{LIBDINO_VER}.typelib" => ["./build/Dino-#{LIBDINO_VER}.gir"] do |t|
  sh "GI_TYPELIB_PATH=./build g-ir-compiler --includedir=./build --shared-library=../dino/build/libdino.so #{t.prerequisites.join(' ')} -o #{t.name}"
end

#
# libdino-ui
#

task :extract_dino_ui do
	i=-1
	
	DINO_UI = %w[../src/dino-ui/ui.vala ../../dino/main/src/ui/call_window/*.vala ../../dino/main/src/ui/widgets/avatar_picture.vala ../../dino/main/src/ui/add_conversation/select_contact_dialog.vala ../../dino/main/src/ui/util/accounts_combo_box.vala ../../dino/main/src/ui/add_conversation/add_contact_dialog.vala ../../dino/main/src/ui/add_conversation/select_jid_fragment.vala ../../dino/main/src/ui/add_conversation/list_row.vala ../../dino/main/src/ui/add_conversation/roster_list.vala ../../dino/main/src/ui/util/helper.vala].map do |q|
	  q=File.expand_path("./build/#{q}")
	  Dir.glob(q).map do |q| q end
	end.flatten.map do |q|  

	  i+=1
	  next q if i == 0
	  
	  sh "cp #{q} #{q="./src/dino-ui/#{File.basename(q)}"}"
	  
	  
	  q=".#{q}"
	end.join(" ")

	buff = open(pth="./src/dino-ui/call_window_controller.vala").read
	File.open(pth,"w") do |f|
	  f.puts buff.gsub("var app = GLib.Application.get_default() as", "//var app = GLib.Application.get_default() as").
		gsub("inhibit_cookie = ", "inhibit_cookie = 1; //").
		gsub("app.uninhibit", "//app.uninhibit")
	end
end

file "./build/DinoUI-#{LIBDINO_VER}.gir" => ["./build", :extract_dino_ui] do |t|
  sh "cp ../dino/build/exports/dino_i18n.h ./build/"
  sh "cd build && valac --gresourcesdir=#{File.expand_path("../dino/build/main/resources")} --gresources #{File.expand_path("../dino/main/data/gresource.xml")} -X -DGETTEXT_PACKAGE='dino_not_gettext' -o ./libdino-ui.so -X -I./ -X -fPIC -X -shared -H dino-ui.h --gir=DinoUI-#{LIBDINO_VER}.gir --library DinoUI-#{LIBDINO_VER} #{File.expand_path("../dino/build/main/resources")}/resources.c #{DINO_UI}  --vapidir=./ --vapidir=../../dino/main/vapi/ --pkg gtk4 --vapidir=../../dino/libdino/vapi --vapidir=../../dino/build/exports --vapidir=../build --pkg Dino-0.0 --pkg Xmpp-0.1 --pkg gee-0.8 --pkg Qlite-0.0 --pkg icu-uc"
end

desc "build lib DinoUI"
file "./build/DinoUI-#{LIBDINO_VER}.typelib" => ["./build/DinoUI-#{LIBDINO_VER}.gir"] do |t|
  sh "GI_TYPELIB_PATH=./build g-ir-compiler --includedir=./build --shared-library=./build/libdino-ui.so #{t.prerequisites.join(' ')} -o #{t.name}"
end

#
#
#
file "./src/dino-ui/ui.vala" => [] do |t|
  File.open(t.name, "w") do |f|
    code = <<~EOC
      public string dino_not_gettext(string s) {
        return s;	
      }
      
      namespace Dino {

          
          public class GIUIApplication : Application, Gtk.Application {
            public Database db { get; set; }
            public Dino.Entities.Settings settings { get; set; }
            public StreamInteractor stream_interactor { get; set; }
            public Dino.Plugins.Registry plugin_registry { get; set; default=new Plugins.Registry(); }
            public SearchPathGenerator? search_path_generator { get; set; }
         
            public virtual void handle_uri(string jid, string query, Gee.Map<string, string> options) {
              
            }
            
            public StreamInteractionModule? get_stream_interaction_module(Type t) {
              return stream_interactor.get_module_by_type(t);
            }
          }
      }
    EOC
    
    f.puts code
  end 
end

desc "clone dino proper"
task :'clone-dino' do
  sh 'cd .. && git clone https://github.com/dino/dino'
end

task :fix_dino do
  file_insert "../dino/libdino/src/application.vala", /GIApplication/ do
    <<~EOC
          
        public class GIApplication : Application, GLib.Application {
          public Database db { get; set; }
          public Dino.Entities.Settings settings { get; set; }
          public StreamInteractor stream_interactor { get; set; }
          public Dino.Plugins.Registry plugin_registry { get; set; default=new Plugins.Registry(); }
          public SearchPathGenerator? search_path_generator { get; set; }
       
          public virtual void handle_uri(string jid, string query, Gee.Map<string, string> options) {
            
          }
          
          public StreamInteractionModule? get_stream_interaction_module(Type t) {
            return stream_interactor.get_module_by_type(t);
          }
        }
      }
    EOC
  end

  file_gsub("../dino/libdino/src/service/stream_interactor.vala", /get_module_by_type/, "public class StreamInteractor : Object {") do
    <<~EOC
      public class StreamInteractor : Object {
        public StreamInteractionModule? get_module_by_type(Type t) {
          foreach (StreamInteractionModule module in modules) {
            if (module.get_type() == t) return module;
          }
          return null;
        }    
        
    EOC
  end
  
  buff = open(pth="../dino/libdino/src/util/weak_map.vala").read
  File.open pth, "w" do |f|
    
    if buff =~ /namespace Dino/
    else
      buff = "namespace Dino {\n#{buff}\n}\n"
    end
    f.puts buff
  end
  
  buff = open(pth='../dino/xmpp-vala/src/module/xep/0392_consistent_color/hsluv.vala').read
  File.open pth, "w" do |f|
    
    if buff =~ /namespace Xmpp/
    else
      buff = "namespace Xmpp {\n#{buff}\n}\n"
    end
    f.puts buff
  end
end

desc "build dino proper"
task :'build-dino' => [:fix_dino] do
  sh 'cd ../dino && ./configure'
  sh 'cd ../dino && make' 
  
  ['xmpp-vala.deps', 'dino.deps', 'qlite.deps'].each do |f|
    buff = open(pth="../dino/build/exports/#{f}").read
    File.open(pth,"w") do |o| o.puts buff.gsub("-e ", "") end
  end   
end  

desc "test lib Dino"
task :'test-dino' do
  sh "LD_LIBRARY_PATH=./build GI_TYPELIB_PATH=./build ruby ./test/dino.rb"
end

desc "test lib Xmpp"
task 'test-xmpp' do
  sh "LD_LIBRARY_PATH=./build GI_TYPELIB_PATH=./build ruby ./test/xmpp.rb"
end

desc "remove generated source and .o files"
task :clean do
  sh "rm -rf src build/*.o build/*.c"
rescue
end

desc "builds all libs and typelibs for dino GI usage, run after `rake clone-dino && rake build-dino` "
task :default => [
                    './src/dino-ui', "./src/dino-ui/ui.vala", "./build/Xmpp-#{XMPP_VALA_VER}.typelib", 
                    "./build/Qlite-#{LIBDINO_VER}.typelib", "./build/Dino-#{LIBDINO_VER}.typelib", 
                    "./build/DinoUI-#{LIBDINO_VER}.typelib"
                 ] do
  
end
