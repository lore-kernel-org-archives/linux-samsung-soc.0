Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB7612E0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532267; cv=none; b=m0WkyhZu7WMREtSjhwcPAoeXLiJP9hjOn244qH1wjlw4dqlx59KiU7VPBujVCQhTcs2/Is3GXayUlAR53uAlKLDSXyFAURz0gFP31lqbB+nm/sykwztw4XrLkuWPEXXaKlLw6ecb8nfjAn4Dc1hJ8v4aNbydmO0gjNG4Yc60jIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532267; c=relaxed/simple;
	bh=iwVv+KpgojzTz7UiwmCrNbljMrBZg86uVe4TR/XlwHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5EgBykUBxyhqmsY6+XJDGj8W4X5nn3GSgAHaG6RjFXJLTCtG0DQjOIzvTJcXkU/EMWoEvR1HVqOwXgGOiONOhCnINrGdii/ob6ZY8ELrND7nMHAgtGGknDz4nj1xet684YZKmLvN0DdecC4R/51Zs8VcVylmeTm0xw1Ji+BMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9MVX1j8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9MVX1j8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a30f7c9574eso277789566b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 04:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706532263; x=1707137063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyyVmj8UXdIVbn7EeSCjlw1l1jJogntZyHkx/8C4+fY=;
        b=B9MVX1j8iOKwvmWD3QAPD+AbWRZ3sdZW4ptzry3V9r/WnHBzNsfRNxqw395ABkCunE
         5TFBshl/6mPfoEEUV+8ZxwR6pZWsjbbrtjKUXPgGLDsZd2CwqjIkUY+X6huKb003gtqh
         shmfIqh8Lt4IYxhCilQHTPFP05yH7IcpNRu24pDUCX4/r5mvsF6HEGFtwhBHg/rq4aR3
         9nsUpLWIJ+zy7Hb2WOS2DDyPPylYwPBM4Ebt7dv/EWMd4RmCVsoZLuKWKwSisGhwdHxU
         we1HxbdAbv6nd44xuhnIwcsvP3YhB7XfttdsCIdiLBu8Y9WduzuzZARSbVYEGrMEK4GY
         6t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532263; x=1707137063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyyVmj8UXdIVbn7EeSCjlw1l1jJogntZyHkx/8C4+fY=;
        b=N3wnT/4BM1e7Gk1KFVqN0k4A0r4MLNx5VK1JEA55MwD+i4qYFgEZyzyU47UOEbF8uI
         jrAvN2Aj3Kq0nZZGIrGeeio4qBJvi6TumosKuwBH/YP00XW9e/xoHl+CUmYk7TdkEzYS
         BhZd+tl7md4r8cH+A/16S424ht38DRxcyhlnuosmDWzcf+ULsDoqrpwsHhWXELu9uR8/
         uRv6kcuu695EKgjEhYXVhiJf1zazjJgTGc4sDqCgZatS0Z/bIDNfKlGoeJuVnTHJxH1K
         KAsEFC9haedgq0nF/gXuqre551GeUTVHbqhtV++R7FfooQOjN3tSzF/AnJ1tXQ1+AFXF
         /M2A==
X-Gm-Message-State: AOJu0YzOh9bih8NIZ/f4pa2TAWA26tk9+zFoWrvGH0FP33hu/V6GYY7q
	R7kT4ZRrLkoKjtv4kuGBd5cEueDtmFUAr4wTlWew3QZBU6FN6IAWec098ILJJoE=
X-Google-Smtp-Source: AGHT+IHcXpDWBglEaMrnhlcTL7JB54poYiZiJo/8VdZd2NLCsiYyXGakojUQHAMn/oc6HZ1dQxwfnA==
X-Received: by 2002:a17:906:a219:b0:a35:6601:e401 with SMTP id r25-20020a170906a21900b00a356601e401mr3389607ejy.5.1706532263374;
        Mon, 29 Jan 2024 04:44:23 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm3864736ejc.127.2024.01.29.04.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 04:44:22 -0800 (PST)
Message-ID: <93443d6e-50ac-4352-b579-71d5ee12e448@linaro.org>
Date: Mon, 29 Jan 2024 12:44:20 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] clk: samsung: gs-101: drop extra empty line
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240127001926.495769-1-andre.draszik@linaro.org>
 <20240127001926.495769-2-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127001926.495769-2-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:19, André Draszik wrote:
> There is an extra empty line here which doesn't exist in any of the
> other cmu code blocks in this file.
> 
> Drop it to align cmu_top with the rest of the file.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/clk/samsung/clk-gs101.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 4a0520e825b6..27debbafdce4 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -25,7 +25,6 @@
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
>  /* Register Offset definitions for CMU_TOP (0x1e080000) */
> -
>  #define PLL_LOCKTIME_PLL_SHARED0			0x0000
>  #define PLL_LOCKTIME_PLL_SHARED1			0x0004
>  #define PLL_LOCKTIME_PLL_SHARED2			0x0008
