Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A663AE1BC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478520; cv=none; b=RuFIK0UPRJXCjRC9RowHlomZzLJ7d2bAZU6Zlqd+nsbnhXaL4u1aeQ/HOHGgaimAccjVOVQuMwNKOX8X4A7cw7+LGsQMDxZ9ckjHByvwrupDbFG6JM1XRxC5UTuQR3JCFZSWJgc1TTCS4otaRQLM2VKLxNLiM7xj/zbIP1AiK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478520; c=relaxed/simple;
	bh=OvdX+GCwle6mk1tHG5XlLthd2sXZff6UiFjpvXObaoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r85oK4UWudy8KeQB/6O/ZQGe05Tp+Jbrz4sylxQYh4kaqmQ1o3ZqkQ0Kuys2firhpcchCTr7ovARcE5kJvLvKl805+MBdPJnW5axgrkQVWSZ4rMjoTgphTy/rVUyZsCU6rE1wvE65qiLLBtutL8HnqVHHf0cz4q8aBovC7j6AQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gWm0vXF0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gWm0vXF0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2457435e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789478516; x=1790083316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrHXsKtDyeL0xXLxdl4DlLJ2gOTBaJOBavzYzacJmVE=;
        b=gWm0vXF0WCiP4f/tVreLocIw8fwNa3XCyNIPXc6PiMETjolz69LN1avVnJij4jcwLO
         fBczVMzyuGS1qnupNpP+JIeHheBA0DOMHQkC0LV3k9r9jODs7Y1024DzZRCFs3ZXWAqn
         J3hBV9ikJsOuImIUWo90CCc5znsonANiNbzsSEjwUuuvrT+NfjOieyCpyfiYj3DFsLaH
         fFaiy15Mg5Nn2ERH3nxFX2KniRlO1LVOZ9a5tqLR/tqK9/LAgXUb7vSnh+jOgjfjKvZs
         rGczk/MXrkoVDmu1d0b4YvCyqUXL5mpeMnuXkrCkIhMxhA3nxu++jrhIKvQzG/K0JLZE
         KhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478516; x=1790083316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrHXsKtDyeL0xXLxdl4DlLJ2gOTBaJOBavzYzacJmVE=;
        b=b6TqSWXec5RHGsOcy8wYkJcGpYdaiLQ0C6aBByhOKZ1YXsU1Ni6vumzUN5+fpxoywr
         J9fbLDl8BKYZlWp08oMx9DsArvHwG6IaKkaHghP+LsjVdlZJef5A0VB/RcaLu3A5ukRn
         Jsx02vsGcOpcrYIcGroV/MSwfO6IlnM5RyGnGazi0C5igWZot++HQ8cfDvEP1AB89jfF
         hE4acBVoRdGWnjdMRoDxvSG+CkZFLlJeHtWzzt6o0p8IxeBRX0/dy9Hi4x/WP9ujxrU4
         5XuW6THtbQTSUQyTqnBz7nGiNSczFQ1ONWi4zWw8yV1wiQpOPNesvQXSD6/BT4pHgEpM
         OtcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT77kv0JcPeZanqfKCJVOPWHmHOONESOYO5lVbhBdNQyxtCO7gd4f/z8yfTR0hIKlJyLuG3nbxqmc1tjX9qIWoMw==@vger.kernel.org
X-Gm-Message-State: AFuF++kDK8e+SuIwijG2aPcRlri3AEHNqEMm0Z57hJypFFWBRY8VL9N1
	SyZ7miPf2hkeS110LlQGAyySleTt+Q1DBgoqmg9+tmIu+frK6ncBKJHxMdIWjtlZFzE=
X-Gm-Gg: AYBFou0HWRRl6GBegzhB3YXC6oe9FsWSa3koUQdavtQ+SUIuHduaALqq8h8/2b/t7om
	ng33vwCgRQrwfHe/ZftI1fc7ge0XKqTfj1o05kSGQSJhzecLQmXt85EAeeGrMmnzpZkPTsSJWmb
	Ql8Ch7dp+sQck7LFSIeWYlqyRNSsGc++50SgSsarb455CP0VUw1bVMa3HVxmMjXRVVPua5eQ20m
	aoxCLW49q1DmNIjJzk4NUqGu8cET772PLKmFOBeozAey3bAHH4VGdor4QkxZWfdQAF2wwGRt6Ew
	6uyP7y5GhRLshzGzuR8AehjigqOz3bVCr+l1gbkAdS5PstqSBdj1gKPLMkER/Fy9jMdVJ1SaVTB
	/jhCmjYMsc4Vbvh9zhLxsbWh8KtZx7ize7ERCEiS7v+djJQ2OqbYIDTwuBlklcZjouFGu5lWiHp
	CrAji4Nty1wVzkKIddHidl81tazzRoz5IxhLaak6qoSbDSIK6xCO6PWvOC83bJS0tgGOKXWDmlY
	cu3hAG6X6apN+Wsh+o6/jUiuTTnrEPX6SGtZtqlBfXEBEOirytMizo1vbO0/g==
X-Received: by 2002:a05:600c:6215:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49e8228e0cemr16074715e9.25.1789478516214;
        Tue, 15 Sep 2026 06:21:56 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e7d28c734sm59282205e9.1.2026.09.15.06.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:55 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:21:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
Message-ID: <aqlElGh5b1vUlMLT@monoceros>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eegyr2w6pguhtfb2"
Content-Disposition: inline
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>


--eegyr2w6pguhtfb2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
MIME-Version: 1.0

Hello,

On Tue, Sep 15, 2026 at 12:05:42AM +0100, Alexey Klimov wrote:
> - added mod_devicetable.h as Tudor suggested, added trailer in the first
>   commit;

Argh, the reasoning in that suggestion was:

	you need to include linux/mod_devicetable.h for kernel_ulong_t.

(https://lore.kernel.org/all/1c41ecc9-d951-45df-b933-1934e1381663@linaro.org/).

This is wrong:

	$ git grep kernel_ulong_t v7.3-rc1:include/linux/mod_devicetable.h || echo void
	void

Please drop the inclusion of <linux/mod_devicetable.h> again, the only
effect of including is that you introduce a bunch of unneeded build
dependencies and I'm fighting to get rid of that file.

Also note that the driver is already using struct platform_device_id
which obviously has a member with type kernel_ulong_t. If you'd need an
additional header for kernel_ulong_t, the driver wouldn't have compiled
already before.

<linux/platform_device.h> already pulls in the definition of struct
platform_device_id and thus also kernel_ulong_t. Please rely on that or
if you want to go full iwyu include <linux/device-id/platformh.>

Best regards
Uwe

--eegyr2w6pguhtfb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpRmcACgkQj4D7WH0S
/k4B7gf+OiEBmAT05HCEpzRR8SWLVbA+lNTuaWLCcpKXZWy8w38d0PCCcnuNRleA
PmV5TMEdio5KPpkThdIat31BuCsUtl2oOer+QqD72//eU8lnvyZjeiZu16nPI8VO
NCOMp9JBn2Zcoa7Sujo4pWCocVvizZi7YLq4LX9hA/O/rLkTWGo2yIYRhg2fpL7q
sNyofNlh4ius6v59bvJzcH94Am5afth7CMTWkmJhDDmc4lNUYBXC7JmGaShSYdRW
0zX/ZSCCLKFvcA+vR65WASE5v8nVyyk2Wwtz/kMlQpDWek55RV/VaRa6EE9oKjby
KT/gXesPxJjn53yJfdllia/wQNjg3Q==
=i6dZ
-----END PGP SIGNATURE-----

--eegyr2w6pguhtfb2--
