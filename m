From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 12:50:29 -0700
Message-ID: <87r2xcdx4q.fsf@eliezer.anholt.net>
References: <20170718214339.7774-43-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-43-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Ludovic Desroches <ludovic.desroches@microchip.com>, Patrice Chotard <patrice.chotard@st.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-samsung-
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.

For bcm283x:

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllvuAUACgkQtdYpNtH8
nujR1Q//TnAQqX0i19SDkIcn6xngbGWP2ftvGhAA5mQiDWLZwwwZL/XZ3d1rOR/T
46Auz9+uHZJDN4y44JgM/8+l8Fq6WUKC6rmfdRH+tJjMlY/SJeervfAjNiuff3Wq
BYGEMp6hrlqqI5Wxct7qN3lASzXaU5JOT5JDj3XsrB5rM8Kankaedar6/J8Ps6nw
Ukr1usdibBHpLxp6t6+89NanQVwjhLI1VmVamYQ6V6zqW2Mi9mhbvlq+u0kJzDap
ec0W8hLwL7Ky+MgSOL5r7c1BfGDSi6HNY3/dIBqzd8aZNycmNaMxOvrXLzC5KcAh
APCiXB1H3lgUy2hqyfN/C6amnYxyZD5mcGrWmrp28L19CF+ur9VNGtVfmDgrqiBQ
MUNXtv4cEAShmgI9ecAVEXusjpO4JSWTkCdudALRpGxXspaGujeQ110WZL0FQZ+z
DKHx7CrfrA+ljHW83Mlz9powzQv7/mPbvHwWQPhXTwowRn1n4CuUtJtOrLV1V9yH
86HeJSr4yffRHaCSjb7AeDzzG1yMCCvaCDff5PePhO1tiWYTSD5mz6VF1Izaa2/J
dIoLFJbazfHUz9X4hwlVBkEzs551C92eDEFw5TFK1bv39gcTsdCGsWx4KCt8Qhp8
AdQJ9Qw25XnUR7iGs26hzwuW7vTl4b1KpKd/rvlubwpasFxREhw=
=etz9
-----END PGP SIGNATURE-----
--=-=-=--
