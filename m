From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 1/2] s5p-mfc: Add s5p-mfc-v6-v2 firmware
Date: Tue, 03 Jun 2014 20:33:31 +0100
Message-ID: <1401824011.2412.6.camel@deadeye.wl.decadent.org.uk>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dDsgqiQBLNeiVn/ye0Gh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:52245 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754915AbaFCT3W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 15:29:22 -0400
In-Reply-To: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: dwmw2@infradead.org, linux-samsung-soc@vger.kernel.org, k.debski@samsung.com, t.figa@samsung.com, arunkk.samsung@gmail.com, linux-firmware@kernel.org


--=-dDsgqiQBLNeiVn/ye0Gh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2014-05-21 at 18:11 +0530, Arun Kumar K wrote:
> This is the newer version of mfc-v6 firmware which can
> be used in exynos5250 based boards. This has many bug fixes
> and enhancements. To maintain backward compatibility, the older
> firmware file is still retained and the new file is added with
> the name s5p-mfc-v6-v2.fw. This new firmware handling is supported
> with the below patches in s5p-mfc driver:
> s5p-mfc: Support multiple firmware sub-versions
> s5p-mfc: Add init buffer cmd to MFCV6
>=20
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
> Changes from v1
> - Made into a new file instead of upgrading old v6 firmware
> ---
>  WHENCE                   |    7 ++++---
>  s5p-mfc/s5p-mfc-v6-v2.fw |  Bin 0 -> 343756 bytes
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  create mode 100644 s5p-mfc/s5p-mfc-v6-v2.fw
[...]

Applied, thanks.

Ben.

--=20
Ben Hutchings
If more than one person is responsible for a bug, no one is at fault.

--=-dDsgqiQBLNeiVn/ye0Gh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU44jFue/yOyVhhEJAQruMw/+LEJyHhAxlw+w8KcTwvRkB8r/6MxzzXTz
2h3qtO9cisG87N3HpL+wzCjQ/HIlUxs+ZNdC2Cbl+pSehiJ8M6btTfOc4hRr2OSQ
VDxvJYb7NtpFV9yqJ5a/0NQQ6D7zzzVyYVnuhBBzZ0JTEgu/wC7JquT0gwAY2cUl
/WF9NkK76DE6wc4Q0aa2WAVx8i0EWRXEHwRnI3dR8KglHLL9VMXqY76ar/ryxbsz
fk7RZl5Oma+vca994ZHkj+vOxkj469uDvkiEdHPsfHXae7wncNkxaPXMynrFwtuZ
AQPkOEuU26Ns9+kmDV/e/IYGfJ8cW+dLSOW3OuKhhS0xXxkzkdBv4B8eCCDvLswJ
KyfOjAArfRhruhwd5nWHzVkQR0T91I7S+MZde2/V3QWxZ49chiDlzDvA//nvN3+H
0ew4f38iqjoBXaT4cd2dczuYIG+zIdpVJ3u30I71tkrKcwsuNkVh4NBGJ5dwBu0j
X81hKChEtp7tj7DHkSpHwGZFevynQaWgGwzrad9pcL4rvb0q0LlRvMIajyjCC+Ou
CBmwgeOvkoMx5fjQ8BvqyY0zVvs/7vlMdpvhGAEp91ZJz3hqM81AMj2OCA2ihAwT
cBY69dSmW+ZL9KestFbdGmzrWJ+PI/oKp39C/gt3cmNghYX67X0HjVOUbxZthLdk
vk6S2dVAhTM=
=09uk
-----END PGP SIGNATURE-----

--=-dDsgqiQBLNeiVn/ye0Gh--
