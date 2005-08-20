--
--  Copyright (C) 2005 Cognovis
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

-- The dotlrn-glossar applet's implimentation of the dotlrn applet contract
--
-- 
--
-- $Id: dotlrn-glossar-create.sql
--

create function inline_0()
returns integer as '
declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl__new (
		''dotlrn_applet'',
		''dotlrn_glossar'',
		''dotlrn_glossar''
	);

	-- GetPrettyName
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''GetPrettyName'',
	       ''dotlrn_glossar::get_pretty_name'',
	       ''TCL''
	);

	-- AddApplet
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''AddApplet'',
	       ''dotlrn_glossar::add_applet'',
	       ''TCL''
	);

	-- RemoveApplet
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''RemoveApplet'',
	       ''dotlrn_glossar::remove_applet'',
	       ''TCL''
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''AddAppletToCommunity'',
	       ''dotlrn_glossar::add_applet_to_community'',
	       ''TCL''
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''RemoveAppletFromCommunity'',
	       ''dotlrn_glossar::remove_applet_from_community'',
	       ''TCL''
	);

	-- AddUser
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''AddUser'',
	       ''dotlrn_glossar::add_user'',
	       ''TCL''
	);

	-- RemoveUser
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''RemoveUser'',
	       ''dotlrn_glossar::remove_user'',
	       ''TCL''
	);

	-- AddUserToCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''AddUserToCommunity'',
	       ''dotlrn_glossar::add_user_to_community'',
	       ''TCL''
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_glossar'',
	       ''RemoveUserFromCommunity'',
	       ''dotlrn_glossar::remove_user_from_community'',
	       ''TCL''
	);

    -- AddPortlet
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_glossar'',
        ''AddPortlet'',
        ''dotlrn_glossar::add_portlet'',
        ''TCL''
    );

    -- RemovePortlet
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_glossar'',
        ''RemovePortlet'',
        ''dotlrn_glossar::remove_portlet'',
        ''TCL''
    );

    -- Clone
    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_glossar'',
        ''Clone'',
        ''dotlrn_glossar::clone'',
        ''TCL''
    );

    foo := acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_glossar'',
        ''ChangeEventHandler'',
        ''dotlrn_glossar::change_event_handler'',
        ''TCL''
    );

	-- Add the binding
	perform acs_sc_binding__new (
	    ''dotlrn_applet'',
	    ''dotlrn_glossar''
	);

	return 0;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();
