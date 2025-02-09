Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2304774040
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Feb 2025 12:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104706; cv=none; b=ftHvu1e78rfzcM5FAaZvLoOFwzLwUJEyFC6XjCS/ilFYTlufo1Jo/e+g+vWrl5+khIEhBCI6S2KtyU9oawfBfJZTXbCc5Q/HvmdM7H7a5lLBL8stxyTakvLwiigaHeXWI5g7moKyqsS1OI7ihMdLYwC5J+P2CtRS9AaDVSCsWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104706; c=relaxed/simple;
	bh=rDrFqLujkTwbfIZgl9Hh59irUkIi1NUP3JCL2TTllSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uH2JyVfaRoAB8YvRJwLSoW6HvYCWsLOq5qf1+ol2IfJ1gqw0gJQ6KhUjZsmSBYmyEeUNsxozHGGM8purW7Tuc7GEQ5aGNZyBYUay3jfYeL34vPO79ZT2iO9s9bH8iUHdvbUJbPGNR3Q+wGYuD6P7c+aPhEmQ4tHBScUA93H/410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOCAGBa7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOCAGBa7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso201337f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Feb 2025 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739104703; x=1739709503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wea7b3/6KxPyJ8w3sB9xSdUtZBJ/VStaOad+Adh4tTc=;
        b=qOCAGBa7oViXVmmdWvk+df3Af2oFevePdUm3TVHOQi/B6IQaPNDpvgOFneYAjJPHQD
         hP0rC6fRvQx3iiQB2To8qs4XxhCbu6Mr3eyrNb1yBjKqMWmFCnbuSZAxwfNXxvvdfA3Q
         b2D+FreaXo3gmMco9rTsuIf2d+1wo+wx+c9YXj6LCETHtTzEu94cBGz8TgF57HJLV2Ek
         jytI1FpF44kI4JpE+CsxZ6snF5AYnEsyEBSzXcJb9a/RVOv0eliV/Y2853G6YGAewZC9
         0edcREbmDiLozNOV2ubnWuI1QgBfMFrfx1mHhUnfHJUP/2qn6LJnnaXUPFTAMY12DkBi
         JbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104703; x=1739709503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wea7b3/6KxPyJ8w3sB9xSdUtZBJ/VStaOad+Adh4tTc=;
        b=VjtSK0+YznKV0dlcs4iojXW3OYCSQd+KjvYD1Eo+58w29xulK2M0+B799QbCIFmhaa
         wCBm6zsraJNtW41goM9gpElYUc2trV3ydtu07UFctH46tDnQie2P9P855FK2zlCLYRIx
         AAgP5wU4stKFme+Xj1FBpPOLR5yFrLGYz8UzbNSA5cPvxvJhTbyGAnj+iAa+E6NHva+u
         t1QWVTjRKgcP/3o3zpAegIeWonjy0vRTWaURNvLyTeuoTuj/YhS51Glap+jub7i82Rja
         Bbh8bnqd9xqeyAVSxTwxEjPGrFbBTD9g6I6EaAStSg23kMk7tWK2JLSnSuuKYG7YoE+1
         IeKg==
X-Forwarded-Encrypted: i=1; AJvYcCX062azwDM1XGnxaWejDTQPgCZThRkk6xM9aNY+/A09FKikrYV9F23PD0hsfUM8YyqVh8ST3sWsC8Ry/o5zZfDDow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsQtd/v6tgXYx1o0w5l8fM/Te5wGcbREAUnZRorIfgR8CYoHb
	6YxV7BKe8WfBL97DaAWZU7ub7rcTX1oX2dcMs0yGt1w6quSU75RpQzZjgbeWxS4=
X-Gm-Gg: ASbGncsGA0SdqiQAuxOezmzo7lfXs4dTP3kJcSKJyQCzXPe7/Tmg5v2yITQ9RSgRMrN
	bTxL86pLB21Jg4wV7n2+tOJkeeJovw5WKZjxwHedDn/NdVAhVSlCSl7Fz+ok4Xx4HtBxRxaV2S/
	MGGKJLLMR46swOdUqgOmgg0/2mErDTOtU0Jxmcs4ZmIqLgbmPkeRDbfEvj3LGvhcwO2kFNSEfC1
	4vxbDT1LokB15iq8lWFuGlDoZufn/+zQZtkF4SpVgIUGmfMS8Sfz6aCIYJI24mtB/eEntSR3qrv
	bryW2F+VAYpbGtFo3Sb6I+ZCn97z5CUBneI3VNbRW1FrtGIobLiM+0k=
X-Google-Smtp-Source: AGHT+IHAn5dBvK+eaCAM1hEAPTzgaHWbJSRPVCMLhYu3o81y2gOi4Jhi71LuCjv1/0szAK/gcgf8sA==
X-Received: by 2002:a05:6000:1865:b0:38c:5d42:1529 with SMTP id ffacd0b85a97d-38dc9491b8emr6932878f8f.36.1739104703361;
        Sun, 09 Feb 2025 04:38:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm151223495e9.1.2025.02.09.04.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 04:38:22 -0800 (PST)
Message-ID: <15a1cb62-9d02-400a-9760-d741440c1b81@linaro.org>
Date: Sun, 9 Feb 2025 13:38:21 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
 <076daca7-55e0-40d4-8ea5-93254ecd19b8@linaro.org>
 <9142e874-cefb-404b-8932-3e712b2d8bf0@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9142e874-cefb-404b-8932-3e712b2d8bf0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/02/2025 12:14, Krzysztof Kozlowski wrote:
> On 08/01/2025 17:40, Daniel Lezcano wrote:
>> On 04/01/2025 21:54, Igor Belwon wrote:
>>> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
>>> The design for the timer is reused from previous SoCs.
>>>
>>> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
>>> ---
>>
>> Applied patch 1/2
>>
> 
> Hi Daniel,
> 
> Did this really happen? You replied month ago, but linux-next still does
> not have this patch and now we got new warnings on next:

Hi Krzysztof,

thanks for pointing this out. Actually I forgot to push the branch :/




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
