Name:		sas_path_id
Version:	1.0
Release:	1%{?dist}
Summary:	Improves the format of by-path symlinks for SAS devices

Group:		System Environment/Daemons
License:	GPLv2+

Source:		%{name}-%{version}.tar.gz
BuildRequires:	systemd-devel
Requires:	systemd

%description

Improves the format of the by-path symlinks for SAS devices.

The original scheme uses the disk's SAS address and LUN;
the new scheme introduced by this package uses the SAS address
of the nearest expander (if available) and the PHY ID number of
the connection.


%prep
%setup -q


%build
make %{?_smp_mflags}


%install
make install DESTDIR=%{buildroot}


%files
/lib/udev/sas_path_id
/lib/udev/rules.d/61-sas-storage.rules

