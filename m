From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: register driver early in subsys initcall
 to avoid probe defer
Date: Thu, 19 Nov 2015 14:46:28 +0100
Message-ID: <20151119134627.GA1567@katana>
References: <1446215008-30506-1-git-send-email-m.szyprowski@samsung.com>
 <20151101160203.GB2295@katana>
 <564DCCA9.3050604@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <564DCCA9.3050604@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, "balbi@ti.com" <balbi@ti.com>
List-Id: linux-samsung-soc@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

> This problem is known for ages, there were number of attempts to add

Yes, I heard of it, too.

> support for deferred probe or solve the problem of deferred UDC driver
> probe, but none got accepted so far:

Then they need to be worked on. AFAIK the rejection is based on
implementation details, not because the feature itself is not wanted,
or?

> Till now it worked somehow for boards with older i2c bus drivers, which
> were registered in subsys initcall. Boards, which use newer i2c bus drivers
> cannot be used with usb gadgets compiled-in.

Yes, because the above issue needs to be *fixed*, not workarounded. You
still have the option to carry your patch out-of-tree if fixing the
issue is not an option for you.

We already had problems here when someone tried to revert
subsys_initcall to module_init because of other dependency issues on
another particular board. So, the pain should really go where the fixing
is needed.

I hope you understand,

   Wolfram


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTdKzAAoJEBQN5MwUoCm2d/wP/A4SldgSNorls0otiPkAubpA
tTradDpB7PdU1ajFgmlZTk3nkcj6OWceDLmxass3ZksaDz5en5U2IkGYNjsQVTuv
6BhxSkWnGCxXozEkodVnHEKE/yDLTvaMB4zKc9Vy9rd/UJKNWns4DdxPL1bNRNRh
b8uK41jft0kTL0phZ7oFmpLstW33C8V0MY0XzLssyinDqSlsbKkRJZZiZRNBqafz
wD6HW1laP1H01rhubnR8246rh2MJlSm/Odv+NUBxLlwFWsKRpdu+OhdFHK5jomCo
srZ9XMdqT05kKpLs4iVmHsd/6H5O4ZeOOdoyXCxS5MgvJfQpxgMPcYtH8MZk5oxE
he90tXEI9PiQfLCHbWWT1BbsyDiL2aOcLj5TQcZVxGh3TJXIl5ZmcH+B42tJmpON
/i2Q9zdHdtq7N7EoGpYD3hLi818lj+WHHProf33DTxXp1Tkvkemt+o8d7iRREeD/
35SEC39iMqqQzVyM/ipcR2PVhwGK4UM6y2OpucI88pJmQMpcehz5kqEedEBetqsK
kdvo+aNoGLEmoUrCXeA1kS6xZu6Yxdd5TeLNRkmz+MKguvog98Q8lBCEhcKoYz6M
Umol5SougZzmF5UZ0xaHMocdeOB3/xnJDt0+N+Wny9fDD84TbzsxeSKybNnfpviU
fXzs3QALjbRKXAFCPpeg
=0B5l
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
