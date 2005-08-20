#  Copyright (C) 2005 Cognovis
#  This file is part of dotLRN.
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.

ad_library {

    the dotlrn applet for Glossar

    @author Bjoern Kiesbye (kiesbye@theservice.de)
    @version $Id$
}

namespace eval dotlrn_glossar {}

ad_proc -public dotlrn_glossar::package_key {
} {
    What package does this applet deal with?
} {
    return "glossar"
}

ad_proc -public dotlrn_glossar::my_package_key {
} {
    What's my package key?
} {
    return "dotlrn-glossar"
}

ad_proc -public dotlrn_glossar::applet_key {
} {
    What's my applet key?
} {
    return "dotlrn_glossar"
}

ad_proc -public dotlrn_glossar::get_pretty_name {
} {
} {
    return "Glossar"
}

ad_proc -public dotlrn_glossar::add_applet {
} {
    Called for one time init - must be repeatable!
    @return new pkg_id or 0 on failure
} {

    # Glossar Package is Singleton and is required to be installed
    # , so just add the applet to dotlrn. And mount the
    # Glossar Package under the dotlrn_url so users are able to
    # to access Glossar from My Space.

    # Mount the Glossar Package under the Community Url
    set package_id [apm_package_id_from_key glossar]

    if {![dotlrn::is_package_mounted -package_key glossar]} {
	set com_url [dotlrn::get_url]

	array set node_info [site_node::get_from_url -url $com_url -exact]
	set parent_id $node_info(node_id)

	db_transaction {
	    set node_id [site_node::new \
			     -name glossar \
			     -parent_id $parent_id \
			     -directory_p "t" \
			     -pattern_p "t" \
			    ]
	}

	site_node::mount -node_id $node_id -object_id $package_id

    }

    dotlrn_applet::add_applet_to_dotlrn -applet_key [applet_key] -package_key [my_package_key]

}

ad_proc -public dotlrn_glossar::remove_applet {
} {
    One-time destroy for when the entire applet is removed from dotlrn.
} {
    ad_return_complaint 1 "[applet_key] remove_applet not implimented!"
}


ad_proc -public dotlrn_glossar::add_applet_to_community {
    community_id
} {
    Add the glossar applet to a specific dotlrn community

    @params community_id
} {

    # Mount the Glossar Package under the Community Url
    set package_id [apm_package_id_from_key glossar]

    set com_url [dotlrn_community::get_community_url $community_id]

    array set node_info [site_node::get_from_url -url $com_url -exact]
    set parent_id $node_info(node_id)

    db_transaction {
	set node_id [site_node::new \
			 -name glossar \
			 -parent_id $parent_id \
			 -directory_p "t" \
			 -pattern_p "t" \
			]
    }

    site_node::mount -node_id $node_id -object_id $package_id



    set portal_id [dotlrn_community::get_portal_id \
		       -community_id $community_id \
		      ]



         

    # Add the Portlet to this community 


    glossar_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id


    # this should return the package_id
    return $package_id
}

ad_proc -public dotlrn_glossar::remove_applet_from_community {
    community_id
} {
    remove the applet from the community
} {
    ad_return_complaint 1 "[applet_key] remove_applet_from_community not implimented!"
}

ad_proc -public dotlrn_glossar::add_user {
    user_id
} {
    Called once when a user is added as a dotlrn user.
    Shall we have glossar inside the user space
} {
}

ad_proc -public dotlrn_glossar::remove_user {
    user_id
} {
    Remove a user from dotlrn
} {

    # Not yet implemented.
}

ad_proc -public dotlrn_glossar::add_user_to_community {
    community_id
    user_id
} {
    Add a user to a community
} {

# We don't need this portlet inside the user space
#    set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]
 #   set portal_id [dotlrn::get_portal_id -user_id $user_id]
    

  #  glossar_portlet::add_self_to_page \
        -portal_id $portal_id \
        -package_id $package_id] \
        -param_action append


}

ad_proc -public dotlrn_glossar::remove_user_from_community {
    community_id
    user_id
} {
    Remove a user from a community
} {
}

ad_proc -public dotlrn_glossar::add_portlet {
    portal_id
} {
    Add Portlet to the Portal

    @param portal_id
} {

    glossar_portlet::add_self_to_page -portal_id $portal_id -package_id 0

}

ad_proc -public dotlrn_glossar::remove_portlet {
    portal_id
    args
} {
    A helper proc to remove the underlying portlet from the given portal.
    This is alot simpler than add_portlet.

    @param portal_id
    @param args An ns_set with the project_manager_id.
} {
    glossar_portlet::remove_self_from_page \
	-portal_id $portal_id 
}

ad_proc -public dotlrn_glossar::clone {
    old_community_id
    new_community_id
} {
    Clone this applet's content from the old community to the new one
} {
}

ad_proc -public dotlrn_glossar::change_event_handler {
    community_id
    event
    old_value
    new_value
} {
    listens for the following events: rename
} {
    switch $event {
	rename {

	    	    handle_rename -community_id $community_id -old_value\
	    	$old_value -new_value $new_value
	}
    }
}

ad_proc -private dotlrn_glossar::handle_rename {
    {-community_id:required}
    {-old_value:required}
    {-new_value:required}
} {
    When a dotlrn community is renamed
} {

}


