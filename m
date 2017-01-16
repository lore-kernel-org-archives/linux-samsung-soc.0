From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: dwc3 dwc3_exynos_probe() change goto labels to meaningful names
Date: Mon, 16 Jan 2017 12:33:54 +0200
Message-ID: <87ziirmgz1.fsf@linux.intel.com>
References: <20170111164537.2981-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111164537.2981-1-shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Shuah Khan <shuahkh@osg.samsung.com> writes:
> Change goto labels to meaningful names from a series of errNs.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>

doesn't apply to testing/next, please rebase.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlh8oZIACgkQzL64meEa
mQZmQhAApOwmhslhUt00M9sAnDcN1+xxxztyS0zlHQgRKh0y4l8TO/EEiUKtLb1/
6LpREYFjrhwJefBcOyCgTMLCgcFIv55kcMC7B0+MT8rzze3/KrTYtfdpMjTHpDts
vATeYEG1+eA3sGBXp+4nJsbwXSgPV607tKqDYxorjIORnZnY6re60elTD3w926EG
d8bQuhyiX4GJibrFacjivpckqaHsm2emBCHqzYnloxT8Is6GjKopFombtmM5Nhuu
oLidf+y1kxYzoR/ISGngUfxaQb46CInl31EPEnrBhzY9xgKP8GSymf/sk/HnvJnc
GF2jHDvK2W2mnDESL564y35DGjCWoX7Dh7YmN+RK9g5c+yu8SmTLDLBAZl1jCvbr
K5n7FOFZ5PuKWeMkZFgM8TH57xXp/lHCsY8WJFGGvypM0PHfudy9ez0LOabTMaqW
mWE3fF0xM3d92XiexL95QzWWTjX9ushsAheVRAkKP4iC0gThjwHJGUfrwB8yhsRV
Lp288ciycax9uTpR81+V91N1+XoVM3k4h+QoG/Tcv9/XQo8joMLQJ0F/dGO3F3qd
BiOkQXhEQIHWSug1mLisq8w9YrjhCzleoe5s1YTevtLfwHP0K2mwIQn+Gk+Ddi8a
fHTUEYMc12kYwFv4OOuQbJhK3AeHX9Gxdv4VgUsIMUeM3GBxlJA=
=iNGN
-----END PGP SIGNATURE-----
--=-=-=--
