Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9672BD01B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496187; cv=none; b=KijKikn2LyQNqMXvhF9EK31yqJG28thv/NqlbQe8U0kJ+pqXkhHlMWUKHGTnAgG3IiWSYGnCgsl80KU00eBvODxGG3PBFixEYu8vQr88cuJW3sKdf4cFpKYoFUz2Stilne1LUDk23f2uMmNhYgibg5+I/IC9YVx5FUnUHLUHWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496187; c=relaxed/simple;
	bh=w0okaFhRI38jPOXfvOe7745j7gtMsdJt2nwM9DZt5TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLfm19a16bxtVFrtgAD4lZ6ByyNRLrQ8qebwhIqEopxZlLQGzdgihXrwgOsqbzcgkgpsExOOjkIjCSrbPvtO+LAXbg4jp6G68BdKClxHQ5kMzg6DbEzIxb1rjKimdzF0opPTHX4HwAHKQ5o4PjIOpKhcgLfLERuzxXXzHb/oDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6UkpHf7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6UkpHf7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436e8758b91so584949f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496185; x=1772100985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=n6UkpHf77W0SruUKqA3W4jRm5DrjGtCSIWH7M3IioQs4An+DD9DsS1VM9INOBhbIAK
         OO78lmnYt3ZcKsZ1An31eCytLquwqM535WxbcvN8qBwuZ8GvqHx/PUwioAzGKU0GwnIF
         mJajMsmYkLisFB20x64vdKgW73oksxZy5Z5Fzy+ef9sIHb4HbXdXbopaMloDkLDRXu5L
         wkn/2sIuIH4ZPQOQGnjFXt7iPZOFZ5ZZqit72Nq6MyMR+0eyOtWS+W8ccMHHONuV3G9G
         sd10WGDqePgOZz9+YnKJmfY2cn6vdnPNqir/S/AgKN1Ea8o8nNK3BPiiVU40k6eu/ljE
         wSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496185; x=1772100985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=p0GJJs7bSfkP/iKTduZEQdhg1sX9ATjfI+x4RMVWrta8wEthZL2YyomL5Y4raeKB2V
         yHOeM2j7vBSaeKUX8zaup7mqKuOBpSvs5eKmK1L3pb861uh+BSEuLCav4yAZgpLuDZfD
         Xh9E0GwYxTJe98yqJS6zMc0k/JMc/zy/LZ4TrxOmsD/G206Al1+omn0uethWQmldfj4b
         0xD65pd0+18mucLwJ7dJvruquARZxHNmjA9kPY/oNmGkWzZFa7hM9ccUtMrsQoYmLabL
         lp7bJdFf0PPuTWBCqnIs4IAV5FOUF86KhVJl4S57PUXIRM/fMxJ5KIhf20SfUgx/ATyJ
         c7fw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5/RRQSNvuE6s7LN1wdsyvDgUgF7V9scGeUoRDiPnF+CcMbSsw0eplBqc0mq2E+9kXqKVkd5bhehbB/FU2MV04A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHafapB1iAw27T/H/GgdVedsqKPQsyA702J4gXhywYg8wLeKb
	0xVudOmBS9bIHZgsJWE4mrIFqiZ/splc5AKLgc9GY/T0U7SzPF8uPiuuoc1jb5lzhp4=
X-Gm-Gg: AZuq6aLkZbtPRYlHXPEjBXNwU0f+49J/bCzuRI6EtAXEYzmj6WKySHWSaQDrkWHxMOF
	A1x6jX/u2YCIT2tlGdL9iK14ikubq0JtrlD+Ks5o6i/AEwBF8I/vFFxNcLr2pSvAY+zSSH8jqRO
	nODQ+EExshlmJj5JRiBKfnR+8RCsYihnzMz8AZZQxVU47t0z2ma7k8h2TRUDiKGedrS/5sINNsA
	ucQfjPUfbgZI2seBY+avxL1pkEsSSt1tj93MkI+QXj79SANMb5BjDb1WePNWVV63dx2+3bv8Ecv
	xuw54W1duRn73eWuIbsi55EUmX+VUmpGcDFf5FB7HDcQX/7Q+u0J6vleOXYMMqXHZm8GX8v4VkG
	l/DMUK9DtkipiWrGqe/2b0sjwSuuK3sZbZeu+1/ePZ10uxojORxg0W9sfO41yr08sO3LD4PmhNt
	LXDyNV27Nu6oe/FrqV2iMtbucBfqqZdAHE
X-Received: by 2002:a05:6000:4305:b0:437:68d5:f167 with SMTP id ffacd0b85a97d-4379db9859fmr33226037f8f.44.1771496184734;
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm14050703f8f.36.2026.02.19.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Message-ID: <17020b22-6e80-49a2-8890-b16917586b49@linaro.org>
Date: Thu, 19 Feb 2026 12:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
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
 <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
> as index of array to map them to error codes.  Array index cannot be
> negative, so make that explicit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 961d7599e422..44265db34ae6 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
>  	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
>  };
>  
> -static int acpm_pmic_to_linux_err(int err)
> +static int acpm_pmic_to_linux_err(unsigned int err)
>  {
>  	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
>  		return acpm_pmic_linux_errmap[err];
> 

