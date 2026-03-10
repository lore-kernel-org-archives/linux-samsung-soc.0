Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17446AEFE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Mar 2026 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144317; cv=none; b=kZ05inuYc4PPZOCevQv0XZozFWJKpE1is/SK3BGFsrxMN8YJwTcxn++tSEAMnBSokA1HSYtbMZ7xDk/Rr/3tYIg/iNczsfXcLOBqxq/tUpdf3MEeAqY2SGPl8Ce0gThxztvhCBroM1TjZ7UsfqfWlWJqu0yLU2HwBD6OdTYxAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144317; c=relaxed/simple;
	bh=UPNSnzaNstwMAqgCUiJAj9O9oSkFKISI+ZEMSLuKWBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+Y9jVqRauVAoXtoRSCZI9fnuV9K6cK7eA1Np95Ieww1bbwSYcRb7M0sOi3vKiJZ6ww3CHvYK11rmAChFsWEUHRtU+FmbAf7GsWSU22+/MPBkqZltlJHq40Uq/e498pDBH2I2Pjhx4X6+AR0kwQ1M9YboIb9/FLGcJLPOYo0q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Np5CKVoD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Np5CKVoD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so20711355e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Mar 2026 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773144312; x=1773749112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=Np5CKVoDHGNLcdrJZzQQyQZ5T2ssDNlotf4xekCjmk/s4L84VyjAqZNezvGUDr8hFe
         +Di87NZlnqlbeQ48YA7nJD9l6jdbTKBiJuptLeVXXapW92yYzQU616Opqp6TciyEgxsh
         HA8+MCcHBVeH1UZlySGviNS1DBU/RVm2EpMzgMoYBAGj5sEfrwq+LK9SynlgiCSJA82Y
         RBKg4YrzOyq7vr1ZZGXUo6mdSgfg/k6O7eWt1F4bdVad2jWpzCGOk7jJ4+jf0vlXVBwB
         +oc3TqmV951iu2c7edMU0DoDm5EVrKOY5gj90q5I4QVKuf6efIl5VUoXvEgK16zeFqsp
         z5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144312; x=1773749112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=DsRqdwZ3HS09lQ37AE+qm8PSoSBPSiOBbsgAorkEq1V7jzD+6tZg8DpeLYD+2/Gomd
         RUrPLuFobyLWj0al0R8PTwaWWdq8oCziIb3HZc8+cFW4J4MkHdnrWr0oponki3S0Zjf4
         oYKHTj/UgM9P3n6S/QYtSfDJh+echrmN8dNZW+0+tZO9SC/ocJDmjdv26+SXx4P1B70s
         nubMyrdxMVd82El4ajke5G9VrUyeLfnm4IRddWn2k8yeC5UhTkZynzsOYnuL0gPLN/Fg
         lefWSC8TvJwjguJyWpbyVRLhL2hceI+0uMXjPmiWRqCTQbSzVuaIba2f/I8CmTfxBzRh
         Gn5A==
X-Forwarded-Encrypted: i=1; AJvYcCUHpZmMMTEP5eWnm3nYo/GFq8Hq4RrRt8QCRckiDSIKNb+hY/rUPguXIIEcmmAm/ybRKr3ijiIib2w8bxCmcEuWeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CjmLK+DniQQY85O/YhcI7+4ppsmGOkhNnoRjcD9IgmLpACMV
	BC+9S+NFNFbLPR8qnpDj94eaKznamxebeCdz5XV4pZ6PJkUQPOtFCRTjk05G9aJZg5s=
X-Gm-Gg: ATEYQzx5BLgohgQUABaDz8UQ2M9rnegxW5ECnsKmnuUuPYDNLRoT+WpMBHpoZPzWqr+
	rP/nGKZR6KmEMSNewvRjDsEQG0gjZZYHwLu4AsCdAgIjGM3QRSkK0wjqBMHChUwRjTSyS7EgmCp
	zEICEpbZmngLUQzq2JR/+9/uexXSLMABd9Zp20l8muB9VQriidGULU5zs2zBQi7t8tz8A7OUDac
	1cCaJJIVIpwEgDCdsh4QYy3As8LSgvwAzjAwRwOXqJWrpq0o0wq/6Ac34jPnI4Q8DWRWGkOiwL2
	LoO+fzjii/6hoVZRadDJ411/abvhHh1UZ9bOxoOYJN8gNP8INtJttWsCtGYYE5SEevq+jT4c/df
	JANSkccs5m/NCY1Gmo+eUilqCDL6FWYdS0/KST40bKBsErSI6AAgDrOXQC0ksTxVfr2ZkBKeQj6
	h/SaWGXmguay9DzxtmaDCh1wrUkFHfazA=
X-Received: by 2002:a05:600c:64ce:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-4853ca451d9mr96446965e9.9.1773144312371;
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485358cd26bsm133729565e9.8.2026.03.10.05.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Message-ID: <fe5c34fe-9ddb-4a7b-ac2e-5854c624abaa@linaro.org>
Date: Tue, 10 Mar 2026 14:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per
 channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/9/26 9:39 AM, Wolfram Sang wrote:
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> 
> Only build-tested. Found because I made the same mistake in my
> to-be-upstreamed driver and then looked for that pattern. Testing would
> be still much appreciated!
> 
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	struct mbox_controller *mbox;
>  	struct mbox_chan *chans;
>  	struct clk *pclk;
> -	int i;
>  
>  	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
>  	if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	mbox->ops = &exynos_mbox_chan_ops;
>  	mbox->of_xlate = exynos_mbox_of_xlate;
>  
> -	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -		chans[i].mbox = mbox;
> -
>  	exynos_mbox->mbox = mbox;
>  
>  	platform_set_drvdata(pdev, exynos_mbox);

