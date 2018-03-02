From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 11:29:26 +0100
Message-ID: <20180302102926.fuqmfyaxiujjwill@ninjato>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ar6xsfpbsx22zbj5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519936484-23132-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Ben Dooks <ben-linux@fluff.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--ar6xsfpbsx22zbj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2018 at 09:34:44PM +0100, Krzysztof Kozlowski wrote:
> Interrupt number 0 (returned by platform_get_irq()) might be a valid IRQ
> so do not treat it as an error.  If interrupt 0 was configured, the driver
> would exit the probe early, before finishing initialization, but with
> 0-exit status.
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: stable@vger.kernel.org
> Fixes: e0d1ec97853f ("i2c-s3c2410: Change IRQ to be plain integer.")

Please configure git to use 14 digits here.

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-current, thanks!


--ar6xsfpbsx22zbj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqZJ4YACgkQFA3kzBSg
KbbOnhAAmMlAdAzlGNkDGU4DRpbMpAkScrAh9An4rjaRRPrAso5ZswfLGwlYrLMn
dH7cDirRv8FDSApDeISwdESGWgJeseDv6R2CRnDiOOUGTmSLOe3DeAtIPgASh4QI
drm83VyHB6/0fZu8vFCmQvZmQH7VHypFJkCgsRIwAIO3fECvKlWZbHz9Q+JEfak7
D6H/eHP8d4Pwd7uoCOrg+PPke3wpo+8/1chJWfmM4GUSv8CPHu92T7N2nlm8+60R
tKUx0IQp2hkUtG1blr3X3n8ILwC9cD2911iCv8izQpSAbtIgCDxT0LcNtgvhCPFo
0oJ7uUqLnGmeNgQyciTjPhIcS5avLl+1EVlwIUPO6xnsDAYImgniIxbu957KSfjr
VCm/e7QE8lL8RTrHQu5zoPoCLacwnPVWSqoX/PVThgMkyW18SRwXo5DjTuHFbtsc
Q+crYiMJIW1eooWEaBWqCuZ4e14/lAXxzDLGj/2JF1A3AjjvBMbXGSmIxThvv+gW
DDovRCigD5+L5LKKUfDvdjpZ0TLXlJmzhgL4kfu+f237paHvz/NE5f9k9wM9oyZB
tcJU9GPsIqmtvZFDMX64yJkjw5IksApXGWmCBt0Fs/ENf916c9ns//a/GhbmuyCO
4+SdQ5XMLyBrHF6IWyJdhAva1b2IpuDjMcdYDDYHyjkn2a9Gjmw=
=BRy3
-----END PGP SIGNATURE-----

--ar6xsfpbsx22zbj5--
