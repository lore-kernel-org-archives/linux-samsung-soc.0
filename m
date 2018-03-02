From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 12:08:06 +0100
Message-ID: <20180302110806.naskbf5n7eiugsjd@katana>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302102926.fuqmfyaxiujjwill@ninjato>
 <20180302110002.wmkvktobi7ssmin5@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vekmjfjlo5nu3242"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302110002.wmkvktobi7ssmin5@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--vekmjfjlo5nu3242
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wait, when did we decide that 12 wasn't enough?

I stand corrected. Sorry. I recall some discussion about using 14 and I
changed my git config according to that back then. I see now in
submitting patches that 12 is documented.

I will change my setting back. Sorry for the noise.


--vekmjfjlo5nu3242
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqZMJIACgkQFA3kzBSg
KbaB5hAAksGeCgwN25/AKYu44jL6fjXjGfRM+TdyE36ZTenZCXoicpR2LnDD5WbD
H1LoTw+KijlYYGy9PylW1MZsqS/u2Rq0DR7BNyNTag3SxQAuKz9MJmSnFo0M975V
57T+lD63X2qDA6AJlj4oU28s3kmf2URJXuItsTbTRD9uxQq+3Bsf/yUp5tWpiOxN
OBamLT3O/YLWZ8quV71lKFWL/Ayz+GzoO8yxTyqw6AF8YwpV5o6fI+1ZXkSgbhLE
34xB3cmO71i4HtH/sT2XhS8cGvNGM/U0pJ6adre27fIMZTyczMW84mMC7Pq/5BYs
pNSKGhMTTwGl9uOChFuR3tbT+vb1mzYak8YEInETblUEB12gCtMqBjX2INlP9gle
yL6eTw0CT+JxmtTFOG3CreN1ioI725id2dQeGnRUnYffB0GpSAZv3HiMsovsuwQw
DGJN0UHUJrsD4W3b0Om04sPlGQwM3rZlwFlENxzV55+/ALtYBoBZhG/gxiMJBh6Q
gi4rmpCOa8uJ0Pk5SkhPE2BA7/501J06+TZuxaY24MvekZCYnyVQ4gJF8dDEEoDN
R4u6y66ReShja4a5dL9JnPJp/gDWZIKPebFQ8MYK0ruq//8Y9g/E4CKaYp1H36tD
d4cvhdNsLymSJz4nn6aYTk86sBUkkzobBX6HO8Kq3Uw3Mn/J+zQ=
=YJzZ
-----END PGP SIGNATURE-----

--vekmjfjlo5nu3242--
