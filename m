Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE03E5A2D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281884; cv=none; b=eKdDDqtxE+BTxlu4QyR9T+IliTp2P1Rn5GwMeOsR7+EDfE0C+tZ6nldQQVUqsyH00ICRAFgw6pnOH7j0w9NCw6ZXJWMhTGFRVInsMjdRcXhS8GgBMgKzIQo9lQ2bi4VRvh2HBelyH74gNfERW6/JWN71FbrPuPj00JHEaQqlVjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281884; c=relaxed/simple;
	bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8t835NDfInZlIR0W6TSL0rXJFghc70FUPyjCU/3hWCf5NPZHo7gxzIQCHVZPbixXRtNaH+rBXZT1kKnNNffk4hS/3VBNQikUMo98n+GKc1crM4XW3m/KcpQMANU+cJ1xd+Wc8V5Nw49I9CfAYHQtTJTp/ffhA2lo1MTEmMmAGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cB+tdg1X; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cB+tdg1X"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3786463f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784281879; x=1784886679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
        b=cB+tdg1XWIVi/nE4Jy5/Pgsw+Y00eJVeUkaXLNESntJ3OXzp5cGChc08JvvMrD4X8p
         tt9I48cU7Or0u/P44pZaFM1YemrURJgP8mxwSUw86Hsw5u14cLnQdc2K8Hwn+fZaq/WI
         hUxsMX2l5MCE+C9JVNV2vuctRQ2uXnFn5x6NCeQQj0tkYSIJes/jC5k6IzGnzaCdGepX
         mQRoQ2HJZBJz1Rnc1PDcq9rGtMrLjOExGA936TipDwZpi+E64xHPhWSYx0n6VVdIb1rX
         58jRdJriWpckJXQplf/wIdKVbdCP378zaX1OCKbw9si8tq766IsHXa3FuTF4Jzd6xUC+
         7Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281879; x=1784886679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
        b=XAgBJrhnkLGT8kxiP9q62PZyTziC7D2b3iMq4xIV5SMukw2qffdWVrnGEhGA9GM7ro
         Cj1XyZSthIQSmDYGQijw5EfKO0B9hHZ/2zKgHFh13FimZewdtxuAQeLeFN5B/dvn5DoY
         LejL9hpQmPjEtHuMnuT7EIwmopuFXBYFoACbJP6y1pLTN6joGhE7oLLNp0C/YLwsdk3n
         clYv0th+R2+HSO9cB94vbzYS3c86mkBVbJ6NubPgEEWFlkSbwsDFfH0bn1ce98qSSehh
         Gv9lPRMonfcilQgBpK+RlHJs9u42tQ9+LUzr1TBxYiYjP5QkuLYFPpGC32lnIHBs8JRZ
         sg9w==
X-Forwarded-Encrypted: i=1; AHgh+RpWlujIDC2vHH6GT6DNbUyNYodwOh5cuoH8Xp7YMkfPMTOUiEOYV0nEyHmMIH7SR6OadArL/YrFgwgYzdRms02UtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqJ+286ZfVnxjklFGrvBDerijwCFBHFll9JkRwayw5c+3HjBR
	Ryv4Bwl8XLTp65CWzlqV6PebENY/By428uILz8rKtJO2cgmxfQnBO7OAU11a+cnaaM0=
X-Gm-Gg: AfdE7cnbTGa92noyDrHkY4UcbTHUz2YY+c6FRcKKwtntLRTTFqJapOaPHItlvIfTlVq
	adaewmwG+qq3uxVuQrp3m30c3ocpz7KQhkiS2EnQkLhN9gWwXAJf3Bl6551Dq11sFRqM8e0FF7D
	vTiXu3B9QyqCc51mtNweMRDjE7Bv4F9A9GCm95dgGY3bWeK/iyHe68DLG9/GVSGBj4C+yGllFZs
	VI92N06ub6CKK7sH0mOfd+9LYnfnFMOpGhsKmNSSYo31JE8QDggEYoAbZx8xzvrE9L84kfqkRay
	s1Bpo/QxcsgJWAv1T+rFCzcw+6Adk0gC8Ta/golnboHbB35iDGErftaRZ0kqQAKeUcvYy5ofs8U
	o7IDaTTLiHb81j06kvbQ6WYmzv4dmuWneD7mAEkgFAXzjuUCsfYOT4K4/PQyZ7OwgIlN6k1oSy8
	ohVh5tZIQZQvOgp2786LeIMJTk17PncLt0QKiQXboQGeSxkahibvJz7irVhhIqpJSuKx+tNnW+J
	HMi
X-Received: by 2002:a05:6000:26cf:b0:46e:483c:2262 with SMTP id ffacd0b85a97d-47f622f81e5mr2795318f8f.14.1784281879131;
        Fri, 17 Jul 2026 02:51:19 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e496afsm2730880f8f.1.2026.07.17.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:51:18 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:51:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, 
	Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
Message-ID: <aln6H4A2QTO9w3Rq@monoceros>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkycjd7kwh675awn"
Content-Disposition: inline
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>


--fkycjd7kwh675awn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
MIME-Version: 1.0

Hello,

On Thu, May 28, 2026 at 12:29:38PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>=20
> While touching these arrays unify spacing and usage of commas.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

This patch still applies to next-20260716 and still is complete (i.e. no
new clk drivers appeared that require this type of adaption).

The patch sits in my queue for quite a while now, got positive feedback
only and already missed one merge window.

Do you still have it on your radar?

Best regards
Uwe

--fkycjd7kwh675awn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZ+xIACgkQj4D7WH0S
/k4RPAf/R/neZTJeROp5HDfAB1kjiKdTD1eb+lCt/Alu7OUMfPtNCohc+wbWz0aD
9VLN0xNFPWisKl7W+P4wIm/oBhVUpj9YI8Xe63UGQUTRD+pMXyWR0tum0HiUJ7fe
BFPKV8aY+GJ7FwbxX764+avTkKzUBJQSUzerE4Ea8QtB+YU5zUPe/X/NePEgMYJ2
KMGSQJqpPjooKUbhKdUHbEOHxfomCWX4U1mUW6fuiUEg1zoGXbzsfXy1DibGlBtw
BDhBd/LMd+okrZyBw0mXnzKLVn0bDosN4Qdc+UUh21otT2ahbWBYTjwlUlZkHvZi
sWFrnPSXKS02gFdBmGivvUcQMzygWg==
=PWp0
-----END PGP SIGNATURE-----

--fkycjd7kwh675awn--
