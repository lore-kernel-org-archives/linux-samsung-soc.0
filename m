Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F6274B37
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125220; cv=none; b=mJqrLf2JZtxzdEn0v4LNoNa7ZpiLhle4imtLAgpBGq7SxgECpo0C2rj1p20Z0LeYm1kVFjvRKKHytmPnjBQbq2E8GJe4jEtkaSJ6R7sfbSqHhHNu/ELzPRp+SVxPwhdm4ckNTu344dke9gUAMMeItfgL3SPKK68LFVAZf1IcRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125220; c=relaxed/simple;
	bh=Ty74hZnXxWKvhet9JdbuwC8Mits1/1r65GA1qNGnYFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqGEqCANsLG9KI+bqXqTtYbo4bwIPQ66cCnMXETZDzb+3K52SOYaEXGShFld/nV5xV7vEV97vYeH1yW6RoiYwrnqQaVoprWoe1zzYISUa3n7nqXHe54x6c6aK6j96lnRwHrCzcPZAwFfT96JgKfJplChM165wqNMSw84ndpbzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lma77gxy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lma77gxy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b614ccbe4so5497155e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756125216; x=1756730016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgyYW+EFxanlM3ZuOCikuS7pxBlxHl7zqHrCzYeY36I=;
        b=Lma77gxyhHRtjNh0X14rzN5kkklXGuXPf2ldI/JPx7dv1rtqa0iOF5YFdMq6Ai0ZlI
         UX90Wj5LONh6Jzb5UwQ2W9f/lggNW5gHWe5Oo69ldGV7l76jbZnCa15kId0HeKdTFZ/1
         DQO1n8SAQwTgTQWg1AvhQE2rV7IqGgbc1bes+5tHmZKXSLfGL4FxO6Zgm8udTfaYv8JD
         u4GLeomD0wYMxh2qg5Bwdh//SbTjG/2D+9SUbDsOvKdwj49rwleIS1h7fsvIlEM4M+Dq
         5RtIIqioBdtuYODTY9s/NwcYzom14IQY73p5iMs3TSeBWDLJozVvhcO5CuYbfL5SXSw8
         rUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125216; x=1756730016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgyYW+EFxanlM3ZuOCikuS7pxBlxHl7zqHrCzYeY36I=;
        b=Z60TQmQlRkmafhW0Fox/G45lemDw2X5HbBOgJhFAVlDEiMcfM/8G0kMGw1GdqRZecC
         Cm3qR6xbThoW9wIuG8Dc58P3Xu92NOmxR0FRQjIWBI182++TGNV3L9R9T/vMOlxUesZD
         DYvrDabecoGTMYArC4IfgWRfKgpKV9Bpyyl3NEnGQUBlFHSBgPv85sHIgRL49jLkBtol
         kQk8yOqFLlQCy9bMD6YLCEMbVDyJpLbFtD94xfUSTehfb9J3PpYFR6T3rn793Gf8Rn5D
         qOyINjG/+r0rOlAxQQFXKzcBptdHg5AlSNNnVFV5Yyr89/6taQF1eylu2hw+hYlk5hS1
         dAIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJcqQQ5fW6TX8b9rb3eHgKgHiAdwQGxA0PhedQvICpC8yv5+ylsl/Fb8yYXDER5IALsr+s0F733dnKgMOmfgo1qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyzb4PXDQxNxaGC4zqfJ+wVRHaZHm5I/xFkT3c/AjvfKUndU1k
	A1XOukJC3TJw1N8casorThk81LsPH+AAaJZJDw8Eza2KZIW1c6BY+tr58mygxXGS/QY=
