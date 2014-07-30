From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 30 Jul 2014 11:56:10 +0200
Message-ID: <20140730095609.GC29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:59576 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751683AbaG3J4P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 05:56:15 -0400
Content-Disposition: inline
In-Reply-To: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:02AM +0530, Ajay Kumar wrote:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>=20
> I have tested this after adding few DT changes for exynos5250-snow,
> exynos5420-peach-pit and exynos5800-peach-pi boards.

Hi Ajay,

I very much like where this is going. There are a few rough edges still,
but generally this is pretty much what I had imagined. Thanks for
bearing with me.

Generally I think it would be safer to restructure some of the patches a
little so that they can be more easily applied and keep bisectability.
I'll go into more detail in the individual patches.

Thierry

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2ME5AAoJEN0jrNd/PrOhyiMP+waptJeYSL7hyxaNznh3ELmw
mA3W7JpfVXbJuEQbnlJsjy2MMqcMRX96wMm7gZe9BoEUUuuqVA2UUE9U4tm23whS
/0A5AN9W6hyR/OU2O+OyxAEXrbNaGo6c7p7qstdAyQgKlf4r02qzyVjOobDh1ym/
LzwteZNF1gqqWNgXTa//hnAmVC+z1S3tRnk6KbSqkXH14js1obk6a7eS6D04s3fv
Yi5kIVlBb4EJ//JfpQcDQnYGt+JwNCb7SRFLbzt6hj8Vj8t1VfmyjE4YwXbmpsyc
xZC9np/DX8Heog/LoWU6EbXXAZ9EUKe2wgta+YndH7/0re4WmQzpb/Jj6osWp4No
XvJ7MrHzAVVoKYukYeaZfnOin7Csz+j1hHP8wCMmpjmhcloNX+eZJ+VGX+xvJh8H
Va5/1kAtlcRgUhkYWuyV2Wfy1kEAN9a61orI6V2eT8GamNcJOCHrEPLg2s/qDl8O
+F+jL1p38P/2X9fhdG0Efm23+PpMOdntWydL0cQTBsRdCNubd7zvmenzd6nDIYEC
WZZ7BVfpNKjaVm4I3DYo9qpFOBXp4SDPFPm8uMTEA8CS0vF62GURNvF4qCvXAGMJ
QkcmqU4VR4voa5oW95+Z67dycBk+KYvbUPa1JsMSaTqNz+PZowUxYjggWHTzYPoy
Mtg53VsgxOxvLGmIdoni
=6qfQ
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
