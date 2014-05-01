From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Thu, 1 May 2014 07:15:10 -0700
Message-ID: <20140501141510.GW3245@sirena.org.uk>
References: <1398243705-31151-1-git-send-email-tushar.behera@linaro.org>
 <20140424133920.GA12304@sirena.org.uk>
 <5359E18B.60600@linaro.org>
 <20140429222915.GU15125@sirena.org.uk>
 <5360E5E7.8090807@linaro.org>
 <20140430180314.GA3245@sirena.org.uk>
 <53623004.5010805@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pEAjBjStGYT6H+Py"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53623004.5010805@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, sbkim73@samsung.com, rdunlap@infradead.org, dianders@chromium.org
List-Id: linux-samsung-soc@vger.kernel.org


--pEAjBjStGYT6H+Py
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 01, 2014 at 04:59:08PM +0530, Tushar Behera wrote:

> Okay, I will extend the existing clock driver to support XCLKOUT.

It may make more sense to add another clock driver for this clock
depending on how things are done, I don't know.

> Of the many parents of XCLKOUT, we need to set XXTI clock as the parent.
> Is it okay if we pass two clocks "mclk" (XCLKOUT) and "mclk_parent"
> (XXTI) to sound-card driver via DT and do the necessary reparenting
> during the sound-card driver probe call?

No, that's not OK at all, it won't allow for configuration of the
system.  This is what I was talking about when I was talking the clock
framework extensions to allow the clock tree to be configured using DT,
that would allow the settings to be put in DT.

> Else, we can push that change to bootloader (to set the XCLKOUT mux
> register) and only enable/disable the clock in sound-card driver.

That's not going to work given that the existing bootloaders don't do
this.

--pEAjBjStGYT6H+Py
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTYlbrAAoJELSic+t+oim9Y74P/1KfbQJb0J7mDTfxDZSxbsE0
nA1dchqcgQBYlwQvr1rXWXMzxfbP0hoDbA2YVvFpYo3EQ5miHRYHjLtG4mFhbPBz
WQyzpPND940136jZQjPSESfELQdhNvDBORsaqKYRFUPAPK6D6E6dZc98njvXxgJZ
lxf2FBjlnWTdbZTYyqnYXPf6SqwncL53zzQlawgLVR5j9F8wzrXlVuQ1asEQTfdk
72rbTwJkBugu7dZNZaraPy+5+HzIR+u7vQ/QtAPL92WwPgHyZWCDyFktVIBWxz2A
F2b1IVCp+owmHErLJq0RSDROCzq16z2SxmchHqu39sIgfyupDXUW+VFW6WamRHxe
t0NlPpmkr2WW4oiovn5rrImxRfCoPEvYO/lEDgd60JWLLBBV9l1Rymz45ZH4dgLA
A72WoCqr8fEOU8eHwaO62Z3W4yYzopA3OgzqcCUs7ITaPaDlNZkXoCBNTK8QxA/p
2MdA1YrsQkrImbsvRuHhmevZPSc9csyWwI8WVnmampVYsoQJTUBzqN7GyXGjAIli
tb13iBcfAyrMGhUeQd/FP7LGtMyAzvFuCPvjz4I06tt8cc+Epy4jUA8Ecy4QhLOG
IazvBHSQ6JD99eYshyut2MHycoov8CuSMWC1W19DDjh3fyJo/lQ9mWzqufaFqMUD
NhxdithZU8Tw0+Ywc2dw
=YiEJ
-----END PGP SIGNATURE-----

--pEAjBjStGYT6H+Py--
