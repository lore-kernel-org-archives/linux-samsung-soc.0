From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Fix compilation error on S3C2440
Date: Wed, 30 Jan 2013 10:18:58 +0800
Message-ID: <20130130021857.GF4945@opensource.wolfsonmicro.com>
References: <1359392823-30529-1-git-send-email-agalakhov@gmail.com>
 <05e201cdfde6$c711cb70$55356250$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DEueqSqTbz/jWVG1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38102 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753328Ab3A3CTF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 21:19:05 -0500
Content-Disposition: inline
In-Reply-To: <05e201cdfde6$c711cb70$55356250$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Alexey Galakhov' <agalakhov@gmail.com>, linux-samsung-soc@vger.kernel.org, 'Padmavathi Venna' <padma.v@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>


--DEueqSqTbz/jWVG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 10:06:24PM -0800, Kukjin Kim wrote:
> Alexey Galakhov wrote:
> >=20
> > There was a compilation error introduced on Dec 7, 2012
> > by commit a08485d8fdf6f67ca5f173b68d8f873c574745f2.
> >=20
> Following is better:
>=20
> The commit a08485d8 ("ASoC: Samsung: Do not register samsung audio dma
> device as pdev") introduced compilation error.

Can someone send me the patch formatted in an e-mail (rather than
quoted) so I can apply please?  Though I've got a horrible feeling this
will conflict with Padma's work...

Always sned patches to maintainers.

--DEueqSqTbz/jWVG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRCIMBAAoJELSic+t+oim9cDQP/0wcsnqvOT7V6EONQ3uTnbr3
9TH/VOJtytEMvknsX2Epy3Z8Qnu8VEgqnHdkxcOmR4/9mu0G8wqFE0j/gx1T+qjt
tddxb2MTSdejHFH5rhp7yqm/WaK1UpvUc3M8eoRNMGDbCihE0vdFpOcQ4vUd8NEn
ldqoRbQnOhV6+NNvIri1bDja7pgVzexuD7Y4RCMCHC7UoeyXt9kKRT8xiVo5Xdfn
0gCvAG2bKIeh3vzWJsWWJ8BpRbsX/hQMUcHFFSlYf+PjPxh2JXGPFtk5E3yJ7YLM
skb9xjoIKJRViLjgUpV8rLwlC8PIBWqj4ouNgWrk/TcnK6U/9aK1BpF3NDEMiygb
5hu4s8ydR8QD0KYVoOQFAiPSjBGzL9yb1QUm/NGWuCXM96PRyp/QfeyvqXc9H2ZP
PE5RSC5npM0ADRAKaMuK/tKsfcRWq6Om1dA5p+oOTDSFtxg5DPYjtmiopvrQgih5
Yj4x55+9tJ5jIOFyaZbBk1T1KThREOhDJb+ISVSaaUBehU7/+k7zSMBsFBgawe8s
PKjiJ6wNMu/WuKc69EUraK1r3JdD8+HWLA6MGEohYUFrvux9+y6tWx2Oibm25bwZ
zrh+azgRDrRzBA6+M6AkRhHNTOnJqfKhuq3MsxTh/tIAZuFCzmeWriNpoJSDPFjN
juVwc0g3mVOniuU/tIVN
=Fcx5
-----END PGP SIGNATURE-----

--DEueqSqTbz/jWVG1--
