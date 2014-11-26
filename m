From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is
 disabled
Date: Wed, 26 Nov 2014 18:14:35 +0000
Message-ID: <20141126181435.GO7712@sirena.org.uk>
References: <1416828162-8216-1-git-send-email-krishna.md@samsung.com>
 <20141124170409.GF7712@sirena.org.uk>
 <F186754307084FE3B13FB03E93EF318A@sisodomain.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sj0nNMHKr1XTtrga"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39639 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026AbaKZSQj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 13:16:39 -0500
Content-Disposition: inline
In-Reply-To: <F186754307084FE3B13FB03E93EF318A@sisodomain.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: D Krishna Mohan <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, Claude Youn <claude.youn@gmail.com>


--Sj0nNMHKr1XTtrga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2014 at 02:26:07PM +0530, D Krishna Mohan wrote:

> Following your suggestion I have sent a patch
> (187024b36c635bd454c1b1587b58c9439d3a46ad on your git, branch: rt5631 )
> using ifdef which you have already applied.
> Since there are more suggestion asking for second (__maybe_unused) method, I
> have sent another patch for which below is the link.

> You may be applying the second patch on the already applied first patch. so
> I request you to apply only second patch in place of first and abandon first
> patch.

Once something is applied in git you should always send further patches
as incrmental updates to that, this is much easier to manage and avoids
any potential confusion to other people looking at the tree.

--Sj0nNMHKr1XTtrga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdhiKAAoJECTWi3JdVIfQOYgH+wcW6HqvSi/jo7VLKmL7S02I
LqroGgt6CHgSHJXfz3IkHS3XlriiX0f+oV2xK0db+B/imdPl+Og6nlNogJ87DigY
MarYtqFaprZO/pO0RTtdRM3JfmnMq+649WJkpdD4QSOiKNG/gZpBOBv5KPsCiZGj
VriV+aF7363jbJ68pptmMhGk8vR5xZM3/zM7/1ATGYij04ULQLHB3MBTyUg3ATU8
iLA7lZ7JW7HLcHrljsWYXHpxV4ZOgQ4KT2MRuOLrPFCfRyP+/kjLjq0V2STWGLQ+
WsAnKxEGASxrAf/mhd3Y1onQySToXq8Ew+6+j5uLy1/TqbMBnkkn8X5z6x0ckQI=
=fksJ
-----END PGP SIGNATURE-----

--Sj0nNMHKr1XTtrga--
