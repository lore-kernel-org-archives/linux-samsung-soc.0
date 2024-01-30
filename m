Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595C4F1F3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706599754; cv=none; b=mQlO6wMtLgs8VK3JT7isFb/8RI5Sh68BojVF46D8D60h1sFpfrMGKYoObwTCBo6orniKo5A9CXVxwaIRHOUvOnBtS0ngvakyRXEfX0+Z9igy/okiQjOftLcRYTbdJOCRRliTNi0uWVdl+lXYbGPc8czRgyhgpaj1XnGCwe14p9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706599754; c=relaxed/simple;
	bh=x+BceOeiNmaGxLiJhb7fO8u4IewJ3WRvBV8kaWb2fbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRRzkuRYzQP4kJS1Ib0JnXijtpS8ZEZQTCYdrh89JTSX3bpZwbfyD6dFbLttSjUSPAwPk+4J1ffjUhztl4tVhC6lbt24y5vRqiTioRbOQWga+PVbtQudDEjzmtxyySW2P4yzLQtNFgAHg+BJa3XromNwBWibuBc7i6JuKJqsWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OaKevLdz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaKevLdz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55c33773c0aso3650162a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706599750; x=1707204550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1hArtQWrp3hZ+e4F70yHoO5Sri2J0Xol4lzMl6YTL7Q=;
        b=OaKevLdzn928BW/gMh4R3kRfkAPgcWGj7S5SoOHrCEJJyymRRt0fWn0dPukrc1AlqU
         0RK3isFQedTNqY7RFkTNLWWLEhk+5/HBYThfSTvinzj3mgpvmLts1zTG4qXgdHcy9Ayx
         3t4h75s8Sys2eB4UViRvzDjb0QwLJQ6Ul7tJAVz6e9UVWN93oz9U5HxqYXHAJW6rNI/A
         X6UWW3enFRFCfKkfqUuUYFxxvoxUptYcJOoeAxPIaLHCuvkTT1uqd03CXJ3JkpTBNcTn
         qq17P86vwYTES70fWOs5eLocpfDTF2bApCHCzgSQtPt5jqyxhpY9YuO1GuNGvkhdbwuk
         iarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706599750; x=1707204550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hArtQWrp3hZ+e4F70yHoO5Sri2J0Xol4lzMl6YTL7Q=;
        b=kW4niu0GE7CwEJ1/STxXWFuUdEl+i2wEG2FUcb8wZLfZSN28IUucmmcFSPzMJkMPXg
         C9GWB3dFW+6+EQt3125gEt6Z3iNFcIMm9khJUIK4d5EvoDqC09Xza7ZENKJKdqnvO2zn
         y31JqJj8ZH214Cx6QAjAnPCHXOaoa2J7cL6myPrsPPsdZm9hwo9iy3KCIeCcuN6nuF14
         3rtJ5bATkc9kmbeRRnC4atwf4LxfNo+3e+PlP/M7tBket0aCGRwcpGQbzX2aq8pe2RQk
         jyis/i4EBOQ18YGFBZyDi1Ug4yLA5h3ANgChuUKt1nC3bcsqHLIBGovxqkbjVX+8EMHP
         Q4IQ==
X-Gm-Message-State: AOJu0YxlHm+He8JwHXemMghh3QSuLfIB97XAGPI74e5X6gDAEIx3E5lq
	fvyRebA0PFXi+EWX98WZHp1m0ULzWimwc6ttzxCW57ZaYmLmrQpsKH29ExbwYAGLLgbJcJki3mr
	4
X-Google-Smtp-Source: AGHT+IHzKX/WdFJy55ipjEVM09ZalvomsYTKcJP0jKZv/465TrQZLrHG7KO+t2E9b8zWzph+zF/Xzw==
X-Received: by 2002:aa7:df03:0:b0:55e:ef54:a4dc with SMTP id c3-20020aa7df03000000b0055eef54a4dcmr3957988edy.23.1706599750602;
        Mon, 29 Jan 2024 23:29:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402004e00b0055f1e3e769bsm1127242edu.35.2024.01.29.23.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:29:10 -0800 (PST)
Message-ID: <8659d79a-e18e-4591-be9e-817d0ab63b75@linaro.org>
Date: Tue, 30 Jan 2024 08:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240129204717.9091-1-semen.protsenko@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240129204717.9091-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2024 21:47, Sam Protsenko wrote:
> Add maintainers entry for the Samsung Exynos850 SoC based platforms.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 939f6dd0ef6a..77c10cc669f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19281,6 +19281,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/sound/samsung*
>  F:	sound/soc/samsung/
>  
> +SAMSUNG EXYNOS850 SoC SUPPORT
> +M:	Sam Protsenko <semen.protsenko@linaro.org>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org

Sorry, but I am still against individual SoC entries in maintainers,
like I replied multiple times and pointed to the updated
get_maintainers.pl script to fetch emails from boards.


Best regards,
Krzysztof

