From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 3 Jun 2014 12:05:46 +0200
Message-ID: <20140603100546.GA12261@katana>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:53644 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbaFCKFt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 06:05:49 -0400
Content-Disposition: inline
In-Reply-To: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ch.naveen@samsung.com, spk.linux@gmail.com, Olof Johansson <olof@lixom.net>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2014 at 02:30:22PM +0530, Sachin Kamat wrote:
> With multiplatform support enabled for Exynos, class based
> instantiation causes a boot time delay due to I2C_CLASS_HWMON
> triggered probe. Since class based instantiation has been
> deprecated since some time now, remove it for Samsung I2C driver.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Olof Johansson <olof@lixom.net>

In my book, not long enough. I suggest I will take care of the removal.
I'll do it for all class deprecating drivers.


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTjZ36AAoJEBQN5MwUoCm2bUsP/0QhGDuOWnZ4WYq2u/z74BjT
4ox6HZyMl5JK2l+XoPVnbXMJWlom/jHGfAS0uYx979+8gFwPvW8rpd+75P+mTjxq
BgEkfPS1UrY/fes+mCzATx6Jj1jPqRsZCCEMMVGrH1l5EKHdlvAyEc5LVjy9+aG6
MGhph0Fq/U9dfodnOKZdlzssCXWKLoptEApHNJaIWbkHLwMG4JNvcmaR/JQv/Kaz
qoZ+vthdnu93SUsenpdrEDtapSBFSsHfRHK0NxWgYr1ykEggvxsvXdSB5BNSuV2I
kIGAP676ZOQTXQviH6psy+nOZp+wfBkrXA0ImSBDT5JcNclTsgczwWZXWJ3vmwMj
b5zdR3CNmYHUya5qKfzUqLsQASe1SoXSXHEj0wS8t1rH4X7hrio9iXILsXxVEJFX
kkyMAyGKJ5uF+T8X7823Rs1mmr4+WNKsR6vjEVbHzygBlyPJ/L8FLnD8VsIbtRL6
kONiCG/rcQdLgdYosXFDqgLncJdnrXldTurZCljIwKDtF1i9t4jLWxQN2AF/EOv5
TJimTJFEFedzMhZecuvFrK9qB76YqLAvWqtou7SotYKZXZyXyEInfBFVY0dMqJSC
CHMbWngYFN2PyxgZvDZHL3APSWUMKM1DCTqX0umxWvMpRDfDBud40kI2Bm2XV2gF
3drtqJGqALKedKZ6OYxY
=p7QR
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
