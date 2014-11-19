From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4 V3] ASoC: Samsung: Add arndale_rt5631 machine driver
Date: Wed, 19 Nov 2014 17:51:54 +0000
Message-ID: <20141119175154.GI22111@sirena.org.uk>
References: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
 <1415880864-2246-3-git-send-email-krishna.md@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mu9njEoJVcULXJK5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54421 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755888AbaKSRwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 12:52:08 -0500
Content-Disposition: inline
In-Reply-To: <1415880864-2246-3-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krishna Mohan Dani <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, Claude Youn <claude.youn@gmail.com>


--mu9njEoJVcULXJK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 13, 2014 at 05:44:22PM +0530, Krishna Mohan Dani wrote:

> Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
> ---
>  sound/soc/samsung/Kconfig          |    6 ++
>  sound/soc/samsung/Makefile         |    2 +
>  sound/soc/samsung/arndale_rt5631.c |  150 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 158 insertions(+)

This is fine but it is missing a binding document, please add one.

--mu9njEoJVcULXJK5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUbNi6AAoJECTWi3JdVIfQ2NEH/37mmpxTvTXTW+uD8knAg4em
C7e9lptsBKYEHErl2SqfYVbobFC/GbJydOtrzneaUDGvmkRz8SITrM72GyudyV0P
MazV3tAYV1q7Rq5885rPQD+DPKduF67fbaj5YX8edech/flLPBDl+0umVmE0I6q/
kvPbA1JKz95hxHsgOvt+myoxAgY1z61HJ9G0xV/4Xp1PP/q/s2cYsP8y2GK8ppZ0
dGSsqWIEKzt1wglyq8jXsDo3xBLPmhcqV7hgHuB7FVLOvYMAwJU1jAELk/aEaYDR
thow9116iZ4MS1y68atOtzwU1EV+CFz04VGzdJ+5cwOyoHAEiRSHsK5WK/CFzA8=
=jA/T
-----END PGP SIGNATURE-----

--mu9njEoJVcULXJK5--
