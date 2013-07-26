From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/8] ASoC: Samsung: I2S: Add quirks as driver data in
 I2S
Date: Fri, 26 Jul 2013 15:53:19 +0100
Message-ID: <20130726145319.GI9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YCIOI/gPzpKZYkSw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50200 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759169Ab3GZOxo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 10:53:44 -0400
Content-Disposition: inline
In-Reply-To: <1374845812-7803-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com


--YCIOI/gPzpKZYkSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2013 at 07:06:46PM +0530, Padmavathi Venna wrote:
> Samsung has different versions of I2S introduced in different
> platforms. Each version has some new support added for multichannel,
> secondary fifo, s/w reset control and internal mux for rclk src clk.
> Each newly added change has a quirk. So this patch adds all the
> required quirks as driver data and based on compatible string from
> dtsi fetches the quirks.

As Russell indicated you should really keep the old name around, though
marking them as deprecated is OK.  However I'm not sure anyone will have
deployed this so I'm not sure how much it matters - every downstream
kernel I've seen was still using board files anyway.

The actual meat of the patch changing to a quirk scheme does look good,
though.

> -- compatible : "samsung,i2s-v5"
> +- compatible : should be one of the following.
> +   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S. Previous versions
> +     has only 8/16bit support.
> +   - samsung,s3c6410-i2sv4: for 8/16/24bit multichannel(5.1 channel) I2S.
> +     Introduced in s3c6410. This also applicable for s5p64x0 platforms.
> +   - samsung,s5pc100-i2s: for 8/16/24bit multichannel(5.1 channel) I2S
> +     with secondary fifo and s/w reset control.
> +   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> +     secondary fifo, s/w reset control and internal mux for root clk src.
> +

I think the -vN naming scheme was fine - I see where this came from but
the main point was about having things identified by a string not
switching the naming scheme.  As you can see from the s3c6410 stuff the
SoC isn't that helpful as a naming scheme as multiple IP versions appear
on the same SoC.

--YCIOI/gPzpKZYkSw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR8o1cAAoJELSic+t+oim9UlIP+gMchguQpoemvOZejggrGgUG
+gXY0KD/r1lFVPrRyPQN+jEB+6LJSg1B4obEKdha30aLb9Yt6jWIqqAkb6/GtCKW
wnf3kmyreqqVls+giEV5mXuCNKgwafq6fpcQIQWfPSYtiHltcXiFa1rM4fuh9uvm
vJDw7qRNqiA52vX1HzFRSOWkh47TuCodCXzkB3CiZMBSSEBIHiSGsER3gRGbXKyD
SMFnIYnvCp9BZa04ZM7Pl91sITQ8Hns7SSkQ8YSVODUmQzGodqMoSg45QWwXYulQ
P0A6f/00aDCW/sh/P1ibcfvADwrzy5fOPP2nbLUvxpiGYDGz8sDF8pVP8gSC5tbP
nFzJ2iVgX7fnYk+/Up76ovcMJ7d+QVXST7ECRT2kBkBmzJ8ugEZovF/qYVrfE2cr
gwz28r34w/YfEuSib9hdmJOLYobs5ocqu87H8CCXlAHjXyqlksuasVAn+jS8iZ75
08ZiF1uDZrEUt3kV54hFvhiNGw4gm+Ajt9XMnEf+mLPGha+Jur2OgR3Fd9BCzSUC
i0RU80bmcPIfFtB6D15GCDaJneolSaOfdq/AVvai8/T1Xgm5MWzyv4xBfc7st4Jk
ilSiTgWCmAHv4v/UQRJVb85UkV7E9grdct3t6kHOLMncari5ArX8gsr8nY+gDMb2
+eN6eBVXNDAl4wvQzZ6/
=aATO
-----END PGP SIGNATURE-----

--YCIOI/gPzpKZYkSw--
