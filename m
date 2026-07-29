Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBF437475
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328716; cv=none; b=cgCAm6EYlDyydiMi/H1U7nSEnalpbPQvOTVEukDNrAzJOKYGR2gjplJXbMsMFVZPqL+elCTW5Y4W6pmz2xd68AdToJapGrHcMr6jN/CKY3xjncavMC8703Ori1F/5VdXeeokTWydsK+2jYLXMBbPQ4QlGOMhzDf0M+FPudvqYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328716; c=relaxed/simple;
	bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dudd8ejmno2MBJcpAuQdKZLa3kMCQpWb7h/6OlXAhY3B6nyIO/gCwOGJg1peuF437IJX3UZ1QflBZ9wc54MyW1YTjOE//S5yo/BXeZZwL/K24IjXcUrdnZMNAcxasRuLr9TIq8S8lVKp/OVPs9EOiFmXDZ5UEGxf19WhWsqSjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RpvviNdi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RpvviNdi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so9346295e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328708; x=1785933508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=RpvviNdil079QTbzeNJSIzKAzCRM6N4fSPXOEQ+ueuNBZbx/6k6D6BSrNq3bvHHymA
         1QQq3QSUykPEIU2DqC4XfmaEIbpu3gmWggt4v1MtNk4WWQPg8TnwCwWvpkDMvhvBFV54
         Kd1m4Wm6DF2FnFt2v8WPAOY7MkQAxJyObw/ufFl/jYKk2d32zbZ838Wi3Prp3uPin7TT
         XVj6/OanMGmjX8nCshJtmHq5je2/Y4tST7wKcKL2E3KGNdJe+xRPUivcc1XbS3/d2v5+
         K2KgSIut+fJrwT7hp4+cFxr5/Iwck3xPELZxv7P7eMcNLchusIr83EV2K2TB1U1IHhYO
         adDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328708; x=1785933508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=fpQpwoJk7AZMqV1DJwKFvrs+MyR1cV8015hltRdkYEtiHKzDy2viA2XT7+Xmog5eSj
         jzVPx4Vb4FJiBcCtv0WxEQgQJD/nmgENSEw5y08Wx97n0WOMHFtt5Zi0hXAEXgp76oHP
         L88gDL410P162iEQWQc31RHOjvlmrajUWG8HIWOWYgN+DlFj6/dip/SwLqdGAcn5Q8hD
         C/kx1LPpC5GLslvtigiWDwAG/0R7ooMlSkw83Whlj/TkyhAmI8RwzZWq/5mCxoPJ0sFu
         GW0HKp5mFuE+ULlbiJdMQ38o7RQudwtqeAFxYjr1AHpAb2jKmpdBp/DoiuCngmoWwIe7
         HJ2g==
X-Forwarded-Encrypted: i=1; AHgh+RqiVXxrdc4hs1Lo8T/ZV1ELgFK1RcZbCn/zGIo3MI7eGjJw2WAzFPTO1ckCqZrB774yNEzc++suqNRhEi7H6eAUeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3UcEUTeo8O0RkVO4yIh6nDfTvQ/eDTuII1r3dGHn0mi8U0bN
	kFWPNvX/5g9XRUYSsClNEAE8h0i449DxTNV4n9SkkOizD6romEigIi4uTPEUnR27UsE=
X-Gm-Gg: AR+sD13xndrEgbEnXRf30ENrl/g7aUDesCyjLg30lbkBPtFZIjI589ZqYXpUUXWkwk0
	xzBlG6Yci+y5AyvdejSTyQ839CWZNJTBJK63NZ8JuB3ua+2BjrOAD9YPQfTboZsTUU12cmD9BZN
	M7otnzGrx5+bK2Gz/XhxO6Ao6gk6b6V+FQc70PEIJlK9DyH6dzcPmVvRxFbD/jGoe76ml/DmydE
	dORa/sdrCNdmcl+QbLmcunSxe6ubbxdRW9JD9w50CFAMWI3WNNfo7Cc14B3y0XZxMKcayMOWcj+
	kaV/OO+Y70Ybg8z8N7Vjl0+qJ2zo1RI//t454emzPGmOywltLqzKtYM/g4AGOf+KnmJTt16KM1H
	KARlkUpXIdmRBWJcTEbtFa8c7h7WPHiSf9ruO8ZumAnxQbirBlRAf8s3bvCKmgZBMPu0QfnapVg
	s4CdJBYJLrWtM7XCJAiAv2uSq9vHBoNhFXFogTD/orDRdopzF9Z6S1he6k3/C4sqvcoD+53onNw
	HHiE1QQQxgOt0hBBYhpZTy2nVTwh6MBsbkZxlHfpgm39bUpc8qCEtpFHunV9Q==
X-Received: by 2002:a05:600c:470d:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-496c6431be1mr70896085e9.13.1785328708527;
        Wed, 29 Jul 2026 05:38:28 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6b2768fsm7708739f8f.37.2026.07.29.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:38:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:38:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "raghav.s" <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com, 
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hajun.sung@samsung.com, 
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Message-ID: <amnz5qkX_zeeVUjU@monoceros>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-4-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upw3ihnr2pijnj4s"
Content-Disposition: inline
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>


--upw3ihnr2pijnj4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 05:41:01PM +0530, raghav.s wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please don't #include the latter.

Best regards
Uwe

--upw3ihnr2pijnj4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp9D8ACgkQj4D7WH0S
/k5ORAf/Wc6gzSRyNn1+1FIXBR6MXs+6IigrmrQ45vjkC74pGi8j6I1XeucCzzuf
1MhDeQy6g8vGye7y9b0BY3nTOx4Lp71Zbgl5eF30pEKPBi8A29Nz6y0yfEjFfbS7
Vprcpq2dl7yiq22DXzzRBG1/XXhrjG3Pq2NPlpq6GSDvCMlZi32b2L3soaUWPgKX
0sjawB7A1voa8wd+tXglN4kpRiLsPK9aRac8r8SPIhAu47zAJTlbfNWLR43a6vsa
VFQzmBIw5G+rfDjtBYaLwxNtvlan+97F/lQzGWG3JxTwuEg58TM7GmSdnJ92jWRP
Tyk6i+iZlV8rbsX9EW8g/KllvAmioA==
=kgeI
-----END PGP SIGNATURE-----

--upw3ihnr2pijnj4s--
