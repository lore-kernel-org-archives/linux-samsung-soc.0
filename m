Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74F24E4A0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184591; cv=none; b=sa/eXzNNFEVpT3CRBhSNJumhFE3kN5OXr8lzDTnDueJeTiZh7HyOkqld9LsVOh2Z2xDR5m0ipeYsmrged9tSdOZgSS3NxwWodXO28s1se90DXbIkaV/TPn6xFmjjaiXi3UPvWUxEFqxFPMLLyMJJJxZU5GH2bscIu4MwWlT0Lsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184591; c=relaxed/simple;
	bh=Y3p4LBE9WXSBmze6nc8QffxaOmv0qMigh53x+CI5U90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WovbLlqvHMrRfKbqKwG2sDYVemCoc+LHws6GJ264Qgey6wCfGwLw4y96L9ziXAKusNP+eSJLPlANnSjekwhrMHrngkem1XnurxniYyvS1Jb5kXHlwpQwXbw+zg9F4Eny6XkCZYWTId5YriO3OWvl3clRUgGBkSqbKa9D30NmauQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhaz8w7H; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhaz8w7H"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390ec449556so5807235f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741184588; x=1741789388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/EDlj+KCqtnghUmkpWYPx5sg24VjMYJxMv5mgQVSzE=;
        b=qhaz8w7HsRDtH+dkmhm9PBNSqGoI97u9DRw49x6aDnMBZf6b0QAOuIIgOR+Q6XvVTi
         awhGgCajPHYfPhVf1qaOd5OLEU9wGla1S/kjG6hnti/fmUikOA3A6qlw5gjld7LfxfrB
         NJqp6ozipLtNw9XMI7rUp9Irra8QqUMF2tQCoMLorYg9pKhuViRox33GNQabR4FjQv4+
         j48eBQk4mdbXxhQzsruci6D7lZatVuIsDePJwGJQavbDd/UkraEaXo93g55+t409O6Bi
         JltHX8SoKoVLKeEYChK19hjDxa77ZZRM9b+kGS4qLfZcCg37GZCS0C6we8bVVncfK3Fz
         5R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184588; x=1741789388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/EDlj+KCqtnghUmkpWYPx5sg24VjMYJxMv5mgQVSzE=;
        b=ikhh/U8qHYlW/20dh9Z7kiip+NC7MsMCar8gHizZkiZwXc/GL5DZj4pkF+VMlIIX+z
         YR8oRwrJtvmE7Lt/Gcdfb1z7d4Bxtk1rv17q9vzVME0CAPNIeWBNkEe7RNIycj5UK8Pq
         7CbkMsWV61WqFYB6epl6SumJhnELiKx59KNjccB9XqZ2athWAGFZtXgak7GrTFTdXCgw
         oIVqcXOAtvyrtlan/XTbUKI+/RCLlJklTvXl73dDIvPlFl/i+JnfgJUcm//g9soSx55R
         gk1yVWuF2Zpq0kz1CJrgqQmvuevmHfDTEO1o8IEIMUx+oqwfY/ThSsKqi3w7mhHkpMbu
         cDTw==
X-Gm-Message-State: AOJu0YwdSCWUbOiqGd78b4z2h5PP9ss4dxhe7YScMuN+bzuc0jNIEFjd
	Ng7Ts+74zYKXRn0v80PqN6DAfW+g66m03cFOfQS1naklBMkQvINGKWc09z883Dc=
X-Gm-Gg: ASbGncsD8hzFwUcjN8z0f5cx03UgdAhogcAzCy6HlIkYnskWljCSQqYF8+meUeFumHF
	Xp7McM0njYGHxLgjt0bpGE3flHBRh8yp6i6EM1fDgif4n+XCNHaKBnBatdZLOnZNinl9WJemrIz
	IvlIbDN5oSKHLVnLnEXuAIqIBeLoSG0/3F1P2QLT8Uzc+5X0s9aCMJkXHrOYGKyKADWxk2VpShs
	TEDMa1SI0cwSw70+NlAC2oId1TmgY579fc5VPZwybVhyRHcSTpm8TF6F8l2g6rAL8ickvo+Z0Pz
	UQ5ngcqWW1nrzwuchYRATHF4SfHWZBPICSPChCAaqDv7MFp0OAWj7w==
X-Google-Smtp-Source: AGHT+IFhtHEtHPZDbikFBxfqwSObZ6We/RGoyHTAtxKyvh9iiCUNxXuSQTE/D9Gy3GIUTiWcaX07Kg==
X-Received: by 2002:a5d:5886:0:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-3911f724d55mr2796904f8f.10.1741184587814;
        Wed, 05 Mar 2025 06:23:07 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7ddesm21390361f8f.57.2025.03.05.06.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:23:07 -0800 (PST)
Message-ID: <9063abd1-b417-4623-b44d-fcb18f3c71b7@linaro.org>
Date: Wed, 5 Mar 2025 14:23:04 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
 <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 6:45 PM, Krzysztof Kozlowski wrote:
>  drivers/clk/samsung/clk-exynos-audss.c   | 1 +
>  drivers/clk/samsung/clk-exynos-clkout.c  | 1 +

drivers/clk/samsung/clk-exynos2200.c can benefit of the inclusion too.

>  drivers/clk/samsung/clk-exynos3250.c     | 2 +-

drivers/clk/samsung/clk-exynos4.c too

>  drivers/clk/samsung/clk-exynos4412-isp.c | 1 +

drivers/clk/samsung/clk-exynos5-subcmu.c too

>  drivers/clk/samsung/clk-exynos5250.c     | 1 +
>  drivers/clk/samsung/clk-exynos5420.c     | 1 +
>  drivers/clk/samsung/clk-exynos5433.c     | 1 +

drivers/clk/samsung/clk-exynos7870.c too

>  drivers/clk/samsung/clk-exynos7885.c     | 1 +
>  drivers/clk/samsung/clk-exynos850.c      | 1 +
>  drivers/clk/samsung/clk-exynos8895.c     | 1 +
>  drivers/clk/samsung/clk-exynos990.c      | 1 +
>  drivers/clk/samsung/clk-exynosautov9.c   | 1 +
>  drivers/clk/samsung/clk-exynosautov920.c | 1 +
>  drivers/clk/samsung/clk-fsd.c            | 1 +
>  drivers/clk/samsung/clk-gs101.c          | 1 +
>  drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +

drivers/clk/samsung/clk.c and drivers/clk/samsung/clk.h too.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  16 files changed, 16 insertions(+), 1 deletion(-)


