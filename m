From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v7 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 9 Nov 2012 13:54:40 +0200
Message-ID: <20121109115440.GC8078@arwen.pp.htv.fi>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:54930 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752533Ab2KIMBR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Nov 2012 07:01:17 -0500
Content-Disposition: inline
In-Reply-To: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de, t.figa@samsung.com, gautam.vivek@samsung.com

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 30, 2012 at 10:27:32AM +0530, Praveen Paneri wrote:
> Changes from v6:
> Modified register definitions according to the existing ones.
> Changed default PHY clk selection for SoCs.
> Improved binding text and rebased to the latest usb-next.
>=20
> Changes from v5:
> Moved clk_get() to driver's probe function. Now reference clock frequency
> selection value is stored in samsung_usbphy structure for later use. Used
> IS_ENABLED() instead of #ifdef in samsung_usbphy_get_driver_data().
>=20
> Changes from v4:
> Moved header file contents to driver's source file
> Removed unnecessary print message from driver's probe function
> Dropped the Free Software Foundation address from the header
> Changed the platform data code to use __initdata
>=20
> Changes from v3:
> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driver
> is registered
> Removed unnecessary devm_usb_put_phy() call from the hsotg driver remove.
>=20
> Changes from v2:
> Changed the driver filenames to samsung-usbphy
> Changed 's3c' to 'samsung' for platform device as well as platform data
> Moved platform data structure to a separate file
> Rectified coding style related errors
>=20
> Changes from v1:
> Rebased patches to latest usb-next branch
> Changed the name 'sec_usbphy' to 'samsung_usbphy'
>=20
> This patch set introduces a phy driver for samsung SoCs. It uses the exis=
ting
> transceiver infrastructure to provide phy control functions. Use of this =
driver
> can be extended for usb host phy as well. Over the period of time all the=
 phy
> related code for most of the samsung SoCs can be integrated here.
> Removing the existing phy code from mach-s3c64xx. Same can be done for ot=
her SoCs
> when they start supporting this phy driver.=20
> This driver is tested with smdk6410 and Exynos4210(with DT).
>=20
> Praveen Paneri (5):
>   usb: phy: samsung: Introducing usb phy driver for hsotg
>   usb: s3c-hsotg: Adding phy driver support
>   ARM: S3C64XX: Removing old phy setup code
>   ARM: S3C64XX: Enabling samsung-usbphy driver
>   ARM: Exynos4210: Enabling samsung-usbphy driver

guys I can't wait any longer. If I don't get proper Acks today, I will
go ahead without all the PHY changes from Samsung :-s

--=20
balbi

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQnO8AAAoJEIaOsuA1yqREWpEP/0xJoFVVB8jYEUgavYWr8ZSh
X7y725aoNLPMpEhKAuhDRLVFebZJmXmQenEMWT+D2kDeEeirH1GJJ7M8ggB5RF2x
G4hYkxP0tUj3mqkeJUpchtpOVq2bFW4qrk1XNegGUk6foh7CulF/X+Jl2OXQr2ec
2GLxGQWr3rgpRp+ZkovMmpJ2KEl6SDwtaQixLCW50A4/BusMKOqa9RLPYhRBfOo8
lpcRdDcUfyliIxGxR8Sy7tFz6sVcABzr+91KPz1rNArSfMOZ8s37mqihLt9ZSqex
iPOjtXNHj54QRNhCtyatlWqtHN0Btwhv/Dk2+j6Aq5NhOV4o7KgggMyqn9ljNMdQ
b2dGTjyyxPeFGd8Ur64CcC93UYxHuZtl7fFWZeGE5/FsJiZ2OgLy/BdGUziQTGzu
UvIgoMNvP/MGr8C+v/e8JfVUFcqifbRGxlx6bQXtumnn791zC2/pQv7VnKI93yO4
UhpL4b6SILkocdOWU4d+MAsxpnWDbRG6sjZdWQ2qWlzJerZSbNI0PmnM/eTU6yRh
gOeKwZFmSRQfoe0mK17YiFW3Vi8xntrnNQgMF4wkv81bCEYOpheok9rU6iAeGR6g
bhfGQEE2wc9S+LATh9h8/U7ZPL+82F9urFN3/q03PHfUxT332H/Moyt/nSXqLiMY
q30IXeg5gRIq88WJ7lgd
=CczU
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
