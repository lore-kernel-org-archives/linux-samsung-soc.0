From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC/PATCH V3] spi: s3c64xx: Enable Word transfer
Date: Fri, 11 Oct 2013 11:57:06 +0100
Message-ID: <20131011105706.GB21581@sirena.org.uk>
References: <1381466868-27679-1-git-send-email-rajeshwari.s@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rSajjWT08XXIcVzz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42790 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751234Ab3JKK5P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 06:57:15 -0400
Content-Disposition: inline
In-Reply-To: <1381466868-27679-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, sjg@chromium.org, alim.akhtar@samsung.com, dianders@google.com, t.figa@samsung.com


--rSajjWT08XXIcVzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2013 at 10:17:48AM +0530, Rajeshwari S Shinde wrote:

> This patch enables word transfer for s3c64xx spi driver.
> User can set bits_per_word to 32 before calling spi_setup,
> which would enable the word transfer mode.

As someone mentioned on previous reviews there's nothing in this patch
which sets bits_per_word_mask, you should be doing that.

> Changes in V3:
> 	- Corrected the coding style nits.

Not all of them:

> +	if(sdd->cur_bpw == 32) {

checkpatch should've told you about this...  I'd also expect this to be
a switch statement with a case for 16 bit words too?

> +		/*
> +		 * Enable byte transfer if transfer length not a multiple of
> +		 * word size
> +		 */
> +		if (xfer->len % (bpw / 8))
> +			bpw = 8;

This check is redundant, the core will validate bits per word.

--rSajjWT08XXIcVzz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSV9l/AAoJELSic+t+oim9Ag0P/RCPATZzNSn4Wq0K7LH3r2XE
ER24QDtwUHqHddD+Ypj7/WyMSkANXRPm8VDT9rejHAlIqy/36MV2Isu0PRUYGURZ
Yr2LcPS7JgN5yrGfXbcWuc2RytA49ExL47/R7IhIuIrkz9Ad4pI+LZzuDGQyf8Yj
ZzWCERFlvRw6i7jqjlS4E4ekN1oJxueGKDtsNbPD0znpsQ8/bpoKwLvQHUGLI2Js
ryyW/Sr3N8Y9oKWXedaVMoaDNorLExhWCuVYaQGYRTJXEm2N1bNrOZnuJeAlYt5a
+FFJwcJQA1vCKkoNwbz0IiFZfN3BMuDDr5Hu17QiTGpKGfxFk4l9SfG5dDUi99B7
/YTlINZhqunLTNOzDORV9Q4EZNGGTd5Z3Mgd7njS/pycDorD4hvkDBUcKpDDId73
GAZ8Jo8DjasqXJQWACcidXSgLaJtFj1YoM1M8kfokNa/MmKWFnQRPSgikekV2X1G
7mOSYQWEpHwti6Oi7DnBtCJ+v/ou+qR1XCM0KpfyHYOu2lKhNn54xxTLZ2x4R31I
s09cW8y/3lKgS7+Qpy/BPvgtwUZlx0qznymJbFXr9TGEqwBAP256ntJF8iXT2nnt
EsdQKjmotGqtmYc+HFiSMDA10C5onhWx8xddgCp+/ETtkaqpN6rUzbWBJRJiHGEN
38o3o74Re0FP7dAkULge
=GcFb
-----END PGP SIGNATURE-----

--rSajjWT08XXIcVzz--
