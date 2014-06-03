From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 3 Jun 2014 14:17:12 +0200
Message-ID: <20140603121712.GB2713@katana>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
 <20140603100546.GA12261@katana>
 <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com>
 <538DB979.1030305@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538DB979.1030305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Couldn't it be made configurable with a Kconfig entry? E.g. "Enable
> deprecated class-based instantiation" under Drivers / I2C? Turning it
> off could make the code ignore the class field completely.

Technically, yes. But we could also wait another cycle and just be done
with it :)


--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTjbzIAAoJEBQN5MwUoCm2p70P/2DPTAbnTc2FYiMYjM/TwJ3V
ubuEwUCmyj22YIuetalPkXNCAnEu49tXMohUJqIqMZlBAu1KYg67AGGOc8oecMEj
dLI3nolRFT6QCdt9XocignSEjHBZ2YjAdl165O2JUMA77pN8Fo++rE1LdbZYITDY
mN5bcWqrxhAxir+BDdNmShD4EbIwqGM9A+pzeldk8VVe8H4wmuTTlpEu4bUpDL7y
HXfu/Bb5YUI0arcytn62y95BniTypkVRXHdTdDbeRppjJ1SrmDZ1IkqYEB7eoa2m
gOgTdM8YbO2uQRRR9SOUmUEn4HX7RaDG3L4xmc3kQOenubJeDltF9CJOQCEAwwO5
1KUZAVUXqBGAjXMof1fKFQwaT0ifrY+X7L+2Ez47jdZKW6CGOLmm7co+Fcxv2AgS
56MA7aaZKze/X+Jo4kvgE8veZLgqy9cXnmHkby0rSrX/s3BJavY/RNmPS3wOaPs+
rmirQ6pSm2+ht1lMbO9TxOlEiZk21SDJBdHjCBEU0iXNLum9lVYs/GNyxTQ3U3z7
Y9M4gzhxqgQ3zDSTu6Rq63Ag8BDo+125kg4tDuouL6InwUojolRw5yluJQDEISiS
Ig+MsIdICEoU0DeelobYWQhpxKqI08ksC/eHz5pdp8zNNl5gA6m9HnqTRioAPxMn
39ctOG6zwwXpDbfBCfKE
=EjXm
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
