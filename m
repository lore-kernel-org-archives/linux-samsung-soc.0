From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [U-boot] Odroidxu3/4 -s2mps11 bind pmic failed
Date: Tue, 2 Jan 2018 23:17:06 +0100
Message-ID: <20180102231706.7b7f446d@jawa>
References: <CANAwSgSrNEfy-78cYRm+HeBa_MDk1xn5P4neYJPiDW-RpfW-Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1mn2mUnJqmf_sY4_JQ/F5jP"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40994 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750917AbeABWRQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 17:17:16 -0500
In-Reply-To: <CANAwSgSrNEfy-78cYRm+HeBa_MDk1xn5P4neYJPiDW-RpfW-Gw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-samsung-soc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>

--Sig_/1mn2mUnJqmf_sY4_JQ/F5jP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Jan 2018 01:54:57 +0530
Anand Moon <linux.amoon@gmail.com> wrote:

> Hi All,
>=20
> I would like to get the s2mps11 regulator binding for u-boot to work
> on Odroid XU3/XU4
> as in case of Odroid U3 we have max77686_bind function which dose the
> job.
>=20
> what will be the correct way to reset s2mps11 control register to the
> default values
> in-order to support reset of some regulators.
>=20
> Below is the command I tried to gather some information but it failed.
>=20
> Best Regards
> -Anand Moon
> -------------------------------------------------------------------------=
----------------------------------------------------------------
> U-Boot 2018.01-rc3-00060-g1314bd1 (Jan 02 2018 - 17:56:26 +0000) for
> ODROID-XU3/XU4/HC1
>=20
> CPU:   Exynos5422 @ 800 MHz
> Model: Odroid XU3 based on EXYNOS5422
> Board: Odroid XU3 based on EXYNOS5422
> Type:  xu4
> DRAM:  2 GiB
> MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1
> *** Warning - bad CRC, using default environment
>=20
> In:    serial
> Out:   serial
> Err:   serial
> Net:   No ethernet found.
> Hit any key to stop autoboot:  0
> Card did not respond to voltage select!
> mmc_init: -95, time 11
> switch to partitions #0, OK
> mmc0 is current device
> Scanning mmc 0:1...
> reading /exynos5422-odroidxu4.dtb
> 62815 bytes read in 9 ms (6.7 MiB/s)
> starting USB...
> USB0:   USB EHCI 1.00
> USB1:   Register 2000140 NbrPorts 2
> Starting the controller
> USB XHCI 1.00
> USB2:   Register 2000140 NbrPorts 2
> Starting the controller
> USB XHCI 1.00
> scanning bus 0 for devices... 1 USB Device(s) found
> scanning bus 1 for devices... 3 USB Device(s) found
> scanning bus 2 for devices... 2 USB Device(s) found
>        scanning usb for storage devices... 0 Storage Device(s) found
>        scanning usb for ethernet devices... 1 Ethernet Device(s) found
> Waiting for Ethernet connection... done.
> BOOTP broadcast 1
> BOOTP broadcast 2
> DHCP client bound to address 10.0.0.144 (1200 ms)
> *** Warning: no boot file name; using '0A000090.img'
> Using r8152#0 device
> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> through gateway 10.0.0.1
> Filename '0A000090.img'.
> Load address: 0x43e00000
> Loading: *
> TFTP error: 'File not found' (1)
> Not retrying...
> missing environment variable: pxeuuid
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A000090
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A00009
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A0000
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A000
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A00
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A0
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0A
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/0
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/default-arm-exynos
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/default-arm
> *** ERROR: `serverip' not set
> missing environment variable: bootfile
> Retrieving file: pxelinux.cfg/default
> *** ERROR: `serverip' not set
> Config file not found
> BOOTP broadcast 1
> DHCP client bound to address 10.0.0.144 (644 ms)
> Using r8152#0 device
> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> through gateway 10.0.0.1
> Filename 'boot.scr.uimg'.
> Load address: 0x50000000
> Loading: *
> TFTP error: 'File not found' (1)
> Not retrying...
> BOOTP broadcast 1
> BOOTP broadcast 2
> DHCP client bound to address 10.0.0.144 (1257 ms)
> Using r8152#0 device
> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> through gateway 10.0.0.1
> Filename 'boot.scr.uimg'.
> Load address: 0x42000000
> Loading: *
> TFTP error: 'File not found' (1)
> Not retrying...
> ODROID-XU3 #
> ODROID-XU3 #
> ODROID-XU3 # pmic s2mps11 dump
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address

First try to:

pmic list
pmic dev s2mps11_pmic@66

pmic dump
pmic write 0xXX for your device



>=20
> ODROID-XU3 # pmic list
> | Name                            | Parent name         | Parent
> uclass @ seq | s2mps11_pmic@66                 | i2c@12CA0000
> | i2c @ 4 ODROID-XU3 # pmic s2mps11_pmic dump
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address
>=20
> ODROID-XU3 # pmic dump
> First, set the PMIC device!
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address
>=20
> ODROID-XU3 # pmic s2mps11_pmic
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address
>=20
> ODROID-XU3 # pmic read
> First, set the PMIC device!
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address
>=20
> ODROID-XU3 # pmic read 12CA0000
> First, set the PMIC device!
> pmic -  operations
>=20
> Usage:
> pmic list          - list pmic devices
> pmic dev [name]    - show or [set] operating PMIC device
> pmic dump          - dump registers
> pmic read address  - read byte of register at address
> pmic write address - write byte to register at address
>=20
> ODROID-XU3 #



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/1mn2mUnJqmf_sY4_JQ/F5jP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlpMBOIACgkQAR8vZIA0
zr2B/AgAs6nulYB751iqqcQ19or0AHFa+Z+Ag0EBt/qVy4EgLfngG2VLQ5EXLIzs
ivjZsbM3R9/s2KNsgjEmdaNa7TX4pbVtIPu4Xy3c74PX3p3W8Mjl3+JN/r9SoLz1
tI6K2VRu/H1grwqbLkzg6+x0p9AtgBqgGnSC3Lq3iJgJ99eAGXKZJ4yqw7cv6nCV
Ybg1hEmU/yoiAMIrgD7GN8i6sxWOyfmH+cXIvymBoFyEeLaLhf8CTmFRxbhXxpMG
he4G7nEWjzKjvP8pMlRRrmTFA+G1OXK7ACJHCWVc40kIYkSegS+xtXvF044Sg9Qd
w/JB0S5C5VKVqIcDesIc40iKQBjRXQ==
=s3hV
-----END PGP SIGNATURE-----

--Sig_/1mn2mUnJqmf_sY4_JQ/F5jP--
