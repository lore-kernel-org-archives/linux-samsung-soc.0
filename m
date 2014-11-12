From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4 V2] ASoC: rt5631: Adding Device Tree compatibility to
 Realtek's ALC5631 codec driver
Date: Wed, 12 Nov 2014 22:29:54 +0000
Message-ID: <20141112222954.GW3815@sirena.org.uk>
References: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
 <1415781339-16089-5-git-send-email-krishna.md@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mszkcu/oHwKbXhjW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35567 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168AbaKLWbQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 17:31:16 -0500
Content-Disposition: inline
In-Reply-To: <1415781339-16089-5-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krishna Mohan Dani <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com


--mszkcu/oHwKbXhjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 12, 2014 at 02:05:39PM +0530, Krishna Mohan Dani wrote:

> +#ifdef CONFIG_OF
> +		.of_match_table = of_match_ptr(rt5631_i2c_dt_ids),
> +#endif

This is OK apart from this - you don't need the CONFIG_OF around
of_match_ptr().

--mszkcu/oHwKbXhjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUY99hAAoJECTWi3JdVIfQFFgH/jkDfXzxGO1LjVXeGKj5VBR2
79DZQdAivzeX/IOk46phdxgQlCRPAaaqAKrDK19riMKUrpS8e9yCFPPcg7q52cVq
5mOfYD/HLHKezisFGuHYlpRl9NYIysbKi5N7CiCoh6qlzQ3TELGq2jDibJnySgHq
rDbipkGBk/F+lx5kwoQBFEpXjNGye1eBSTBeUw2SiRicebjucMpkt/QZR468hfxl
2b52ClQuiG/QtXh0w//k4hcjCfi5uizfkaLB4INN0qrwpu518UUhwHGxRlB+jW/t
WaAu6ufJMK5UQG+bebVZeI3zUlAxc2o1y7lwiyB17lWK4JDiMmtUW7CL/w2K1i8=
=t/zC
-----END PGP SIGNATURE-----

--mszkcu/oHwKbXhjW--
