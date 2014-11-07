From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: Samsung: Add quirk for internal DMA
Date: Fri, 7 Nov 2014 10:38:23 +0000
Message-ID: <20141107103823.GE8509@sirena.org.uk>
References: <1415343280-18916-1-git-send-email-padma.v@samsung.com>
 <1415343280-18916-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pCBpnpYZ3zWUlzNh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48202 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbaKGKii (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 05:38:38 -0500
Content-Disposition: inline
In-Reply-To: <1415343280-18916-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, kgene.kim@samsung.com


--pCBpnpYZ3zWUlzNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2014 at 12:24:39PM +0530, Padmavathi Venna wrote:
> Internal DMA is available only on some of Samsung platforms.
> So added a quirk for the same and made it optional.

Applied, thanks.

--pCBpnpYZ3zWUlzNh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXKEeAAoJECTWi3JdVIfQhgMH/iWlCR1Hmwb+C6hai2n6Ytqr
vxvpLl6SAO7oahXa4aOczkLkJPYPR0yxBmgJjCdcLgqgJvWAKnOUIwCl+jhFEi6p
dMQCRPHniDpiAP1V+NPEB2v3h4tNdusc/Y+92uytupKQzrSm3i1Q16cz/GXYQpcj
o7ht33/S3tZwVivF/5xXfqZoi1YdfUZsOOtELB2yyUY+TakpYtPa0y980qLjz2hq
EpTWL2TheHlKH7kh9HG1UoxadrCN0M0+GRn++98YkUP0vTz1ftgVxtaVakacqJ5y
+2dYGLtctM4rkpocKMDbYmA/l8EDliPSZYwVSeoMGWci/67chzwINES7VmjA/MM=
=h+bA
-----END PGP SIGNATURE-----

--pCBpnpYZ3zWUlzNh--
