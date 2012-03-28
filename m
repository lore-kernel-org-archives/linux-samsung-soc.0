From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: Samsung: Make PM_GENERIC_DOMAINS config depend on
 CONFIG_PM
Date: Wed, 28 Mar 2012 12:34:19 +0100
Message-ID: <20120328113419.GM3232@opensource.wolfsonmicro.com>
References: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
 <20120328105122.GF3232@opensource.wolfsonmicro.com>
 <CAJuYYwQgZqN6nguddjS6bjLhx_ZhUZ5AfcrSAKBa7Ft-Bn6wPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ICrdrp3pM9DyZLTK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51483 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932285Ab2C1Leq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 07:34:46 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwQgZqN6nguddjS6bjLhx_ZhUZ5AfcrSAKBa7Ft-Bn6wPQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org


--ICrdrp3pM9DyZLTK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 04:51:32PM +0530, Thomas Abraham wrote:
> On 28 March 2012 16:21, Mark Brown <broonie@opensource.wolfsonmicro.com> =
wrote:

> > What's the underlying issue here? =A0This seems like something the PM c=
ore
> > should be dealing with gracefully...

> The PM_GENERIC_DOMAINS config option has dependency on CONFIG_PM
> option. When building with PM disabled, the following errors occur.

Right, this does seem like something which it'd be better to handle
more gracefully in the PM core.

--ICrdrp3pM9DyZLTK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcvbEAAoJEBus8iNuMP3db7cP/RT9sEg7DpnLW7JhRpYcyEHM
vwbwcD31u7sqprppgbtqijyMtXUswtwCehjTdj5CM01eavd+UYMWrpZjhZ658oQ5
rpicp3ILFuae+1NAjZ/lFjTn/oZ5DoIW/hQwXyf2zU0g9sV298pEucim8lxGBo0a
VC4TghzkPtHU3XBFHlNfQoi0G/1s7Cn0TC1jN2upq1gAG9NNfUZ3UXDvGLvMuywS
+yXiHp0IWI2YMIxvDQqzj/4Dq4lvB0JlI+ZfObdemXWubplNXF+YS9fpnJbmwIVl
fP6iica1qrVLK6ECu0IeQATQdaKGrfFasCQB2X++fT6hRHbZQINs+U2Y5yOMxO5g
7VZXYSCz3GLvGCS4qlrlCyiay2IzDe8tl/kI3pk9yUyYXOVWyVP1r+8oJOFzF7G6
ns9pod2eTxgseyNHtxBix+3Qn9RNwijOK6EKpHFVOwYmCZ0t7sv9bwijOt+gIKg8
7WWo9X+nGu5WOfghMmDB72AEWNqw42EzdGd5ek7CftXIREyqIqFCJzYB40FaJdGj
3mgFS2eB/ebQOqd4mWCAAknyKRcQ7DjZwm128VXn3eBc1fVxQFslsXAWyhGPrC1r
XKmREeq9gCqus5N2MAcilMzwqxeMGLoH3T9Z23La4qtK3CPs2eD0DcUdDPMCqkj6
EN/s/FsvOAXWKpt8gZMz
=67io
-----END PGP SIGNATURE-----

--ICrdrp3pM9DyZLTK--
