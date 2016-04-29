From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFT PATCH 1/3] usb: misc: usb3503: Fix HUB mode after
 bootloader initialization
Date: Fri, 29 Apr 2016 12:30:59 +0100
Message-ID: <20160429113059.GX3217@sirena.org.uk>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jaBcukw8GoX3rwhf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58972 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634AbcD2LbY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 07:31:24 -0400
Content-Disposition: inline
In-Reply-To: <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, hverkuil@xs4all.nl, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--jaBcukw8GoX3rwhf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2016 at 12:59:49PM +0200, Krzysztof Kozlowski wrote:

> +++ b/Documentation/devicetree/bindings/usb/usb3503.txt
> @@ -24,6 +24,7 @@ Optional properties:
>  	pins (optional, if not provided, driver will not set rate of the
>  	REFCLK signal and assume that a value from the primary reference
>  	clock frequencies table is used)
> +- vdd33-supply: Optional supply for VDD 3.3 V power source.

Supplies are only optional if they may be physically absent.  In this
case it's possible that on device regulators may be used instead, a
pattern more like that used for arizona-ldo1 where we represent those
regulators might be better as it's more clearly describing the
situation.  I'm just wondering if the supply lookup stuff there should
be factored out as this is not an uncommon pattern..

It should at least be clearly stated what's going on, ignoring failure
to get supplies is generally a bug and people will tend to blindly cut
and paste things (witness all the breakage in graphics drivers with
this).

>  static int usb3503_reset(struct usb3503 *hub, int state)
>  {
> +	int err;
> +
> +	err = usb3503_regulator(hub, state);
> +	if (err) {
> +		dev_err(hub->dev, "unable to %s VDD33 regulator to (%d)\n",
> +			(state ? "enable" : "disable"), err);
> +	}

Are we sure that the callers all balance enables and disables and we
don't ever end up going through reset more than once on the way down?

> +		hub->vdd_reg = devm_regulator_get_optional(dev, "vdd33");
> +		if (IS_ERR(hub->vdd_reg)) {
> +			if (PTR_ERR(hub->vdd_reg) == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;

This should explicitly check for -ENODEV and return the error if it gets
anything else, that will mean that if the supply is needed but lookup
fails somehow due to a non-deferral error we'll handle it properly.

> +	err = usb3503_regulator(hub, true);

The naming on this function is very obscure (and there's also a couple
of other supplies).  I'd suggest just folding this into the reset
function, or at least renaming so the reader can tell what these calls
do.

--jaBcukw8GoX3rwhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXI0XyAAoJECTWi3JdVIfQOtUH/3D0V95zG3CwJe52D/fSn5lE
CybYmPXIvm85iaeS+8OIlyE4j5qD45OlDCvG2GKTRGjtXUJKqc6cIJCi1feM11Cu
iPi2J6q8QtJCnGkXQFx8G/Fvg3qwUCj8XjJSOBSoe7iseD+ezuLA/er2WXNN3Xf3
QgBRyTdI3EIY4K2RhJqxV6200XP7TCVYf7MkvBR3i1ibnoPkWnHk60HWFEMy9v8I
Qmt4sS/YVn6FPsHIjw0rvGLIcyVdByl2AHJqwStZ5Phi7mKh74OfitYXw3zpLWhV
RpX4FxU5iTBK6LlzQFvrPRfvjmX4faK0gMv+yImqOCFRutg36Y6opn+6Am5f7FQ=
=eGIR
-----END PGP SIGNATURE-----

--jaBcukw8GoX3rwhf--
