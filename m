From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 3/6] ASoC: max98504: Add max98504 speaker amplifier
 driver
Date: Mon, 13 Jun 2016 16:14:29 +0100
Message-ID: <20160613151429.GI2282@sirena.org.uk>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1vEdgMWljt97yA53"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34568 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423119AbcFMPOs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 11:14:48 -0400
Content-Disposition: inline
In-Reply-To: <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com


--1vEdgMWljt97yA53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 13, 2016 at 12:52:37PM +0200, Sylwester Nawrocki wrote:

> [s.nawrocki: removed unused macro definitions and regulator handling
>  code, rewrote regmap config code, added support for speaker enable
>  and global chip enable through DAPM, rewritten as component driver,
>  redesigned DT bindings]

Removed the regulator handling code?  Why?

> +	default:
> +		/* Analog input, disable PCM, PDM Rx */
> +		regmap_write(map, MAX98504_REG_PCM_RX_ENABLE, 0);
> +		regmap_write(map, MAX98504_REG_PDM_RX_ENABLE, 0);
> +	}

Add a break here please, at least for consistency.

> +		ret = PTR_ERR(max98504->regmap);
> +		dev_err(&client->dev, "regmap initialization failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = max98504_probe(max98504);
> +	if (ret < 0)
> +		return ret;

Why not just inline this code?

--1vEdgMWljt97yA53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXXs3RAAoJECTWi3JdVIfQDa0H/RJEIpnxoLlBbIvwv9vg1HeV
aIP5p+wPlHuLnaT5zymI/GsWKdkE6r7MrfNX4X9sIpMKbfdp6Kpfy3aJpyCfckOo
gLUK9wQTbUHJmvwwM9tSgJMXiJvgHVj98NRDlI0aXH0XuybfkpS1wCY6CMhOLA7p
oLNRFRmT3to9dL140iFVjrHVvm0/VVN7MQkpO9lcSs7jRP/YGBkq6lt/fL0SvFOx
UQ67Xt+hVBTT9/IMY4wJ6bSxhGa8PC5KvZgCi7EXs94nIfeZMc2fmjE8/DOvSlDc
b7HrMxu7oMSvOAA/jBdqkFLYKPldMYNvFRSG/O+Nh2pdQmYJvnKvsI0YTCA9+o4=
=J9Pe
-----END PGP SIGNATURE-----

--1vEdgMWljt97yA53--
