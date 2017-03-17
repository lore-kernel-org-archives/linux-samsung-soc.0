From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: dwc3 dwc3_exynos_probe() change goto labels to meaningful names
Date: Fri, 17 Mar 2017 10:42:49 +0200
Message-ID: <87y3w4uwdy.fsf@linux.intel.com>
References: <20170130192504.19046-1-shuahkh@osg.samsung.com> <8da7ab58-9d4c-2e71-df98-40bbceea8858@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8da7ab58-9d4c-2e71-df98-40bbceea8858@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Shuah Khan <shuahkh@osg.samsung.com> writes:

> On 01/30/2017 12:25 PM, Shuah Khan wrote:
>> Change goto labels to meaningful names from a series of errNs.
>>=20
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>=20
>> Rebased to usb-next
>
> Hi Felipe,
>
> Are you planning to get this in or is there something you are
> waiting in for me to do?

already in testing/next

https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=3Dt=
esting/next&id=3De529082c33a0deaccfc8b28ef1436494ed95365f

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljLoYkACgkQzL64meEa
mQbyJBAAwsDrWM8iS8gk9cH8e703EGHDFICD/jyQ1ieivgbLqIyMKg9bCOuKz0DV
xZ6GjkkKgCp1tYw+Z4NrYmCt9wa1tCsnKBe2WL8jgBBpB+8cxuzQodq5LRuREi4g
PLq6zhRffo+DC5GTjKfPb8lNmswQzhBOPaZElOCf0Yk3i5aRyzM+Y31QgYr7bLkZ
NtA2s/uWzkyVp0WabsliNsfSGLbSuBY7JzBWzGCVrx3IMMnliAe0T+iq7TGKNy7b
AvzvlA4/PctiohZN8eF83rHBtuvxatleVV2cFEjPEg6aa6dxmCvPRj1rOK1joydN
H2aQgdtJ07YUDefE1tLuBbm4gunI1UFXpaU8tR0EWD/FrQxjb1nJxK3GXglsqiW+
ktDRZ2sO/J8OM/WBeGBpTOTlm9G5O+qtwjVgaH9twgjuNLiDGP44oKYLF3BUNSl8
YX+BP5Qi3txHSP6r6XkiHskdGMSqhisauhpvVD3o68FghPSpKsKRDt+0a1CoT/kR
XKoc5PCXADlXlmNSp4fxkOQSs8kyP04aKDp822PzQYemBPIPPeowB0isH8Z2tCSi
YI6eVrqN1QsmnpWOwb/NbhoDRNhDDBIrHHmHcFVsPOBUw+gY3csesLxpPonKBHhT
xpmP8G0U8TbjjZIlwd21VcoZEZwE49zOj3jMg+BmQIn1IJfZjEo=
=HWzX
-----END PGP SIGNATURE-----
--=-=-=--
