From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 09/10] mfd: cros_ec: ec_dev->cmd_xfer() returns number
 of bytes received from EC
Date: Fri, 27 Jun 2014 14:31:46 +0200
Message-ID: <20140627123146.GB29156@katana>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
 <1403115247-8853-10-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403115247-8853-10-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 11:14:06AM -0700, Doug Anderson wrote:
> From: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> When communicating with the EC, the cmd_xfer() function should return the
> number of bytes it received from the EC, or negative on error.
>=20
> Signed-off-by: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

For the I2C part:

Acked-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>


--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTrWQyAAoJEBQN5MwUoCm24ekP/RTz4HAlV6gUbBbVucnd+3Iq
VbfnIvEeU7dtooPxbWOXR5GuF7ov2m9EKNYwDcvfz04aPO9DnB3D9Vc5U7PMaR+G
mYOP8vVKxDPAlX12dyumECZP2oZoINABn74esUtwKnUAUBZDqp1ETxoY3Rlnc06x
ry6kowHBGkYAW9IpqwyLs4gbQ+KfWn/o95ig4lwM7/hsgwq5QzxPjRxbSIzKZBgo
e7Z6PGTxdoXNmnhtWtfkaQMzz8T9b0AWZSXJ57R0L8wernlC9CElWhuNvEv94E50
llhAQt7agScIrWypLtV6SG1tSxNRSwxJvNopSpU6rrGVGZ/zkgpTcE/aPKp4waV4
vL4UqbDCAbJM3n0ME/1p7i+3yINCJVZXSHeAQhQDQiN0GQy5QqW7Q4D7OpM01VNh
1wuJYy/2ho0t4kUHn4d9keKjFztcXB+0C8++W1TX0mFseza11cxmta7sH6FGlwSU
N00zapBrQYdmsqSdGMA3D7Nanxo3j0EVhdCP9fgUuKFGdAvvQWNZHVCDvIOo+v5h
PerPAOmFV/sj2EFbCKiG+HZ4/JGC2ywzlup97nJ0PPFUPbEctUanDxxMsAo2H7pl
x8V0cTacPtIWmnQN7fCEmr7jWV6dAEQ8IN2aMc40mlv5jxSCJHoO2zJAEaKjNzlC
Zh2zMh+RCIsHMekpdNRR
=jMuy
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
