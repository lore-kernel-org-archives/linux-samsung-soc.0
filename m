From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 2/4] regulator: max77686: Store opmode non-shifted
Date: Tue, 28 Oct 2014 22:32:30 +0000
Message-ID: <20141028223230.GJ18557@sirena.org.uk>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com>
 <1414411911-5539-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8LS8R9T6g8Jk6Xk2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414411911-5539-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--8LS8R9T6g8Jk6Xk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2014 at 01:11:48PM +0100, Krzysztof Kozlowski wrote:
> Introduce simple helper for calculating the shift for OPMODE field in
> registers. This allows storing the current value of opmode in
> non-shifted form and simplifies a little set_suspend_disable and enable
> functions. Additionally this will allow adding support LDOs to the
> existing set_suspend_disable function.

Applied, thanks.

--8LS8R9T6g8Jk6Xk2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUUBl+AAoJECTWi3JdVIfQ3XoH/i5VJsiCZon0TU8GIK0XTfMO
JLzlcgzfwoR79dQnmJB3VNKzfXt4ViV403+/YHZ3WryB6fOTYaGlFZoT5y1UPNEz
CdV36RFhJDbTIe0UTxfRWTka7oJ0nsRcjmCxErwDIxRFgLb969gJFj38ve/BlH0M
q8K08pYc5rSLRY5lugDK/69il6wCx2/scLVgBgALwbuc6MtLkyv0ABiIns/vxvsU
W6/3xnL+hN6Znm+q6uSma/G09rU7SJ8wOZZApTIg4/XqAXbzxyQwq2hdBFpOayUY
G21kKZbhEbY4gRAu0E5vq0GByFcBN3QdDVnCdUQzfl79vIjrtMruD8vs1H4zSqU=
=CXm4
-----END PGP SIGNATURE-----

--8LS8R9T6g8Jk6Xk2--
