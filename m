Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807A27EFE9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500015; cv=none; b=NaOW/vwoKGK1W4fYeMoWRc3LMVPAOFrV/vhbcFdXTVM/r85qofgrR4+MUqB75XPfJXwX8s/3RzlSDwue9mvCXYbNohMYpHZA5sa14zuHRLTvhcYQpaZN0SEU3zQ0EkNRA66xizECcUw+g28C+Igk6j+qHBoagBhHbylYCTTYgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500015; c=relaxed/simple;
	bh=7SI3pNlFJcJxczuftGfGka9em3SqZ3kPpBvA2zpQvVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdGjabvUsMhSqu40JTomF1xy+oGHHxVF5Y1yhIN7DZ/k6DM6czZXJFuo1CAq6pkw3HQDBLSNWtZSlbH/52UNN8h6fF/Uzxz/Hxus+tFopjY3ICfZs1/BpJ3ePe9/P7cZtXW6aS0p2sFIietaOr3k7H54W88qChpctzkIx7tGn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9FEC5od; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9FEC5od"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43767807cf3so633765f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771500011; x=1772104811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=X9FEC5odHAVc2DVZXvzhdl8eZoJMejMRgziz25Maus0y1jwkgPHthw49/xpKZ/nYhB
         9CyMOuAfPRbGg6CMOmcjArsS78yTqmi1yJUuQoxF9H2m9OOIQwfhOGiNz3incGehX3GZ
         iVbWrRHFurta1FRBwrtRSzTSsN/9OG8qyCO7+fR8M/Xawn7bEGIMPynR9mexym5f2yyQ
         sorU5uTxI8K5PK5MYHN1g8st89cetIRJ40Pig5hkUAzYok3ecPiaipytfmgBzDu4Ej0w
         wfiQVivGe5XcoFd8jcWTbf3A51ZLT5lQLjywJXZoWjGI8wLa1OrQe+M2vA6I/3ZLC1gD
         IxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500011; x=1772104811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=hTDyh4WSoZZvL0FaTcC28SzmtjfBq/TttXnwzA+xenx4mGtiEBRMRfAe1JuY8zra/F
         cW51+Da9qaLE1VUETAQucW9R0bYlOU7j47d/f/SIVjKTXwz9jAw4YBqH8Urj74QtB3YQ
         uJKgmy69QOhf6xKA/MdkVjlhW6cOUaLc1jC2ZCMCJi1zMe+qWD7qe55Sp6fczFJ8vwVa
         cAfcyKI9f0/Pzqa91yUpuDd5VER4JJrMR23/E5YawirVaiOaRydl1MA/x9+blN1Waeal
         9zXRsNSsafPEdeQfccuDQntatu0f3so6hidgUYtNKuOkmcdjmYseKoiT+4WSaNBOKeN4
         pdnw==
X-Forwarded-Encrypted: i=1; AJvYcCXSCirsntfcsRfzog6siduRrT65bG/KsvKQGYCu6L9r/kE2r/+Kgb2PZXPZh7EOtdFLlBCzqRYs5i8+XbWcwlGhyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ma5ZhTXywkwEQq4ezhdkNyi8qdGNkLkyFNvE4D/hu2QsECDm
	oBWy/0jUvb4XE0e5wDpT069kAC2dpsWjmrmyJhXnwvZZwx6/Uc8ZZO3aC8IHUxpvMMg=
X-Gm-Gg: AZuq6aLQ9HCYultYCqS1wHN2JfGZj9GXQe145dJ07GUpM493Q8pxz25UMy0Zwrr/4qD
	ZEdBwsc1f72Z/ZSOxBl8V7WPIE1e+Pj2YP+Hr6VxPuJ0Ah6jvPxT8Ga5pkg18ww9xUQ+dc4tT2P
	6yuLZldp0kE24c0n3i9TY6AyN5WDrrDpQYK7FOkN82yae+9OJ/IFaw2wxtUGGSLlLY4uGd/DqnA
	NS9QpbIzPacjombbnh7zSBPyVuz3YCNDxPKBKmyrf6BMTv4VL3DYV1svzF5jg3Jl/yC27OMe3M2
	yZlD7MqfTiWqBRw6NN42oxC6GO/kLuiXauRv3JZeHKIOcwGlktnebPUxd8ImYWyb1nr1rCtPQb0
	yTtFSAczxCBDdUBLCdnzmRBbtQoaIiq2O+m0xLJKVSEvAKwT8dFvFnOjvU4N/K/q8l+lKnga/cU
	IDNw4IZzUq8SP+9/RiwRGM9IZLnXxQFGOu
X-Received: by 2002:a05:6000:144b:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4379db98611mr32771301f8f.51.1771500011417;
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm51473650f8f.27.2026.02.19.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Message-ID: <47bbcacc-32be-4a64-9ce6-9b441622e84e@linaro.org>
Date: Thu, 19 Feb 2026 13:20:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/3] firmware: exynos-acpm: Count acpm_xfer buffers
 with __counted_by_ptr
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
> validate runtime that we do not pass over the buffer size, thus making
> code safer.
> 
> Usage of __counted_by_ptr() (or actually __counted_by()) requires that
> counter is initialized before counted array.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> __counted_by_ptr() actually maps to __counted_by() for clang v20.
> Alternatively we could introduce new __sized_by(), already supported by
> clang v20, but it is not available for GCC, AFAIU.
> 
> RFT, testing would need clang=20+ with COMNFIG_UBSAN and
> CONFIG_UBSAN_BOUNDS enabled.

Tested cpufreq (ACPM DVFS) with:
CONFIG_CLANG_VERSION=220100
CONFIG_UBSAN=y
CONFIG_UBSAN_BOUNDS=y

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
>  drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 55ec6ad9d87e..a4864973f65d 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -24,12 +24,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  			       unsigned int acpm_chan_id, bool response)
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
> -	xfer->txd = cmd;
>  	xfer->txcnt = cmdlen;
> +	xfer->txd = cmd;
>  
>  	if (response) {
> -		xfer->rxd = cmd;
>  		xfer->rxcnt = cmdlen;
> +		xfer->rxd = cmd;
>  	}
>  }
>  
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 422fbcac7284..8392fcb91f45 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -8,8 +8,8 @@
>  #define __EXYNOS_ACPM_H__
>  
>  struct acpm_xfer {
> -	const u32 *txd;
> -	u32 *rxd;
> +	const u32 *txd __counted_by_ptr(txcnt);
> +	u32 *rxd __counted_by_ptr(rxcnt);
>  	size_t txcnt;
>  	size_t rxcnt;
>  	unsigned int acpm_chan_id;
> 

