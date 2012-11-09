From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v7 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 9 Nov 2012 15:54:41 +0200
Message-ID: <20121109135441.GC8567@arwen.pp.htv.fi>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
 <20121109115440.GC8078@arwen.pp.htv.fi>
 <CAH9JG2X1a8MqBpnk8uHRjsGnaD7uob5GBhUh_aS5iCprEvi2XQ@mail.gmail.com>
 <CAD6zSYN6xpHt54d-w=6veb6AErTq6ERQcneo7ewC-qsBoMuThQ@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:58503 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752342Ab2KIOB1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Nov 2012 09:01:27 -0500
Content-Disposition: inline
In-Reply-To: <CAD6zSYN6xpHt54d-w=6veb6AErTq6ERQcneo7ewC-qsBoMuThQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, Felipe Balbi <balbi@ti.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Vivek Gautam <gautam.vivek@samsung.com>, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org

--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 09, 2012 at 06:50:44PM +0530, Praveen Paneri wrote:
> Hi,
>=20
> On Fri, Nov 9, 2012 at 6:06 PM, Kyungmin Park <kmpark@infradead.org> wrot=
e:
> > On Fri, Nov 9, 2012 at 8:54 PM, Felipe Balbi <balbi@ti.com> wrote:
> >> Hi,
> >>
> >> On Tue, Oct 30, 2012 at 10:27:32AM +0530, Praveen Paneri wrote:
> >>> Changes from v6:
> >>> Modified register definitions according to the existing ones.
> >>> Changed default PHY clk selection for SoCs.
> >>> Improved binding text and rebased to the latest usb-next.
> >>>
> >>> Changes from v5:
> >>> Moved clk_get() to driver's probe function. Now reference clock frequ=
ency
> >>> selection value is stored in samsung_usbphy structure for later use. =
Used
> >>> IS_ENABLED() instead of #ifdef in samsung_usbphy_get_driver_data().
> >>>
> >>> Changes from v4:
> >>> Moved header file contents to driver's source file
> >>> Removed unnecessary print message from driver's probe function
> >>> Dropped the Free Software Foundation address from the header
> >>> Changed the platform data code to use __initdata
> >>>
> >>> Changes from v3:
> >>> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
> >>> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driv=
er
> >>> is registered
> >>> Removed unnecessary devm_usb_put_phy() call from the hsotg driver rem=
ove.
> >>>
> >>> Changes from v2:
> >>> Changed the driver filenames to samsung-usbphy
> >>> Changed 's3c' to 'samsung' for platform device as well as platform da=
ta
> >>> Moved platform data structure to a separate file
> >>> Rectified coding style related errors
> >>>
> >>> Changes from v1:
> >>> Rebased patches to latest usb-next branch
> >>> Changed the name 'sec_usbphy' to 'samsung_usbphy'
> >>>
> >>> This patch set introduces a phy driver for samsung SoCs. It uses the =
existing
> >>> transceiver infrastructure to provide phy control functions. Use of t=
his driver
> >>> can be extended for usb host phy as well. Over the period of time all=
 the phy
> >>> related code for most of the samsung SoCs can be integrated here.
> >>> Removing the existing phy code from mach-s3c64xx. Same can be done fo=
r other SoCs
> >>> when they start supporting this phy driver.
> >>> This driver is tested with smdk6410 and Exynos4210(with DT).
> >>>
> >>> Praveen Paneri (5):
> >>>   usb: phy: samsung: Introducing usb phy driver for hsotg
> >>>   usb: s3c-hsotg: Adding phy driver support
> > For usb parts:
> > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Thanks for the ack.
> >
> >>>   ARM: S3C64XX: Removing old phy setup code
> >>>   ARM: S3C64XX: Enabling samsung-usbphy driver
> >>>   ARM: Exynos4210: Enabling samsung-usbphy driver
> >>
> >> guys I can't wait any longer. If I don't get proper Acks today, I will
> >> go ahead without all the PHY changes from Samsung :-s
> >
> > To Praveen,
> >
> > To remove these dependency and merge issue, please send patches for
> > each subsystem. In this case, usb patches for usb tree and others are
> > for arm arch.
> I will surely take care of this from now onwards. Hope these can be
> taken as it is for now.

Sure, but I still need Kukjin's 'say-so' for the arch/arm/plat-samsung
and arch/arm/mach-exynos part.

--=20
balbi

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQnQshAAoJEIaOsuA1yqRExmYQAInBK8KWPrcAtLD5c1J+EUcd
Drend1xdlltq0mwBQjgVvho4AHXg5lQgcaHnF+K4h0D4lmLEieKd+mlSHv07E1kr
E3Wg+zNC9PtCVAbZ21uf2p9PmWm0Y3/mN+HbYVBzwJVxQG/vEGT+kp1HdnoBQnSq
m+L8iNOxINGpfngwVRYJtpepSrjONtUgPslZ49JuoCLnCx3bOQR3qY1kmPY7aPdG
sgBUNV/hV3FuJOscTuHu7BQuufGzmHSb3xEyhJe4ts7/w30cUSnx4LqXB9B6aQzN
n00wJyrFHEW5obIVXGcWd/7NIOafGUXZJLEjL2qg6oJP+N4YBTq30hxlXGvnByo4
PpQKD6b3Zf4j/Y1YvBGR2xc6t2Bt6ryZq/rFFX6D37gVuUGXDVQuSGG9WPR2DVnO
35F0rXnqVRpXLCCVfp6fG+E4SsU9lI2fkds7E0AEoVMXBaO7ozVqr9fmdl8ETVUQ
eMS8bpY7lZ/bCM1MGXbCj5xeLSWUpybRSOECWgZSuCeU/bDOEuaUsRpZysEPyAIN
FtmIK/8YfD8gpDciQz68OxTT7gO8SQ8YCSn7uu9ZKUTqW2NDqP9I/NlWQo2tbanV
UwIyEmsWMjhjQZJYm8n+sGd3DJ1cbbQ/Txan2HuiEE1kLzFIjFnGzFTKCcsmiJz2
F9o4gj9sZ05vjP02Oliz
=tK8a
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
