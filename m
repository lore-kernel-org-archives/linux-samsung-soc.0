Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CE58AB5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998855; cv=none; b=PW6IDFqo/evjntVmUZfk+FMsLmgFA1U2nqncZQzupkhNM3/awUmQkck/rdZGL/UEyDLDrJAYVPgce2bNIVl4X5j2qjwrdLjXJ/HClRnC7G37urJEZ/QSaV9bdU6cvZSPa/RMjOHbgKPngI6R0HALbngvzNOr8XmiYetBe6VBWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998855; c=relaxed/simple;
	bh=5ExUUjVENReZ6nNNRQd1DhQ3Hrey0IKfdVg+0g3aZWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiDKxYkgTotyTl1iFVl5GNh9+3I1in3ArNR5vvXwg8gRNGnn/HmjEyTJsSiTk5YsEpoRR1w7yIKTevU53DIsb0KXjyHnM+cpUyZ3YCEGqLi1JeSkV8Yxhqp1mxUgdgFEzBsSsOx3Ee77YP0zjjOmbls5KuAf6YSydE6P+ZL4oO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zuyIwmHD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zuyIwmHD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3392b045e0aso2409515f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 00:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998852; x=1706603652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO+dw9hjpAkz16g21i5T858l1Se4V6/Q5rPys97A/CY=;
        b=zuyIwmHDGzcq0ae5Kwp2KgNkIWzvxtyKB0u5hSsz24q9m3u9ewZ0uU7Xpz0xSi6xbW
         1VD2ODQhWy+KhAYBgiPnEykslwdymn2q3cKTdLzvCk7KuAK5Im80tJND/o/rtts6Xal3
         /mzUrtF+J3/a5JDtJvXcs5+jfqSK69BMcTf1eksUv3Qekxq+/xfgbXjT969Bv+yxfVEF
         inevkKCBl38OnWdU/OYDy51uGICtI69QkkK1X5+3PLk4md55liWcGXtBT3pky/Wlh/V6
         1wX6rGwBxg9BnMyhMs62pARrGnaBZ0R5rObXSQK0ZoqHGcZdHnGFudKT18Sbuph9WoHF
         w3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998852; x=1706603652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO+dw9hjpAkz16g21i5T858l1Se4V6/Q5rPys97A/CY=;
        b=OrY5H9L7RNtpzlw6zHMjsrf2tGyl47f7ezVcu9Sab9wR7DZxXwPgsH9eZYrmlJgyN9
         FcSwJybVV/9QCGDBqjBkQdGdFLIVEhPrSV/SBaSHHX+WhftwwveITLgCQ/9m+l01RUXc
         itJ6SX50N6LFr9bLHy7LsHRdjVX8U7mNL/yW4yR/IH7oD2IfQEPYrLUn5BWucLUheJFm
         T6eA4jfhMhPynjH1eYDgzQgXHk8QIeTBnYE3P8VSZ8hrnk+zVVeldr/PIJIv2TqKuOrU
         rpXLTnb1TVuyuPTZVkJ/4F5Ez20z0kCx9tZe5ZIZTzLvwYLuIHdOfzXCDGhhzH0RrFjk
         SpqA==
X-Gm-Message-State: AOJu0YzZFrdfzkM2zd8BvqaHtmjYyT06maW70/CgU7NlcD5sDBMa2WlU
	YpvsQLc31VukK6w2QEDo/meGpB5RsGfYISvLP5ZKOWyIIx/EqwG+ySALtuh9k4g=
X-Google-Smtp-Source: AGHT+IGrCAgTgEAukfsy/q0uXDaS3k3nOqy0ClJGMMZBpBzpyjTKUPVawtgMdG2hAzicgJ1/u0atxw==
X-Received: by 2002:a05:6000:905:b0:339:359c:11c0 with SMTP id cw5-20020a056000090500b00339359c11c0mr1889379wrb.37.1705998852085;
        Tue, 23 Jan 2024 00:34:12 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d4448000000b0033925e94c89sm8687254wrr.12.2024.01.23.00.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:34:11 -0800 (PST)
Message-ID: <6ddbf20c-6929-4cb0-9fdb-570cc7170b9c@linaro.org>
Date: Tue, 23 Jan 2024 08:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
 <9d12f4f9-1892-48f3-b8d1-8f59788cc91d@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9d12f4f9-1892-48f3-b8d1-8f59788cc91d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/24 07:52, Krzysztof Kozlowski wrote:
> On 19/01/2024 12:11, Tudor Ambarus wrote:
>> USI8 I2C is used to communicate with an eeprom found on the battery
>> connector. Define USI8 in I2C configuration.
>>
>> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
>> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
>> selection of the protocol is intentionally left for the board dts file.
> 
> ... and dropped, because this patch does not build:
> https://krzk.eu/#/builders/29/builds/3869
> and I missed weird dependency mentioned in cover letter:
> 
> "This patch set shall be queued after the cmu_misc clock name fixes from:"
> 
> Sorry, this cannot work like that. DTS for new features cannot build
> depend on driver changes.

No worries. What shall I do so that you re-consider the dropped patches?
I'm not yet familiar with your release management, but I guess that if
you submit your "fixes-clk" branch for integration into v6.8-rc2, and
then merge v6.8-rc2 into your "next/dt64", you'll then be able to queue
the dropped patches as well.

Thanks,
ta
