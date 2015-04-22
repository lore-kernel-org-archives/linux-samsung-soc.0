From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: Mark adapter devices with pm_runtime_no_callbacks
Date: Wed, 22 Apr 2015 09:55:31 +0200
Message-ID: <20150422075531.GF1511@katana>
References: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <552FAAD2.80407@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:35038 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964935AbbDVHzh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 03:55:37 -0400
Content-Disposition: inline
In-Reply-To: <552FAAD2.80407@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beata Michalska <b.k.m.devel@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, lars@metafoo.de


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2015 at 02:28:02PM +0200, Beata Michalska wrote:
> On 04/16/2015 02:05 PM, Charles Keepax wrote:
> > Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
> > ops from the bus type, which causes the pm operations on the s3c2410
> > adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
> > doesn't get bound to a driver and as such can't have its own pm_runtime
> > callbacks. Previously this was fine as the bus callbacks would have been
> > used, but now this can cause devices which use PM runtime and are
> > attached over I2C to fail to resume.
> >
> > This commit fixes this issue by marking all adapter devices with
> > pm_runtime_no_callbacks, since they can't have any.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>=20
> Thereis at least one more casewhen an I2C device fails to resume due
> to bus callbacks being dropped(like fimc-is-i2c driver for exynos4-is,
> the same scenario),  so I'm glad to see  it's being handled in on place
> -it saves the trouble.

Thanks for the confirmation! If you could also add a formal 'Acked-by'
next time, this would help me because patchwork collects them for me
automatically.


--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVN1PzAAoJEBQN5MwUoCm2tQcP/j1spnD9ywE2Py4x9jHrglfg
ts7dJ/62qGr6/bc68pYKJhGf6aTwkv7W/KC0D3Y6a1zYrL9dpX3SIiPD/6g8X4Ir
7TvB2/5ITA1LtGP/5njokHOauR175yEIkL/CYsHWfmhQuJxcFjf8NRsdNkngJzLY
hwZhvz896p4ScdFmNoIoWCKDaIYSeA56WI8mJwoVK6P7ue5UCDH7q5XB2AS/bIkU
k9sFpFf8AdlIRItKRyplKyPWdDxaGYCvq743uJ82vZiS4/CMxf/4ywmdSQruLkyk
JyXh2++9kveWzf+wWLr917EY9RJytwmg/K2GKDdogKCGhOaRr80nXk8TqMfTPlBl
XZORXqsN9KxRnWAksYYoKDp6L4BP4N5b1PyNKDGAJybaSkl1A+sN0DAt7uQ/uTBo
sB73ZL2q8hdzo0m3LZji0NVKssh0pzMO+bQWDAkVlAbaBZDzvknkglEs2aPF8XyT
UtUranp1if49G3hBgAYXCyI0jQlpEDql2G3uMfuDKFr4znPiAkD58YuEUZUUfu4R
XvgMc/YxrxSg3D874WM8hp0OBt+o/ywAufcmQCLD6CCtFZ9fFe83VaqkQsDjrJpW
MYlrvyx+N9VNXOJPP7Wyg4W1/uB77oft9KOOiQGn6HWkAEyUCnKpUQDvpGDNqA1b
GAzshVM+QvqjnbHvgsyj
=iout
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
