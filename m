Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900045;
	b=DRjmH8CALMzrO7yGJ0YAaomvmM8PEvJS56bS7QFKL2Uk7TjJ9cNmbRU9cKj+r1+PhXJJ
	 hHZmvjL2pqQJhqWXHkYcsdBY3sdRYlcOfKPf+71yyqnIAB8Lv7IxChVtWmnpUIkvLVarO
	 tBb4aP40Z6DfkxkCD2uScDevShKEHTyhu+FRuvZ/gkDU/PjQjFlG9L3sesccv6Bsjn907
	 Seulw2J+ZN4Cfiwv8+X9qp95ss1Ysi78qMxNcIbinLwVbD8Z0jC5ahRvuVZwkFipicIke
	 Q/TwLixoJgZpOZYLCxdOx+WXqdv1ri52np3P2QsDudPViwG/4+CV3vRtmOBTzjvIODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900045;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Q9qJYBBmJvYXKz1jTBDOlyf8279fQWwPXbEhMcq5ZRE=;
	b=hdoOZjIhZ44zjIO1V7DxKvLjvAKxPL2KPbW8rW4z1u5dlF0h8Vf4bcOKDpbp8MJdmlzZ
	 AYwkSbjRGeQfLgX/sPQpSky7tWHcFTjf6jTTyUYqtUeLS5rU8jUgYCuavt8rav7g73Qd8
	 KwlgoG7FpE1LCjJhHpHvgwwyQSzlJg+GkFZ4fOEAW904fRE8pAqmZmqLqgo8T+NfwK1Po
	 dkIzZBWsrH0mg0+eHiNmBWTHb7hCUXDobZPACNBFSPzX1wCMPnQ8/HFexfL8+/rWJmbUX
	 soQjOgnJtQ1tMG++Wn09agPfF/mivO0hO/SQluZSE0KZF5gSc2NR42rHiYIfk/nxtAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hklgjc9y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BE8606A329;
	Thu,  5 Nov 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hklgjc9y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CBE1F00A17;
	Thu,  5 Nov 2026 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793900044;
	bh=Q9qJYBBmJvYXKz1jTBDOlyf8279fQWwPXbEhMcq5ZRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hklgjc9yKbVHbXwhxNheNrMRromFbFE8o+kWzaCciYdydwmAs+EjfASDtg+BdnJ+R
	 KwkY7JbslWuxhW9ef81lK9SFInG+sTlYm2zVVCOzX8sqqj4gPRU88iXbQrkG2Tfdzz
	 QUDgEkQ/hW2ilbrSYeC6CqUEuxUf6c/InGeYVFlKFh2ZG3/+rSU0QpIVz0m78EmriA
	 oQt9laJjAKvBTv1sEdbgHbl/bWF6TFeINi9trXJL6h59kjOe2E2UkBL8tLiYCR2c0b
	 tv4/6beMUBzHswEC7LYJiFlJ8WiZmO84jzvdRMEYng52bhQhA2pMRHnJm2OpaWH4Pb
	 feLtdCSfWnVGg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A94E827B4539; Thu, 05 Nov 2026 17:33:58 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:33:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <9d8d687e-ddd9-43e5-a86c-21b3f69b192a@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzdxKJMb0nUm/3bH"
Content-Disposition: inline
In-Reply-To: <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
X-Cookie: Whoever dies with the most toys wins.


--CzdxKJMb0nUm/3bH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 06:24:48PM +0100, Arnd Bergmann wrote:

>  - wm0010, wm1250-ev1, wm5100, wm8996 and wm9081 have no other
>    upstream users besides this board and no DT support, so arguably
>    these are probably obsolete and could also be removed.

> I assume Charles can comment on how important the testing still
> is for the codec above, or if there is other hardware that could
> be used for testing the arizona and wm8994 drivers in case the
> other ones are in fact as obsolete as they appear.

The Arizona platform did pretty well, though there are other devices
based on it that did better and wm5100 in particular probably isn't
super urgent.  The wm1250-ev1 allows simulating baseband audio on
Cragganmore which is helpful.

--CzdxKJMb0nUm/3bH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy+BgAKCRAv73Ows9A4
iUmxAQDIR0F2e4J3wYF4A8ktRa7PAERASmtSMXoVMPxaeHCC6gD9GloeLlhBCzwT
FYpZGR8CNgaOct4A7Q8OjR5ikiEifww=
=Q+b/
-----END PGP SIGNATURE-----

--CzdxKJMb0nUm/3bH--
