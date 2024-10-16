Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E4175D44
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Oct 2024 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070411; cv=none; b=sqxfTcQCAYMR7EPmHQMGpOPiUZIc/JTNDAb2uMx2RecXr6Hd5BvIpZgiFYShLnZ6u3EfwWaHqJVJ0aKVbup0dwvLPYvq5iQ/MXR2r9bgeYyZpV1yGUnnO7/VC7S7VhIC9iYGopHZEnv56ws7r4Z7qyTJRsFqZFe/Lvp5/Mo5r+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070411; c=relaxed/simple;
	bh=RQPJOVpphuMf8/iy0yH+bD+TyEeZLAeG30XrHghbWeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O04pY5YVeq1MkmGCqybmb6RsCocnm030+dJCMlSVzktam7g5ENscvgLrJpzYEuVPkwdiLQ9E/1ljA0D5rab9pDOwA35A/jjbkH4ZJgZdKiUAO/mu/Lh9tDdbHrAJjaJnEelHa/QhMk5a/yYml/I2pBnJm63SMrEIfR7DhZWYVYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SJ01iVZd; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SJ01iVZd"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c973697b52so4517696a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Oct 2024 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070407; x=1729675207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UHsYaT26EZQNq2je9bzGL3QQeaelJwyg91ir27OX54=;
        b=SJ01iVZd3mQfMYc3hdtTxI7hO++eiKVSU1J4wExeYfCMC9WXuO+yYKoiFQGrIl2YfI
         U217Y5KMzZZV9YzJevKJ0M4+Rp3rQsH+6fXNb5J1uECh7w7GGI/AA+jYtFqcHj9uuwJ4
         26TXrTFBzHi7SIgmbqqawNQbXr0D2oi7Se9LyNVuJCM+5sU/o/ahe0p91s5nSuhXgTpG
         WBocGbV445JQFXlXJhuUikzoUesPczZDvFw9RYg8ME0HZpd8CcLktoFE5kbOOrshyxwZ
         gw1Fx45xFz0pzrl2wmcsQHV+g2Rpx8zMZ9k2SiMij3+OJwjPfxY/WUddKq3r0rbQPt6B
         Qx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070407; x=1729675207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UHsYaT26EZQNq2je9bzGL3QQeaelJwyg91ir27OX54=;
        b=fs2MCPSpR9nCl1r2Vuxj7lfEJ3+Y28bJnZddgAmWzzXQkcLFlY+PEwPZrGIriaQV+f
         Ty1I/r9OKrErHVk5t6kkP9JT6A9v/TforDSZacOaj419z444FFnW+1cGw6fkEJfoo2LZ
         qaiVTVj8fze9B7CtmCdDi45x/0dvCRBd9uMDeDvdUAzZsZOUowHSPsITGn2g63c2oqZ6
         QEJtPCJemIapbcbqqllbbssniQ0VKx4rm0hmRX001syJaX1Z+Krt6lboTi59OMMhLebR
         JFV6YQKde+/egJjI88HT4vnGIQHkLX7px3uH7uv5npLhliZIWVrhruxilKPnxOEoJWmj
         tj6g==
X-Forwarded-Encrypted: i=1; AJvYcCVidE64t2D5+ggwsQePd9PAeDD4DrvWdNOGWt4vED0IG/seZsdmwA3enObwh+9ljlcdHZUoNWh00cqoe10G3BQeUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8usLSRSgUTY8nKFhNwLgvfsaw/s/42dmx6IxtoyipZpWGdGG
	lqXJtADv7UxIjWZS785zHmKw8t1yEQMv7Gy/rDWyAPY68o/JDLP6uNfiaS50+f844HugV9wkQ6J
	i
X-Google-Smtp-Source: AGHT+IGviRkM+4e9aY8A6JarCraMikxFu1+sSntziV1+8stCqZ1J7LpFuOdEBV7uEBE59BGKr881nQ==
X-Received: by 2002:a17:906:7312:b0:a9a:139:5ef3 with SMTP id a640c23a62f3a-a9a01396165mr1165186566b.55.1729070407139;
        Wed, 16 Oct 2024 02:20:07 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29850a36sm160970966b.181.2024.10.16.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:20:06 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:20:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kwanghoon Son <k.son@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Virag <virag.david003@gmail.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH WIP 4/7] drm/exynos: exynos DPTX hw
Message-ID: <3jrf6d7c5qjegnedvr4hzwcsrnsoejxwh2sjhbwmueyd7whwwl@yyk2yc3vhwne>
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
 <CGME20241002053342epcas1p4ea84fa3c156342a087f77dc2a1fc2bc5@epcas1p4.samsung.com>
 <20241002-auto9-v1-4-c4dc3385f415@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5epvjj245ykhaglp"
Content-Disposition: inline
In-Reply-To: <20241002-auto9-v1-4-c4dc3385f415@samsung.com>


--5epvjj245ykhaglp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH WIP 4/7] drm/exynos: exynos DPTX hw
MIME-Version: 1.0

Hello,

On Wed, Oct 02, 2024 at 02:33:24PM +0900, Kwanghoon Son wrote:
> +struct platform_driver dp_driver = {
> +	.probe		= exynos_drm_dp_probe,
> +	.remove_new	= exynos_drm_dp_remove,
> +	.driver		= {
> +		.name	= DEV_NAME,
> +		.owner	= THIS_MODULE,
> +		.of_match_table = exynos_drm_dp_match,
> +	},
> +};

Since commit 0edb555a65d1, .remove_new isn't supposed to be used. Please
use .remove instead. (By just doing s/remove_new/remove/.)

Best regards
Uwe

--5epvjj245ykhaglp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPhUIACgkQj4D7WH0S
/k7QZgf9GtD3lwWKd0PIf4wqqcAsJ4qXGspW4jHcd+0W8tLhLykabMgHzQMSDx93
rvQr5VInvzYVoS5P3OTS35nlII7/VI06XgzsF642Yvx95IRXs6FyWT4Rim1tLeTX
wQ1VPVmWRLDLdJ5z5Mi8zKsiR6qxdF5jMvdZ+10nItKp5u/CeyzHWBQXYPwI9va0
Pb9tybTA+nWF47MU5FRKEB4gio7vspu0sLmMZrfqqYD6vzcYkEFoNmmeEIFcxlz3
QA2uo63rIfk0rxCcT8WaxkJSgCs7t714SfDZHMNTqJSOQr5xzWvMWbK3kLu1ib3p
OHp/BgRZLs7+pDo44/hzeD1uNLqFCQ==
=xF+b
-----END PGP SIGNATURE-----

--5epvjj245ykhaglp--
