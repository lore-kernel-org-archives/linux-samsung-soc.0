From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4 V2] ASoC: Samsung: Add arndale_rt5631 machine driver
Date: Thu, 13 Nov 2014 10:50:32 +0000
Message-ID: <20141113105032.GD3815@sirena.org.uk>
References: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
 <1415781339-16089-3-git-send-email-krishna.md@samsung.com>
 <20141112222902.GV3815@sirena.org.uk>
 <A1C3160B59C9424AB8F073F7A67DB325@sisodomain.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="puSpz/EL7GiLByGQ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36156 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbaKMKwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 05:52:10 -0500
Content-Disposition: inline
In-Reply-To: <A1C3160B59C9424AB8F073F7A67DB325@sisodomain.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: D Krishna Mohan <krishna.md@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com


--puSpz/EL7GiLByGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 13, 2014 at 03:45:57PM +0530, D Krishna Mohan wrote:

> From the rest of the comment what I understand is you want me to change the
> names of struct snd_soc_dai_link and struct snd_soc_card.
> Am that right? and/or do you want me to change the names whereever it sounds
> like generic and make it specific for arndale - rt5631 pair?

The latter, but just the former might be OK.

--puSpz/EL7GiLByGQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUZIz4AAoJECTWi3JdVIfQj8EH/RAE/ipE6w4rpCwqzDP32e0h
MQsUFn4xFsjNGZnIaahBRbcIOQJbRcoMRHb3q2afdM7ij2I5LH+65bWIv2Ypmtrx
4HnFsezuhTn++YbnMFEwg3M5Bykmq3a19GTha5hr1+abJZqXJmwxrpN/NTKRu0Wi
ur1bdk/InlyLhg3kvS8acJ879IrZJ4Zs0etfSvhFf0jyQaqh5a0r3zzCdnp5oa+c
Ay6rO36QyPZ9eAwLdIPh8Z7YdgbYojYvkOZVFvmqwEeCe3LzuP7cJyctHuuslXoq
yxpFM4pJL+QGd2zLcT8up4yltaZ3g+lTvi1ReG5iyMQuNmZrGCncqYnNbhoDjGM=
=wg0X
-----END PGP SIGNATURE-----

--puSpz/EL7GiLByGQ--
