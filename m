From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 10 Aug 2012 10:06:24 +0300
Message-ID: <20120810070623.GL1689@arwen.pp.htv.fi>
References: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zl+NncWK+U5aSfTo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog125.obsmtp.com ([74.125.149.153]:51582 "EHLO
	na3sys009aog125.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754908Ab2HJHKF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 03:10:05 -0400
Received: by lagy9 with SMTP id y9so732947lag.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Aug 2012 00:10:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de


--Zl+NncWK+U5aSfTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2012 at 12:40:26PM +0530, Praveen Paneri wrote:
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

just one idea. It looks like after introducing the PHY, you converted
all users to create the phy device. I wonder if you should have a
patch 6/6 which will remove pdata->init support from s3c_hsotg.c and
stick to using phy driver.

--=20
balbi

--Zl+NncWK+U5aSfTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQJLLvAAoJEIaOsuA1yqRE1TkQAIqMvN/81HHx1QPanK5L38Wf
3RGhFLfzaKslRBYM0ZOvd88hYNYDm5VbOzhgD3lPZi4oPSqOMi1OLqjlf7Nf9iKy
NZPCsjbdd01sM138GrJK4s0fYDS0QxGgL+96RW+FYfaGpe0CM/X7OipNpi4dhSeF
L9KvgTReOvAtziHavoGb2xU088EjDmuX5FR6Z0cbRPI+0HM2nXSreVCgMpKEJN1+
XwswhL0D2ZkWZwfacF5C2wp9LeF+TlhPYqsk8f4bHqBbk1Tmqb4nOOwpylmkSJcm
5vwaXjp4s8EtdRQC+jZMpCDj/cxzGbaVtMNmLHMilBULRG+xgOxF9/1VP48BPRWT
X9M9vMq9TBKn7ZaQbcROPKAkxgHxsBuM3hRPO8DqQE7DLHFeavlIRkwGQ3D/YYxd
J3hFYLql1BHEb9bm60bxMiAWg78fpaBCzNoAP0xPc9wsGN8vmKvvTxRF5fkN1Uvj
S5NJLyXy0ZypwVduQFW66nsSWJ6JJT3n4OmMAC+CijbhbkeyR1m8r+Gk4+NA+a8w
Cp/4opdyYg0ZWJA6ZkC4Zi0kn55JbSdwLQbQ0lnukFW1KMOg1VxQYN7KJMLSvmKv
0lXE4bKc2tYPPMqJO6KGOc+26Mo5FwIWxI+VbmwBEGUWeiQdmWpz2dXgbMaUKJUg
YP6Zf1sH03hjxkTExJqP
=sgj+
-----END PGP SIGNATURE-----

--Zl+NncWK+U5aSfTo--
