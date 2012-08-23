From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Update configuration for WM5102 module
 on Cragganmore
Date: Thu, 23 Aug 2012 16:20:31 +0100
Message-ID: <20120823152031.GH7995@opensource.wolfsonmicro.com>
References: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <0db901cd76b4$7daf1730$790d4590$%kim@samsung.com>
 <20120810100713.GH24328@opensource.wolfsonmicro.com>
 <0eff01cd777f$4c9d1f90$e5d75eb0$%kim@samsung.com>
 <20120813122359.GA13446@opensource.wolfsonmicro.com>
 <1d5901cd8114$023550f0$069ff2d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rBJlyiOWh//u4rUk"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43367 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752364Ab2HWPUe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Aug 2012 11:20:34 -0400
Content-Disposition: inline
In-Reply-To: <1d5901cd8114$023550f0$069ff2d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com


--rBJlyiOWh//u4rUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 23, 2012 at 06:45:19PM +0900, Kukjin Kim wrote:

> Yeah, actually SoC defconfig in mainline doesn't cover _real_ requirements
> for (mass) product. But I think, it's time we need to sort out the
> defconfigs so that we could use them efficiently on product. BTW, if
> enabling board in defconfig, at least, unexpected build breakages could be
> detected by testing defconfig before merge for mainline...

Right, sure.  I guess the main thing I'm saying here is that I don't
mind what happens here, it's certainly no problem for me turn them on in
the build if that's what people wants.

--rBJlyiOWh//u4rUk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQNkokAAoJEFJkBDiqVpZ4388P+wTfv6eg+ilAI8WKJIMRTRqr
qoGffMKFmLNFb+txLx0xiDU36Rg32fIKg6z2qRZfEaXCaHn1lLwRhXmu5YS3SGzd
qR+DYAo2hkHnMWav/XfmJ3uKp2AZ8t6TwsP9TMdoPBOG+HmXDjg7YYE0qqKpuM0P
448cUbjwEz8yuxE4qLEGf2rvcQ5PliJgVyAF+DVG+bIryYRVxPlIhgzDA8uamFFP
/mGn57g+GNdNkt6NPcQEALktS3fNAMTh7vE9moV+haqbQV6wpdqVUpTQxB5VRoAI
TGlRz1PeBMNqXUxW65kLgT1Y/ISYtEW7W5VtNU6csuYJwaUKV/Jm0pKAw/jc2Dfr
O+VwF4++1RjtKfPjXS2P3lB4e5w5A1FHuiHhrj3YPJkaDRZGrvTPTIa5931UZR4Y
/ganxV5/P85HcLC00QZJlCXRRRX8ZXfD3IVCDbZDjGbeK9DxaeUg9MdiSaU7tGo0
vNBuk122H3949qbmpXRBfajSEcdENHebYm86kMCN5OLjtOEcPS0XhBE+h3y9hF2E
xt9vQOvi7qNuqTYBaECUH1XJkC08EHkgC8FTb+Zh5NKs6uxKw16kc1Y6FFprcB/d
0nkpGYs5WJRJdvSObgOBmHmEuOayt9deiBKAGDkZPrwckVSKgrlpAoHAyjuWsrFN
AgXUu32mJUZTOJ2vRFwB
=Utq7
-----END PGP SIGNATURE-----

--rBJlyiOWh//u4rUk--
