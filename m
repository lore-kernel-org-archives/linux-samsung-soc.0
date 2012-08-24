From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: use %*ph[CN] to dump small buffers
Date: Fri, 24 Aug 2012 14:25:37 +0300
Message-ID: <1345807537.2848.280.camel@sauron.fi.intel.com>
References: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-zJYI8ltl+wBg7WW8Ue5k"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58977 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752060Ab2HXLU7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Aug 2012 07:20:59 -0400
In-Reply-To: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jiandong Zheng <jdzheng@broadcom.com>, Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org


--=-zJYI8ltl+wBg7WW8Ue5k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 16:06 +0300, Andy Shevchenko wrote:
> There is new format specified that helps to dump small buffers. It makes =
the
> code simplier and nicer.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-zJYI8ltl+wBg7WW8Ue5k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2SxAAoJECmIfjd9wqK0GtQQAKJ9DOU+TleuZGZtBTBRFWVc
XtfG1NEeKoJySxmS1e3xUQBwkTITbbBZJ2DqmMWP3cFfk6GwASP4IXh87gOF0qh/
Re1sV7pDkaBhfdoOIlmpPFJE5H0/9BbYNEojdvIyErLO0kbFpE3mr0uyLDRZinmM
X2xNclBbwcdRHyBBWMXsXuIVlqYY7iXVE8fQ0oMxsYgOQj7mKfTThERR7EER8+jI
aaFdR2VJE/o7T8tQHM8DrDOenxxsnektDJ5UVxrutinGrGIGSVIkzENn02cXsVV1
AEsMSQEMU6ktr8NnWmCxJ731RQiL5gRv5VXr5CETFFXQwYZ+TouRJZilKv11lLTQ
VZbHFhRtMOX8qrWtTfJffg1XZHPmhbl9vcJYR0yQe/bLflVF69WudmB/dsq9E1yW
uhvtzhhh9W3f+x1F07PUKHQ2j9c7/BCXum0w8Sll2mr3iW5HYQdZVSzBo5y4/erv
12g6BPKVbEtJUWnQYs4NHbAQ4XyXjhROHcTX8hbr587eco9GckY/cunW64BlWVZ3
Vq67tI5zCKbefIrC8s2KZgMpb5IVylQubCUvasE7bQ7EYoOtF4ZxTqwMnOvFO02+
948QYTTiil81wKlUUD4q/5meaxlSA1gFHEzu6N54MWC185GN1lrLJr5ToABx1RmL
rsDic7+lwWdcv77Imi50
=83hJ
-----END PGP SIGNATURE-----

--=-zJYI8ltl+wBg7WW8Ue5k--
