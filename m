From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 16:12:59 +0300
Message-ID: <87bn3rprtw.fsf@linux.intel.com>
References: <20160524192424.GA11690@sesse.net> <E1b5Hwn-0005Be-UA@pannekake.samfundet.no> <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com> <20160527114641.GA39472@sesse.net> <5748480D.8000501@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5748480D.8000501-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Steinar H. Gunderson" <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Steinar H. Gunderson" <sesse-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 823552-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> writes:
> On 05/27/2016 01:46 PM, Steinar H. Gunderson wrote:
>> On Fri, May 27, 2016 at 03:23:35PM +0530, Vivek Gautam wrote:
>>> I don't have any concerns with the patch apart from the ones
>>> Krzysztof has already pointed out.
>>> LGTM.
>>=20
>> Should I repost the patch, or will people just make these commit message
>> changes for me? I guess balbi@ is the right person to review and merge,
>> since he maintains the driver.
>
> Although resend is not strictly needed because maintainer might do the
> changes by himself... but he might just miss the comments as well (and
> e.g. use patchwork to apply the patch).
>
> I think it would be useful if you send a v2 with fixes pointed by me and
> accumulated review-tags (mine and Vivek's Reviewed-by).

yes, please do that. Keep in mind, also, that we're still in the middle
of the merge window and nothing will really happen until v4.7-rc1 is
tagged.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXSEfbAAoJEIaOsuA1yqREYKEQAJEpZ0w1ghiIm3B+bHaX5NUz
dWmJK5zXAg5EkTTamALLqX/2lBPtcEkeTD/VQ3LWGsjI7PCawM+LcNyNnMUuTHJj
kN7eqKwnLFn+jjeJyl+2sG8FuuM1oq/i1v3o3am/+m8dhhThXtUILe3XxkaMduIl
qiFkSALxnRWYoQpzYrz+9C74O9bsLKW8uCceLjUlz47waeSqBnL9qwBaEnR4e+l3
HFVyb1NelKng6UgkPXPglBNtaPtc/yr3NEtqxL5+7iUGCROmJ5Nn0l9CXqJYs/9n
m2D+NNd6/5+5wtQIXH3dA7MznKtpmDBm8al6GnM/7Pi1JjgqZRpXrne6F/RXRbe4
caDXfZChA1CQWAZLzSyII+cFOG6GhefmXVmyhrbrlHJIbVojstngqPzZuFVniTw/
lwQeENA4e7MBm6/pbkDptmJEA9ouDrazmZo0MnUrAS7vEpcNdOxBgFpkO5ppNkny
QDRYunDysYHvbfOcIN+vGfomC1IAFytPHcA2Hd7RfvNiNRGDqrKlnUm/NKLYkTxf
50wKAKfF35v64etb31wdLrkUTHHlK0dWoPOgHtVfgtYJHnMXdKUqMa2/FUuK73++
0P6G5Q1SzZ2RUB0V9Yf7J05+ime5DcsdlOsvyOiNMJngWruFFKTXI08QKCxMoidX
6dwlHw8dOhpMyjFdNVIf
=2RJz
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
