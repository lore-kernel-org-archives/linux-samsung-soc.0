From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 1/2] i2c: s3c2410: Handle i2c sys_cfg register in i2c
 driver
Date: Fri, 21 Nov 2014 17:47:26 +0100
Message-ID: <20141121164726.GA1426@katana>
References: <1414656270-8048-1-git-send-email-pankaj.dubey@samsung.com>
 <1414656270-8048-2-git-send-email-pankaj.dubey@samsung.com>
 <20141121072545.GG1480@katana>
 <546F1140.4050709@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <546F1140.4050709@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >I usually don't take DTS patches. They should go via arm-soc. Please say
> >so if there are reasons I should take them.
>=20
> I CC'ed to you because same patch contains changes in i2c driver.

Yes, those should absolutely go via my I2C tree. You need to make a
seperate patch out of the dts changes which then also should go via
samsung-soc, unless Kukjin says he really wants to go the via I2C. But I
guess the latter will just create merge conflicts.


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUb2ydAAoJEBQN5MwUoCm2CuIP/0EDmy1XbiZ8nKtZZ51gE6Wn
cXFcyI4V1NUKdXmQwDMrkzhZgUx4cam4cHyex3qcYXdC0dp6p5tgM+A9BPfBLTUD
8CUBP+M9gV+UHOYWxF5w+O/uRGV5UyjuNf9iH66uDHpG0dzebnrj+XuN1+yE9Ett
zLG1/i3UyDuFNbRKBBfEanBnqXzONreWWZYa9cX3JREDz4R4pVcqqRfPM46CJX00
6T5CgTbh2+pWsdPfMMQeLe2YSkYu2BgFgak6MN7uOjSBNhr74oK+qTkhXBuoVN58
AHbsOYOEDEqpkbxqYRr+LK5G/916dD6awgXxdprveeNL5AWeOEvdxN2Kbr6TfbA6
PrhklVw0UQvFNY/qAWp76pR7EtBEw8IGygYp9W3XweUtw2KnvcptdXqU6xwCGt5K
NGnlbtNTSP6yF1VqJbGtrgx0oBP9qK3OI8oD7ZE9oeUaub/sVN8/U1YpvVOFyX1q
9wN6aznawsGguc9CxesC+qu2F3La58BzFT+rSyRCTMH/dlJ1/qamUjhqca/MeZef
pRwZp/7z92NnWZ8v5f5E+FFkxZ9JT6ojD4k+3/0T40frqS5jT/5UiiKw3CYYG6UY
AHPE8T0yp68v69fA2eOuLKu8NV9yHKQAVPPG+kznwz67x3XE1zOBX429A/f7Nqgb
1CVNTC5UWoC4tp3tXfhR
=/0Y7
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
