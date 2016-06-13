From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 4/6] ASoC: Add DT bindings documentation for max98504
 amplifier
Date: Mon, 13 Jun 2016 16:32:27 +0100
Message-ID: <20160613153227.GJ2282@sirena.org.uk>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O2lvLMQR9k8T/RyB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34610 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422987AbcFMPcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 11:32:43 -0400
Content-Disposition: inline
In-Reply-To: <1465815160-28504-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com


--O2lvLMQR9k8T/RyB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 13, 2016 at 12:52:38PM +0200, Sylwester Nawrocki wrote:

> + - maxim,rx-path : indicates speaker source interface:
> +    0 - PCM monomix output,
> +    1 - Analog input,
> +    2 - left PDM channel (CH0),
> +    3 - right PDM channel (CH1)

This should be a DAPM control.

> + - maxim,rx-channel-mask : a bitmask indicating active PCM Rx channels,
> +   bits b7...b0 correspond to channels CH7...CH0

This should be done using the TDM API.

--O2lvLMQR9k8T/RyB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXXtIKAAoJECTWi3JdVIfQQ3wH/iGC1/NmXWiVC4SkBbMZcuX2
0GjDIjA9FYq7wGRoeAtnCppIm5PP5knmuw+i3GjgGuxtO/PQFEuH1cg+7RLAM7ZO
8e+8D+GdfEqK4ouHHJ6aKi3bNqilJEBKH8wXw1KzdY1p5nNAukKZaDTnkwJ9M/NK
PoFQxBpBf5gTOJjWzW9+y2n95ZWGU4GxU38EYi81UeSEJtdFAPQWuj3W00iAb1zN
odYbq7R/ozR7OD6uJ/wKDgGEwDWv4QQSlflY+d+ceygbC7p6M0b6p4WydXqqcRAc
kqYo8LqxtXBqe6ngTCZn4tk2cnIK9cnbkPqC1MQ+y5Q7GpDOiVfG7FD1FEHxKA8=
=WwkU
-----END PGP SIGNATURE-----

--O2lvLMQR9k8T/RyB--
