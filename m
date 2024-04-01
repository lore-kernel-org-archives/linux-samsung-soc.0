Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8533FE35
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Apr 2024 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711982417; cv=none; b=qf1SK2DR6Vv0C6N1n2moArVNJsxES9y3C+a3KwexHcv1y3R7VaSNx43uvSzHF+iG6TX6+rCcGkKHngaVQVoUB+pG9NiJXEuYqCGfe+QW6IrwDl0c8wXlcmfpI71BgJlgQ3/0vV1Ojitr8huz3o0YRHlTc/IIwYf5LjL8GfzvG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711982417; c=relaxed/simple;
	bh=pfDTr1FnL8QjYl0bCkz8hEENSrsldQa76NV+NX8LtWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9sNxHIHAfsh/lUtWFMr+9usMaugbVkszu8djgDf7b8F3Y2KRPxWMkuK2FzO1rOLFtI3PQcE5c+jvngL9qIAZDH5pRtJ6ByMQpaXZGf6N81x/z3mFNEaC8kuN+SngaSKil8rxwAoOyrEJqIw4Ery0BzRapeBcIpu/x4dV3sD5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDMerYwW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDMerYwW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c0a249bacso4937945a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2024 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711982413; x=1712587213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTkk8b237SwVRqx7jK/HdyZGSURclEDbY4d0sCLf0LY=;
        b=IDMerYwWjj3DhmIac23p1s/s8evVnbOaKHzUhJb3VpjAFSt5Jg4PEM+UL7fzRpRuNb
         ixaIILrIIyff/hihtLJnFi27cQuJb7CSLGX17BsYTVi7Cq11QvtDUki2ewYcoiCKLdJi
         3vgICXW3jMOv8S8+uCuH0lGf69frCV+3t4wPDkLT4sm2lq0YCROMQsAorluGAUssE028
         oVL0g3CXInoKtdYjPgewUwqWd4WJjLE8OH4agL3xOMw9bsxNj0oPnleFegXUccTcKOBf
         3foZrC4cjDD+ngFfcNxQ9zmpRwrkXPzxTd88hBy8VdiahUvAHBeBFk5Xzw1BCkqAauwN
         hISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711982413; x=1712587213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTkk8b237SwVRqx7jK/HdyZGSURclEDbY4d0sCLf0LY=;
        b=Dh8ACcYDQNGNBFCHnQKcVnqGMlPihApeKLuei5Z2FozvfJ2kt4RdsmEuonppT+Hy0f
         Zr+UsU790xVkKvnM0FTct759PcNdvbUPCjZ8xI1L5dLY2P5uRXNz3rgEDkdQbBFHVCAb
         tDBXj5YLq3ukASqi/mU9P+7lfQo5MyVV/XxgHfNiBN8YLhlQQnxKFSaE0dn7+tOukfMF
         d/N8mhH770AmL2o7TkSHRj+oCScNueoDIBa7L0OCtZ0ZbtTT+ZcB49j6ECNvlirfQT62
         EUg532WQA4yIdbtKWJmQ8gG2rPM/UIy+70+x9dbh9v6gE8nc0Ts8900s1xDcFdylv8ut
         tI3g==
X-Forwarded-Encrypted: i=1; AJvYcCVYiCecI36KGceC5ApRhrdndOTiOmhASljI5ouEx/wVndjC6E71+SKZQi57w9xoPyuBq5D81Nl6y/YnlvW8M/Mc9EKPT4yoFAhAs5FDYleTVxo=
X-Gm-Message-State: AOJu0YxcX01UKiJao97F6xQa0foGhcjZAefXwTcyl5BiswhpsvASdECs
	aNt9EdKm8aNSesjHJwMHo5rCO0NyCBVSSZsmxQ4EqZjYLyBZIY1hyLjHa3mbp2E=
X-Google-Smtp-Source: AGHT+IH2BoIyeU4PorBq0L/BZvUYr6EGkBiz+GGj2LF1/EODFN6c/vnsKy6zBMAbH6S/T9Q6h4tMhw==
X-Received: by 2002:a50:c04e:0:b0:568:bc48:5f27 with SMTP id u14-20020a50c04e000000b00568bc485f27mr6504675edd.39.1711982413145;
        Mon, 01 Apr 2024 07:40:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ds5-20020a0564021cc500b0056c3b41e665sm5572707edb.75.2024.04.01.07.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 07:40:12 -0700 (PDT)
Message-ID: <7e4cd838-c5d8-4b5d-9e7c-b158db8a7484@linaro.org>
Date: Mon, 1 Apr 2024 16:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: s2mps11: Check of_clk_add_hw_provider() result
To: Aleksandr Aprelkov <aaprelkov@usergate.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240401103808.617463-1-aaprelkov@usergate.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240401103808.617463-1-aaprelkov@usergate.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2024 12:38, Aleksandr Aprelkov wrote:
> There is no check if error occurs in clock provider registration.

No, instead explain why there should be a check.

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: b228fad50c00 ("clk: s2mps11: Migrate to clk_hw based OF and registration APIs")
> Signed-off-by: Aleksandr Aprelkov <aaprelkov@usergate.com>
> ---
>  drivers/clk/clk-s2mps11.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 38c456540d1b..f9ce413b6c02 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -187,8 +187,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>  	}
>  
>  	clk_data->num = S2MPS11_CLKS_NUM;
> -	of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
> +	ret = of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
>  			       clk_data);
> +	if (ret < 0)
> +		goto err_reg;

I really do not understand why you are doing this. This SVACE in the
past was creating really fake reports and we were complaining multiple
times that you should fix your tool.

NAK for such explanation.

Best regards,
Krzysztof