X-Gm-Gg: ASbGnct4yJgXJDzonM8D1mvMujZIfTyzUDvIJd/I5NeWuecXUpsawT5z3cTysqBc/u2
	m/RsoFd8DxnimqmaUxl8YGuhxEtRILopcLdI++C/rudFTGRWfVVEH1U+oXhBHheswQ3wp5kikzd
	ewPFuEQBUX1dqXQRcFL6ei9w8xrqC6kAxZjrKSjYn6jiYJhwYObujCqQl+NRKT+2Mwgb/4pfwxn
	CN4LMHDsY151DXpgYvj+YfWbRb+h7PtQ51EhJU+3QmKBvXXMs+rbaVe5UBiYj1nGviW9a+cJsMk
	/L8W0jp9Ps5BOz7BqOpJVygXuqy9YVXT8a0XFeuSSxqcynIIDKXPafQEnjw6bbyAZVAEVCyuP4J
	T/kv0gqLdmLZMta4fXGZnv/5LRmCRtWEh8NFxpf46HA==
X-Google-Smtp-Source: AGHT+IG8r5+sVjMa01w8IZgVwuhCEDiGDvftj5dR2IQIaEIX1i8970n/oog07azqK0eoXxNWJVJyPQ==
X-Received: by 2002:a05:600c:1c97:b0:45b:629b:dc1e with SMTP id 5b1f17b1804b1-45b639a0d26mr10121405e9.1.1756125215756;
        Mon, 25 Aug 2025 05:33:35 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753adf7sm107972935e9.7.2025.08.25.05.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:33:35 -0700 (PDT)
Message-ID: <b84dbc22-62d6-4a63-9b53-80e939c36e38@linaro.org>
Date: Mon, 25 Aug 2025 13:33:33 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: exynos-acpm: fix PMIC returned errno
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250821-acpm-pmix-fix-errno-v1-1-771a5969324c@linaro.org>
 <c744f5da-ed3a-4559-80b1-9cef5254224b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c744f5da-ed3a-4559-80b1-9cef5254224b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/25 5:50 PM, Krzysztof Kozlowski wrote:
> On 21/08/2025 15:28, Tudor Ambarus wrote:
>> ACPM PMIC command handlers returned a u8 value when they should
>> have returned either zero or negative error codes.
>> Translate the APM PMIC errno to linux errno.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/linux-input/aElHlTApXj-W_o1r@stanley.mountain/
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/firmware/samsung/exynos-acpm-pmic.c | 36 +++++++++++++++++++++++++----
>>  1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> index 39b33a356ebd240506b6390163229a70a2d1fe68..a355ee194027c09431f275f0fd296f45652af536 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> @@ -5,6 +5,7 @@
>>   * Copyright 2024 Linaro Ltd.
>>   */
>>  #include <linux/bitfield.h>
>> +#include <linux/errno.h>
>>  #include <linux/firmware/samsung/exynos-acpm-protocol.h>
>>  #include <linux/ktime.h>
>>  #include <linux/types.h>
>> @@ -33,6 +34,26 @@ enum exynos_acpm_pmic_func {
>>  	ACPM_PMIC_BULK_WRITE,
>>  };
>>  
>> +enum acpm_pmic_error_codes {
> 
> This enum is not used. Size is not needed and you can just use
> designated initializers in the array.
> 
>> +	ACPM_PMIC_SUCCESS = 0,
>> +	ACPM_PMIC_ERR_READ = 1,
>> +	ACPM_PMIC_ERR_WRITE = 2,
>> +	ACPM_PMIC_ERR_MAX
>> +};
>> +
>> +static int acpm_pmic_linux_errmap[ACPM_PMIC_ERR_MAX] = {
> 
> const
> 
>> +	0, /* ACPM_PMIC_SUCCESS */
>> +	-EACCES, /* Read register can't be accessed or issues to access it. */
>> +	-EACCES, /* Write register can't be accessed or issues to access it. */
>> +};
>> +
>> +static inline int acpm_pmic_to_linux_errno(int errno)
> 
> Drop inline
> 
> s/int errno/int err/
> (or code?)
> 
> errno is just too similar to Linux errno.
> 

I agree with all the comments, will address them. Thanks for the review!
ta
