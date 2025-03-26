Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8336199FC1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742973869; cv=none; b=mupF+r+QWDPpd1fknusWVQ7SeGJwvDisv4SPa2Z0GNI1sevFXH7ac5i79FfeA3A2Ae0YJfpm9S82+eNibHNBQqYUqEju1cFcSTF9g+y25eSTDMOrTWcKRYHQISymi63P3VnRlrgaIWzG4StsjRWz4rNuNDrGERviz/KZdKg9JrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742973869; c=relaxed/simple;
	bh=54cd63a34vf2HcC+TZzb0ZdkVJCZUFfzB+6Lus/qZbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jx+6IroMxra58Jj1AXzTvnMB1JOfd4efGqfrXIKTRFgPb7UuvXwyDy4hpw+xkeXjv5hoGD/OzJYE3U6tM+CMvynWM7uCf/T/cCIdyA6RHEuYl+K8MoG3EGr84ixGCHBNBIigN7c3J/+c6vfh/J3Et0F6PXH2naYH/coeLy7EHBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5enOoIX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5enOoIX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso29293135e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742973865; x=1743578665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WjwjGLl32A3KiDt34QpamT6Oni1xHmFU/Px0IbQnoY=;
        b=q5enOoIX3ClvgYIOx7oHhP6r8eJZs2dy7CqCLCuNXBhvXkua6ccO42b/rjvc3SoNFK
         ELMUZk8jVHNpUZjkrXLTqBBstf6KX7COGkV8+pYhexBS/1R2X/WKb56OlRQd5Cd5p9hP
         SNqehENewhuJh3wt8rwqQ2iTMSY3bmb1423enMaObtX/SviCD5szvmq5UgFsfIMv3lkc
         ccFb7UPWLSXpTBz6DQS4i56RYXRQkO6BD8nTIUtZhtpTqZcwJB1ZijU/HSn6mVpP3kLQ
         74+e5pPkdrK/nimqJMdNxggXzXYDMH4ZYpyI78qoqphP/hbwT1X1p2keEvi36bZ/rCbE
         O+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742973865; x=1743578665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WjwjGLl32A3KiDt34QpamT6Oni1xHmFU/Px0IbQnoY=;
        b=j818W9r8NDf6zN7NLC2ZfuBh5wUEl9UQAw6LTDFLJyZFedL+CdHcvmsV678igPWVvY
         2gR6XeaHgecM16fjzVbHBCHgbW/+P7/aZpN5cxVX3Dp0XYN2DVbPuBEWY/QWNtbu9H2V
         DjQ1Ud1SQU6Bl6BNLyj7FQZMDtxApa82yzIiVI0f4ACyXXi9ua1KCVU9BXvRYlDSpUxR
         iVuh82t44foyffI1KkT2Qkx1fiugkx1uDNimxn0VHfguSVK97to5DxDBePnb/xa7ATLI
         RasWeCQkTX8BgeL1h2rRn1CUmoSCopdizU36+yQfFHsBtD2U03u18tmILfyoHXj1cEn8
         HU1w==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZFLgyy4mZ1uF91sEdCBbImAD1p7Okixxh1zKCTmMKddmceXRUSUAnvR6xsl6a6Uz/o5BssaNxk5duS6f2E/S1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tgAtUuCc4gLKP+hwMFTABJ2rUzlXagacq5RGvWxl7LtqkFnK
	c5jr6GyMEyEGjvROElD1puux/TFZ79DK2CyDVJsjnHX4lOF0OdL0QYoWmv1qLKM=
X-Gm-Gg: ASbGncu3Y3YegSvuBkoiiffxTlx2Q4XokriE8csFRSlsLD+SDvUzotxzGA+tD5Ntwdj
	KJOYGspdWxyNbY9xoo4uFQck5OcP2JkfyWc0aFURsNW8I5SZamqJi1bIhPSVaS7Y30SINKFxa9i
	zhiYZbxBE9ZsF15ltygRALiewlWXl8FAAxrCmWpC0FXv22ghiC0aeTANFfkCKccPGy9lLxVowvR
	hi5oJcyT+HlPhnHgpqEmy5sgJC91ZiSooZh8sXD8JsHBpqVM+nR1VBFbyGoCbpHwcM27qfwqBtv
	T1q3US1Tr952amKwjygEyzj/U8moR+WIWOCxXcJ48wFNiyn5CN31xQw=
X-Google-Smtp-Source: AGHT+IFV7fd+M/H9BFgJClv0I0A4YnOUCaUBe1bBC0ZrrT9wb1YxMcUrftw6F8ycCV7VPua/wYkfPw==
X-Received: by 2002:a05:600c:4747:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d509e43e3mr184235705e9.3.1742973864876;
        Wed, 26 Mar 2025 00:24:24 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f33242sm225247215e9.5.2025.03.26.00.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 00:24:23 -0700 (PDT)
Message-ID: <42905f72-100b-432a-becb-7e1f835e518e@linaro.org>
Date: Wed, 26 Mar 2025 07:24:22 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
 <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
 <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
 <974ddabee5a2a43b9d32f382ec4b13afab066f1a.camel@linaro.org>
 <60732c52-7774-48c6-8ec8-44ae82d86267@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <60732c52-7774-48c6-8ec8-44ae82d86267@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/25/25 8:07 AM, Krzysztof Kozlowski wrote:
> On 25/03/2025 09:01, André Draszik wrote:
>> Hi Krzysztof,
>>
>> On Tue, 2025-03-25 at 08:57 +0100, Krzysztof Kozlowski wrote:
>>> On 24/03/2025 16:34, André Draszik wrote:
>>>> +static bool acpm_may_sleep(void)
>>>> +{
>>>> +	return system_state <= SYSTEM_RUNNING ||
>>>> +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
>>>> +}
>>>> +
>>>>  /**
>>>>   * acpm_dequeue_by_polling() - RX dequeue by polling.
>>>>   * @achan:	ACPM channel info.
>>>> @@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>>>>  			return 0;
>>>>  
>>>>  		/* Determined experimentally. */
>>>> -		usleep_range(20, 30);
>>>> +		if (!acpm_may_sleep())
>>>> +			udelay(10);
>>>> +		else
>>>
>>> ... and what do you do if IRQs get disabled exactly in this moment? This
>>> is just racy. You cannot check for a condition and assume it will be
>>> valid for whatever time you want it to be valid.
>>>
>>> What happens if system_state is changed to shutdown in this particular
>>> moment? How did you prevent this from happening?
>>
>> Yes, and that's also what the I2C subsystem is doing, AFAICS, see
>> i2c_in_atomic_xfer_mode() and its use. This is to make a very
>> specific corner case work, similar to I2C which has to deal with
>> the same issue during shutdown.
> 
> But they don't have a choice so they try to do the best to avoid
> sleeping. And it is a subsystem, not a driver, which means their
> patterns are sometimes special. Drivers should not replicate subsystem
> workarounds.
> 
>>
>> Would you have a better suggestion?
> 
> Yes, you have a choice, you can always use udelay. Driver code is
> supposed to be always correct.

Using udelay() is good enough for now. I see that downstream uses a
usleep_range(50, 100) and I'm concerned that we're going to waste lots
of cpu cyles once more and more clients get added.

If there's no concurrency on the ACPM queue mutexes at late system
shutdown, would it work to pass the don't sleep requirement from the
client to ACPM and use udelay only then?

Cheers,
ta
