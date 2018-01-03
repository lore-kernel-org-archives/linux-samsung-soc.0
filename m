From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [U-boot] Odroidxu3/4 -s2mps11 bind pmic failed
Date: Wed, 3 Jan 2018 09:38:46 +0100
Message-ID: <20180103093846.0fa8b8e2@jawa>
References: <CANAwSgSrNEfy-78cYRm+HeBa_MDk1xn5P4neYJPiDW-RpfW-Gw@mail.gmail.com>
        <20180102231706.7b7f446d@jawa>
        <CANAwSgQrHUjOFLJL=soG7aFooZ2D-PwP5vLT+hdxzaRL6JPM7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l7W/h2Lc1R49lVAWP7leEPb"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:53719 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751046AbeACIjA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 03:39:00 -0500
In-Reply-To: <CANAwSgQrHUjOFLJL=soG7aFooZ2D-PwP5vLT+hdxzaRL6JPM7Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-samsung-soc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>

--Sig_/l7W/h2Lc1R49lVAWP7leEPb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anand,

> Hi Lukasz
>=20
> On 3 January 2018 at 03:47, Lukasz Majewski <lukma@denx.de> wrote:
> > On Wed, 3 Jan 2018 01:54:57 +0530
> > Anand Moon <linux.amoon@gmail.com> wrote:
> > =20
> >> Hi All,
> >>
> >> I would like to get the s2mps11 regulator binding for u-boot to
> >> work on Odroid XU3/XU4
> >> as in case of Odroid U3 we have max77686_bind function which dose
> >> the job.
> >>
> >> what will be the correct way to reset s2mps11 control register to
> >> the default values
> >> in-order to support reset of some regulators.
> >>
> >> Below is the command I tried to gather some information but it
> >> failed.
> >>
> >> Best Regards
> >> -Anand Moon
> >> ----------------------------------------------------------------------=
-------------------------------------------------------------------
> >> U-Boot 2018.01-rc3-00060-g1314bd1 (Jan 02 2018 - 17:56:26 +0000)
> >> for ODROID-XU3/XU4/HC1
> >>
> >> CPU:   Exynos5422 @ 800 MHz
> >> Model: Odroid XU3 based on EXYNOS5422
> >> Board: Odroid XU3 based on EXYNOS5422
> >> Type:  xu4
> >> DRAM:  2 GiB
> >> MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1
> >> *** Warning - bad CRC, using default environment
> >>
> >> In:    serial
> >> Out:   serial
> >> Err:   serial
> >> Net:   No ethernet found.
> >> Hit any key to stop autoboot:  0
> >> Card did not respond to voltage select!
> >> mmc_init: -95, time 11
> >> switch to partitions #0, OK
> >> mmc0 is current device
> >> Scanning mmc 0:1...
> >> reading /exynos5422-odroidxu4.dtb
> >> 62815 bytes read in 9 ms (6.7 MiB/s)
> >> starting USB...
> >> USB0:   USB EHCI 1.00
> >> USB1:   Register 2000140 NbrPorts 2
> >> Starting the controller
> >> USB XHCI 1.00
> >> USB2:   Register 2000140 NbrPorts 2
> >> Starting the controller
> >> USB XHCI 1.00
> >> scanning bus 0 for devices... 1 USB Device(s) found
> >> scanning bus 1 for devices... 3 USB Device(s) found
> >> scanning bus 2 for devices... 2 USB Device(s) found
> >>        scanning usb for storage devices... 0 Storage Device(s)
> >> found scanning usb for ethernet devices... 1 Ethernet Device(s)
> >> found Waiting for Ethernet connection... done.
> >> BOOTP broadcast 1
> >> BOOTP broadcast 2
> >> DHCP client bound to address 10.0.0.144 (1200 ms)
> >> *** Warning: no boot file name; using '0A000090.img'
> >> Using r8152#0 device
> >> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> >> through gateway 10.0.0.1
> >> Filename '0A000090.img'.
> >> Load address: 0x43e00000
> >> Loading: *
> >> TFTP error: 'File not found' (1)
> >> Not retrying...
> >> missing environment variable: pxeuuid
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A000090
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A00009
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A0000
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A000
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A00
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A0
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0A
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/0
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/default-arm-exynos
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/default-arm
> >> *** ERROR: `serverip' not set
> >> missing environment variable: bootfile
> >> Retrieving file: pxelinux.cfg/default
> >> *** ERROR: `serverip' not set
> >> Config file not found
> >> BOOTP broadcast 1
> >> DHCP client bound to address 10.0.0.144 (644 ms)
> >> Using r8152#0 device
> >> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> >> through gateway 10.0.0.1
> >> Filename 'boot.scr.uimg'.
> >> Load address: 0x50000000
> >> Loading: *
> >> TFTP error: 'File not found' (1)
> >> Not retrying...
> >> BOOTP broadcast 1
> >> BOOTP broadcast 2
> >> DHCP client bound to address 10.0.0.144 (1257 ms)
> >> Using r8152#0 device
> >> TFTP from server 0.0.0.0; our IP address is 10.0.0.144; sending
> >> through gateway 10.0.0.1
> >> Filename 'boot.scr.uimg'.
> >> Load address: 0x42000000
> >> Loading: *
> >> TFTP error: 'File not found' (1)
> >> Not retrying...
> >> ODROID-XU3 #
> >> ODROID-XU3 #
> >> ODROID-XU3 # pmic s2mps11 dump
> >> pmic -  operations
> >>
> >> Usage:
> >> pmic list          - list pmic devices
> >> pmic dev [name]    - show or [set] operating PMIC device
> >> pmic dump          - dump registers
> >> pmic read address  - read byte of register at address
> >> pmic write address - write byte to register at address =20
> >
> > First try to:
> >
> > pmic list
> > pmic dev s2mps11_pmic@66
> >
> > pmic dump
> > pmic write 0xXX for your device
> >
> > =20
> [snip]
>=20
> Thanks for your input.
>=20
> ODROID-XU3 #
> | Name                            | Parent name         | Parent
> uclass @ seq | s2mps11_pmic@66                 | i2c@12CA0000
> | i2c @ 4 ODROID-XU3 # pmic dev s2mps11_pmic@66
> dev: 0 @ s2mps11_pmic@66
> ODROID-XU3 # pmic dump
> Dump pmic: s2mps11_pmic@66 registers
>=20
> 0x00: 83 00 11 00 ff 3b 03 1a 00 00 04 01 10 00 00 57
> 0x10: 5f 55 ff ff ff ff ff 00 00 00 00 00 00 00 00 00
> 0x20: 00 50 12 ca dc d8 50 f8 40 f9 40 f8 40 fe 3f 60
> 0x30: 78 90 c0 d8 44 d8 30 d8 64 d9 50 d8 a8 c8 d4 14
> 0x40: d4 d4 c8 d4 d4 f2 d4 c8 d4 f2 2c f2 dc f2 14 f2
> 0x50: 14 14 10 cc e8 14 ec c8 f2 14 f2 14 14 14 2c 10
> 0x60: 14 14 28
>=20
> Actually, I am looking into setting some of the s2mps11 control
> register + reset clk values
> during board initialization.

