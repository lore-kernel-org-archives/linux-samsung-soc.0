Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A027CB02
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Feb 2026 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250314; cv=none; b=uVTTyi1GobpZm9XoZ0kZVPVY4qCewC4QHCP5WyLH6dLOon7tItkk1OInsdh88jlz6yWKg3e97vP5nXJnn4kdoaqHMU8HSDi13g3He6vIan5ScFgJdn1g/VaIP4RpoP72NHMEUpkxm7EvGr1fvT7cL8v2nmW0VGX0Q9C6imLIJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250314; c=relaxed/simple;
	bh=JudCYDKTAao9yvz1obQeEFLjpJHRjDhkH80IAq3x6uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHbgfJIkAk4Uo3FIllUgKhzSMvyAOjlhWzR4I5tycBG3Tep3PL7UE1ZRHdlNVz/wofkBUuxG6wQ3rHAcAVwmoUkBy5vFS6SwFFyAVoD7isTieyx8EkuZjKXq3+vd4s4np9yQwpFCf5uuVemOD0BJr+ztm67gdYCuZeNZhfglxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orl3VpCZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orl3VpCZ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e6b7b11ebso3553302e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Feb 2026 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771250311; x=1771855111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=Orl3VpCZVgtxL7MpZh1NnWlx2fyQTWtrIKVH6nsudChRBkNWr52BLzHjewFb5rb7pN
         HubWuhvIET2AZmou4zCDw210uFqVfcuH209nQuWT3wKo318bb2jWFzmRN/mplBEPQE8O
         J+AIN3NaN0Tyy9367E9yuKF9bus9tUPDTIZVEsmksjb4WnpF/G1Q6B4JMeRi9E5WLate
         q1jCL8jtPY1PynwXqrTlDx2HbtzBgR4zc9qSYs8WuWL7bF8b7h/EEXOsuyGuaeRpsLOu
         5XTN/OIYNYSllIFsYDHuOGlAVo/ZU5fCcjorQnbtIoLnkcJcu064QyRdIVbpiPGBhK5B
         IknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250311; x=1771855111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=A3g8I6Gfpp4flTDiWH2/i+EoVwGUkdsJ3sPUNPT3IzyzhvtkHA1j9URJYzIj5L+K+5
         vUEimTjMlXFkj8/jTWsOJrbN6JqIkgIisFKLG4YI6FtN5tXH0s34iCIO/779zxYJR1RS
         XZB4SsaN8Ljdwm64KNAzJoecEtPjR+txLH0Bysok7nz9Kjky+CnYFR3mVx3gWXMnd4LI
         r6Wh/00gyG7o/IV+S/YuWd6pK8PToBuUrUW8PXihr1r5QLIBrzXpzIk0RjmZdyzNXU3Q
         v2jFwjmis0ot1TsM5fbz9uLzORsA49ZiRwLSJ/pnjKbfyKxsPoAFNyOFBOD/FynzMX3x
         fauA==
X-Forwarded-Encrypted: i=1; AJvYcCUhZxF/VRsCOaAICg76+ibELfOkR+cOpDBUCi/ot6m+yUsIXHkG4yYUyXEb6VbsDyTA+miFuMYLDV0twxTjIC8wUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QT+3fmWPUzR+7oH5tXTKQsNvFsgBHRfLeW4a+DOYcBcA23Hu
	yNA3bzdKEsVoq/dKj0465fpQUzVSRbIgXD8lQ7sdpE/OSXMzUOU7VheF
X-Gm-Gg: AZuq6aJ3/RZ1d1uxAZdb1D3JQ/OjJQJR5or7PcLHZVpxHaAZG8MZZqxE5vb9z9aEgku
	+v/jO69P3N5j16ocOoRcEu5Wp9/gsHuM+Ph9UvmpuyHG3T8O+7bUWnNwu9BuuRJ6lH+vvEqP+P1
	wuDXfNzMHMvYmsHug/YKfyBjXRWA2zrcu48dfXb+EPDmCus46dYq1ygma3iw8cdgoKzAzPaYSzu
	rMO8QWU76tAYIhlFw0NK+yspXXX4Fu/Nx9C0j9ThSPWE7flk04Zd6qYDlKH7ZMw/Hchc2bstm3j
	NKOFOhN7TpXn/0fskeGmGAodWyP0qrROcRS6lTDrQLsL9HxA5w9EIeneYRz3YF9f9kZbG8azeh2
	tvMptGEAQyVovnAsbmi0ci3cDzqaThiYFWO1FWdZSdZJMtOKhk/6S6TCeq2MGRLBjbXA4Pui0jy
	OH6AxF2cbuffOAKomGo3T1li27253X3Ih3SRO7w65+Fho=
X-Received: by 2002:a05:6512:145a:10b0:59f:6db3:1526 with SMTP id 2adb3069b0e04-59f6db316f1mr1715840e87.10.1771250311130;
        Mon, 16 Feb 2026 05:58:31 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2223sm3224103e87.79.2026.02.16.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 05:58:30 -0800 (PST)
Message-ID: <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Date: Mon, 16 Feb 2026 15:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add a helper function to find the selector for a given value in a linear
> range array. The selector should be such that the value it represents
> should be higher or equal to the given value.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>   include/linux/linear_range.h |  3 +++
>   lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index 2e4f4c3539c0..0f3037f1a94f 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct linear_range *r,
>   int linear_range_get_selector_low_array(const struct linear_range *r,
>   					int ranges, unsigned int val,
>   					unsigned int *selector, bool *found);
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found);
>   
>   #endif
> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
> index a1a7dfa881de..c85583678f6b 100644
> --- a/lib/linear_ranges.c
> +++ b/lib/linear_ranges.c
> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct linear_range *r,
>   }
>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>   
> +/**
> + * linear_range_get_selector_high_array - return linear range selector for value
> + * @r:		pointer to array of linear ranges where selector is looked from
> + * @ranges:	amount of ranges to scan from array
> + * @val:	value for which the selector is searched
> + * @selector:	address where found selector value is updated
> + * @found:	flag to indicate that given value was in the range
> + *
> + * Scan array of ranges for selector for which range value matches given
> + * input value. Value is matching if it is equal or higher than given value
> + * If given value is found to be in a range scanning is stopped and @found is
> + * set true. If a range with values greater than given value is found
> + * but the range min is being greater than given value, then the range's
> + * lowest selector is updated to @selector and scanning is stopped.

Is there a reason why the scanning is stopped here? What ensures that 
the rest of the ranges wouldn't contain a better match?

The logic is now different from the 
linear_range_get_selector_low_array(), and I would like to understand 
why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
Hence, I would like to know rationale behind making them different.

> + *
> + * Return: 0 on success, -EINVAL if range array is invalid or does not contain
> + * range with a value greater or equal to given value
> + */
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < ranges; i++) {
> +		ret = linear_range_get_selector_high(&r[i], val, selector,
> +						     found);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
> +
>   /**
>    * linear_range_get_selector_within - return linear range selector for value
>    * @r:		pointer to linear range where selector is looked from
> 


-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
