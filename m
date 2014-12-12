From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH/RFC 12/14] ASoC: samsung: i2s: Add clock
 provider for the I2S internal clocks
Date: Fri, 12 Dec 2014 20:03:42 +0000
Message-ID: <20141212200342.GV11764@sirena.org.uk>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-13-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v0nHJk0tUyruD8GZ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57129 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753037AbaLLUEB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 15:04:01 -0500
Content-Disposition: inline
In-Reply-To: <1418319952-10163-13-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, padma.v@samsung.com, sbkim73@samsung.com, drake@endlessm.com


--v0nHJk0tUyruD8GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 06:45:50PM +0100, Sylwester Nawrocki wrote:

> +Optional Properties:
>=20
>  - samsung,idma-addr: Internal DMA register base address of the audio
>    sub system(used in secondary sound source).
>  - pinctrl-0: Should specify pin control groups used for this controller.
>  - pinctrl-names: Should contain only one value - "default".
> +- #clock-cells: should be 1, this property must be present if the I2S de=
vice
> +  is a clock provider in terms of the common clock bindings, described in
> +  ../clock/clock-bindings.txt.
> +- clock-output-names: from the common clock bindings, names of the CDCLK
> +  I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
> +  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices recpectively.
> +

Why not make this mandatory going forwards?  You can add a note saying
that older DTs may not have it.

> +The assignment of indices for the I2Sx clock provider is as follows:
> + 0 - the CDCLK (CODECLKO) gate clock,
> + 1 - the RCLK prescaler divider clock (corresponding to the IISPSR regis=
ter),
> + 2 - the RCLKSRC mux clock (corresponding to RCLKSRC bit in register IIS=
MOD).

Why use the indicies here, they only seem to add obscurity?

> +		clk_put(rclksrc);
> +	}
> +	/*

Missing blank line.

> +	 * Register the mux and div clocks only if both source clocks
> +	 * are available, i.e. for the I2S0 instance and versions with
> +	 * QUIRK_NO_MUXPSR quirk not set.
> +	 */

Why not proceed even if one is missing?  This repeats in words the if
statement but doesn't explain why we're doing this.

> +	ret =3D of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
> +				  &i2s->clk_data);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to add clock provider\n");

Best practice is to print the error code.

--v0nHJk0tUyruD8GZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUi0odAAoJECTWi3JdVIfQTfwIAIJajeCegYrDXaw7DIEQYqc4
PiOw9203Q4y6wO2dF7QMoe5DP7TkPa/gIkjPPqX7njVwen3f3XdvbS8jFcE9gJdq
E+fc1mQdaLJXk8EzZt+e3xDDlCfTiEAUivHYC3SOyAddp5ZPTTS3BLZ3YJ41krxp
sbsuP9QCARSNnYlgW2XKo8SA2ykDlRIHIQzzRyLrELI5+h1moo+sdl3ruKLjFdsR
38SkFUnbHzrWi3Uf7i/XujQ6DlNYs8v/BSbGZrVzQJ3OiKEwmuNBGwjdNOrUxOXP
cGeDG3gRQpwiI2vqc7s5PI2uO+tVLwYKQjbiXEVunrtq+pM3EwtQ/TLu0AT9q+4=
=nQVx
-----END PGP SIGNATURE-----

--v0nHJk0tUyruD8GZ--