You can try to set those values by writing some u-boot script or bring
the below (needed) code upstream, so those could be reused by others.

>=20
> Hardkernel Exynos5422 u-boot:
> [0]
> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/samsun=
g/smdk5422/pmic.c#L271-L329
>=20
> Cromebok2 u-boot:
> [1]
> https://github.com/archlinuxarm/u-boot-chromebook2/blob/chromebook2/board=
/samsung/common/board.c#L299-L314
>=20
> Some of the feature dont work out on warm boot because of this
> missing feature.
>=20
> Best Regards
> -Anand Moon



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/l7W/h2Lc1R49lVAWP7leEPb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlpMlpcACgkQAR8vZIA0
zr0ABAgAtUrdG3777K9DbfCMfPv0fZGrOMR0roun8TAX8nKcpWrHHUNr6z2qeLig
TqucEpGfpvGfd2/pjY+cdhI4/f1mJ7Ol+xPTg0g0BBRDOA3ulzrB8HpW4FYtksBe
AFaVuKmyuPFtp0/4o3U4tDXBZ8BD7lXwUpozXJgah0sfmh3jqeozEtvbVHzOq4x3
oshS3VYGiiSpA87cLG/8++Bn+ZzICtpKclKyeunkXLgrBR5K1S2aEisf5/ONFKQV
IAqPWWhnPC8qbNUejLHHnl7z9XzB+H76NCPsHhdBzLvesE9CSX9K215Rf2MvLGLW
NHjHTYDNfDW4jYFo0IWr7WswRFB0vw==
=T1C3
-----END PGP SIGNATURE-----

--Sig_/l7W/h2Lc1R49lVAWP7leEPb--
