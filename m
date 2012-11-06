From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 6 Nov 2012 18:39:20 +0200
Message-ID: <20121106163920.GC3993@arwen.pp.htv.fi>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
 <20121106131453.GL11931@arwen.pp.htv.fi>
 <CAFp+6iH=hs-Rr5CkcCWXLMeFQ+Q=xYC6xtZ1tybz=yeFRUcUwg@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37097 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750867Ab2KFQpd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 11:45:33 -0500
Content-Disposition: inline
In-Reply-To: <CAFp+6iH=hs-Rr5CkcCWXLMeFQ+Q=xYC6xtZ1tybz=yeFRUcUwg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: balbi@ti.com, Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 06, 2012 at 07:23:12PM +0530, Vivek Gautam wrote:
> Hi Balbi,
>=20
>=20
> On Tue, Nov 6, 2012 at 6:44 PM, Felipe Balbi <balbi@ti.com> wrote:
> > Hi,
> >
> > On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
> >> This patchset is based on the work by Praveen Paneri for
> >> samsung-usbphy driver:
> >> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
> >>
> >> Changes from v2:
> >>  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
> >>    PHY SFRs for register definitions
> >>  - Using register names with bit macros to make things more clear.
> >>  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
> >>    in [patch 2/4 v2].
> >>
> >> Tested on smdk5250 target with usb-next branch along with arch patches
> >> for exynos5250:
> >> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
> >> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
> >>
> >> Vivek Gautam (4):
> >>   usb: phy: samsung: Add host phy support to samsung-phy driver
> >>   ARM: Exynos5250: Enabling samsung-usbphy driver
> >>   USB: ehci-s5p: Add phy driver support
> >>   USB: ohci-exynos: Add phy driver support
> >
> > I really don't know what to do with this series. I know it depends on
> > the other PHY changes which I have in my queue, but it touches too much
> > arch specific code, plus the USB Host code which I don't maintain.
> >
>=20
> True, that it has dependency on the work by Praveen Paneri for samsung-us=
bphy
> driver plus the arch support patches.
>=20
> This is based on usb-next branch, so the host-code can be taken care of ?
>=20
> > On top of all that, I have no platform to test these patches, which
> > makes me even more worried about signing off under this series ;-)
> >
> The patches have however been tested. The two patches:
> "USB: ehci-s5p: Add phy driver support",
> "USB: ohci-exynos: Add phy driver support" have been acked by Jingoo Han
> based on the patch-series.
>=20
> Possibly Kukjin Kim can help on this one.
>=20
> Kukjin,
> Can we have a thought on this please.
>=20
> > Would it be ok if we delay this to v3.9 ? At least the dependency with
> > other PHY changes would be dropped by then.
> >
> This changes are almost in shape ;-) and i am updating the next patchset =
soon.
> If possible can we try to get this in 3.8 please. :-)

we can try, but I'd like to minimize the amount of code outside of
drivers/usb/ I take in my tree. If there's any way to split the series
so it makes my life easier, I'd be really glad.

Also, I can't apply arch/* patches without proper Acked-bys, so Kukjin
would need to help us out there too :-)

cheers

--=20
balbi

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQmT04AAoJEIaOsuA1yqRE8qwP/0l0pcBggYFa2d1P7anIEimq
GdiV5Sg2IFwAjsN87gE/Q17jYbyeBXqTX5aHZqezoaeaRH5kb6HIcElml+9mFPfI
aUxgN8ZrB3bYJhNpJtYjxqfbwpRtUgXSk4u9VMdXvu+qf769IJrRIJIsyMDnCUIo
9f148U5CRnUyS0AfQ/N166XRZjJI3BgHP56AdI2ABHrECB+opctgJIOonIcGAt7n
3n4wCOrixMzAWHpzK8/3SF4tcwUsZs6EKKBnus3wUbPEnPuoP8H0bSnuFPGdp66o
tliyy8w2RtO9/SyNuQm81Dqc5zVnM7rDnIOWSW9wnKvfolQIHdmRzjzpM4oljiwY
uxJSTqv8CobM2hvWUgn4OTdnwJTC13fT9+UnWt32qPh7mA/r7hih0z2hn/lmk/Zh
oYGPfYmtN6d4VDxZyP/So38lMoqKuJcW36zUAI41igEsxtHadoPy+6D82JI3q370
KWajfH167ajE8mr5VU8I/sKwkelQHXPYY8F4zLfUrAS8QYUQqGY0VsUaHbmUqX2P
XYfIUgF2HpOzNCwotaWKcPLL6iRlzPd3uW4r7DKt4Qft1Gw8QOGuMskkA/U5lQ0M
SDEbSA/9cun+J+rpjzdc4jooo0jQynQvsg2syvTshH5YLCcohXOj0OrnzCd0z59w
iiKEHLr23NGun3XwS94x
=Jo/6
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
