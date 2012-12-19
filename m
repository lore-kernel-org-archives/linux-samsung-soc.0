From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: samsung: Add support for USB 3.0 phy for
 exynos5250
Date: Wed, 19 Dec 2012 09:55:50 +0200
Message-ID: <20121219075550.GD5228@arwen.pp.htv.fi>
References: <1355843426-13613-1-git-send-email-gautam.vivek@samsung.com>
 <1355843426-13613-2-git-send-email-gautam.vivek@samsung.com>
 <20121218151349.GC32437@arwen.pp.htv.fi>
 <CAFp+6iHQMDuwPd08KwPyxE_eXyofv_31-Azr0F9+LS2E9aY52w@mail.gmail.com>
 <CAFp+6iFk_eXaJidfL-PBhB6haJnmovVw3AwG5p6kJ-U+R2jFzA@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1263062509499320938=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAFp+6iFk_eXaJidfL-PBhB6haJnmovVw3AwG5p6kJ-U+R2jFzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1263062509499320938==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline

--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 19, 2012 at 11:52:01AM +0530, Vivek Gautam wrote:
> >>> @@ -736,7 +1035,41 @@ static int __devinit samsung_usbphy_probe(struc=
t platform_device *pdev)
> >>>
> >>>       sphy->clk =3D clk;
> >>>
> >>> -     return usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
> >>> +     sphy->has_usb3 =3D (sphy->cpu_type =3D=3D TYPE_EXYNOS5250);
> >>> +
> >>> +     if (sphy->has_usb3) {
> >>> +             struct resource *usb3phy_mem;
> >>> +             void __iomem    *usb3phy_base;
> >>> +
> >>> +             usb3phy_mem =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 1);
> >>> +             if (!usb3phy_mem) {
> >>> +                     dev_err(dev, "%s: missing mem resource\n", __fu=
nc__);
> >>> +                     return -ENODEV;
> >>> +             }
> >>> +
> >>> +             usb3phy_base =3D devm_request_and_ioremap(dev, usb3phy_=
mem);
> >>> +             if (!usb3phy_base) {
> >>> +                     dev_err(dev, "%s: register mapping failed\n", _=
_func__);
> >>> +                     return -ENXIO;
> >>> +             }
> >>> +
> >>> +             sphy->usb3phy.regs_phy          =3D usb3phy_base;
> >>> +             sphy->usb3phy.phy.dev           =3D sphy->dev;
> >>> +             sphy->usb3phy.phy.label         =3D "samsung-usb3phy";
> >>> +             sphy->usb3phy.phy.init          =3D samsung_usb3phy_ini=
t;
> >>> +             sphy->usb3phy.phy.shutdown      =3D samsung_usb3phy_shu=
tdown;
> >>> +     }
> >>> +
> >>> +     ret =3D usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
> >>> +     if (ret)
> >>> +             return ret;
> >>
> >> is this realy how your HW behaves ? USB2 and USB3 phys are a single HW
> >> entity ? I kinda doubt that :-s
> >>
>=20
> They are separate HW in fact.
> So, do you expect to see a separate driver interface for USB 3.0 type phy=
 ?

yes. Just as we did on OMAP. One driver for the USB2 part and one driver
for USB3 part (which are actually two, but you can only talk to them as
one) :-)

> That will be quite similar architecturally to current samsung-usbphy
> driver for USB 2.0 type phy,
> and may require some code duplication too.

If it duplicates code, then perhaps it's best to keep it as is but I'm
actually surprised you guys have similar programming model on both
parts. I mean, the differences at HW behavior are huge: on one side you
use ULPI/UTMI+ on the other PIPE3, on one side you have 480Mbps
half-duplex signalling, on the other you have 5Gbps dual simplex
signalling, the differences go on and on.

Also, what you say about duplicating, it seems to me that it will
duplicate only the boylerplate part (allocating memory, having a
platform_driver, and so on), because you _do_ have completely separate
functions to handle usb3 part.

One more comment below:

> +static u32 exynos5_usb3phy_set_clock(struct samsung_usbphy *sphy)
> +{
> +	u32 reg;
> +	u32 refclk;
> +
> +	refclk =3D sphy->ref_clk_freq;
> +
> +	reg =3D PHYCLKRST_REFCLKSEL_EXT_REFCLK |
> +		PHYCLKRST_FSEL(refclk);
> +
> +	switch (refclk) {
> +	case HOST_CTRL0_FSEL_CLKSEL_50M:
> +		reg |=3D (PHYCLKRST_MPLL_MULTIPLIER_50M_REF |
> +			PHYCLKRST_SSC_REFCLKSEL(0x00));
> +		break;
> +	case HOST_CTRL0_FSEL_CLKSEL_20M:
> +		reg |=3D (PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF |
> +			PHYCLKRST_SSC_REFCLKSEL(0x00));
> +		break;
> +	case HOST_CTRL0_FSEL_CLKSEL_19200K:
> +		reg |=3D (PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF |
> +			PHYCLKRST_SSC_REFCLKSEL(0x88));
> +		break;
> +	case HOST_CTRL0_FSEL_CLKSEL_24M:
> +	default:
> +		reg |=3D (PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF |
> +			PHYCLKRST_SSC_REFCLKSEL(0x88));
> +		break;
> +	}
> +
> +	return reg;
> +}

looks like this should be done by commong clock framework by clock
reparenting perhaps ?

--=20
balbi

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ0XMGAAoJEIaOsuA1yqRELe0P+gOZBmy6mOyUgPvcnr5ywYAV
JKSJy29xzAjINsp0OBiPsxPa5P9ZytEBKtbPq67t5AW/ll/4OLOis37a2AIDQW9/
2MJRXCMOCVNI2v9KiV/pfayn3SabBel+XFsdfkqMySCAKzrNqIFnrAW87Y7nlXWt
8vsP5Mc3AUMQG+rQfF3IALouKSFjp4Hj2pmUgeqMFtVrLH0ncikN048iJwfH8vC6
CFYcBjgsQPS7ES9lmVKDZjNQzkshbtmbRRc784cCzcEmOr3sTZjErY5BFC72K/Gj
gNbvW5unPwwWhEcgWdRXOCadyW5rezwDKklRY1sECwWe7j7il/WTpasgdXFzLr9M
bHY5Fprx5FRzGjnJuVqgZBq21P9MaOTbkVxGghjfsfXdOyGoMOOmKo9eCs1Q4sIY
pt+ZNeMJGXU1HnBNCZFNjMktYiXukthij9YxrF7ZrYrqsgaWMa+5ErilZR8SgafG
apZh/byOOM/NXIwEfEARgVJ/ydA77KztDr00UOiIofS+/FscL2Nj0rhmUhuM0xTS
rCDn6o4eCyDThCCntb+TQiImurRyHURx8mqP3N9yCzjzJlrIvc/y7MAeopxYSKw1
JQLuCEEeGybp0TZYdP9O27W8WGMzt0rlroO56Y/boUP+oLBfpg/79lO5MxwjCS31
ICzkbEhW2hwwomPjsaNW
=/Njf
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--

--===============1263062509499320938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1263062509499320938==--
