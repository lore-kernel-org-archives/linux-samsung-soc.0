From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 3/3] i2c: s3c2410: Adopt i2c-s3c2410 driver for new
 enhancement of i2c API
Date: Fri, 16 Jan 2015 16:28:27 +0000
Message-ID: <20150116162827.GC3856@sirena.org.uk>
References: <1421419194-1849-1-git-send-email-p.osmialowsk@samsung.com>
 <1421419194-1849-3-git-send-email-p.osmialowsk@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421419194-1849-3-git-send-email-p.osmialowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Osmialowski <p.osmialowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2015 at 03:39:54PM +0100, Paul Osmialowski wrote:
> This adopts i2c-s3c2410 driver for new enhancement of i2c API that
> exposes preparation and unpreparation stages of i2c transfer.

This doesn't seem to have any dependency on the previous patch at all...
it probably does want a better commit log, probably the subject should
say what new enhancement of the API is being adopted.  ("Use
prepare/unprepare transfer" for example.)

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUuTwrAAoJECTWi3JdVIfQAAMH+QFSastTtArNA0Tft9MK4qm5
HdnPNzh1PhvNc4nQy92JWbERfd4WFxa+G2T4AUKejyREo9zbwMwWbRIiqoiO83D+
s28MTdiaZn/mVt5jDAvcegEkmmQxuiAIFDmfflmC1uJH++59ipptaxTl+yswnBgk
W4lFt/KAbz5oOMFOJngO08U+uzqRaOXnyecpFuee6JMgi6dx8OCqPIjUgYPG1D++
I41ISYGd9CrrWZv/mu87j6KU8kXqIwAwiM+zn+jjqPZu+k+UbssHJy2CEB+Cz2dU
iAarBhI9U2pRggGYdKSfjwQC31qnVymRP4PduqFgiGgT1+T4oa6/Qz1VTReoV44=
=nZB+
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
