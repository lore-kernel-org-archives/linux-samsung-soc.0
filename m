Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861F44384
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Dec 2023 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUq7OYyi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-336c5b5c163so1010130f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Dec 2023 03:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703677234; x=1704282034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8xitBfBDCof+qqntwU7d8AoHD0pzomEDNXPXqbpXvY=;
        b=RUq7OYyid3LOvPxccQcs85ycAWMU3MI7vjsX34EzqJOsKfxAIW2PIiBQIfpeglJB9j
         imEI/zKi6dcys2oYBxoLrVCRre4fE3mUZ4CiZpYpOG8Uq2ggKItt9nBBU8lICBBlCQs1
         3leLbOUjEjbVUoJaKfTpK6glMNlox8CYJJjAUKaoHNGt9fYexY9LREBAaSu1/twKNnr8
         4lYe7nyX3FOyE1JguRC9N8doaMPGVC4Em9tc2spGrRrS59B03wedTxwABQPX+5Oubr3D
         jsZwhL233xHxk2GFmya4vZzGKuaGxXnzS4DZ2n3dt3ChHZESApar6m/DO81i/YbS2yXB
         1x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703677234; x=1704282034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8xitBfBDCof+qqntwU7d8AoHD0pzomEDNXPXqbpXvY=;
        b=Cqfb7T7MpT6NUyKeLBSJBULWMWcQOV9AS/T2kEPScwxJC6o/evyk9puC9SqxfVpwlc
         wx8hf+5g8zMbyLOsmPylcyDpGcnXhVHVyGGy89J6u2Lww1bFoE/LTMzCWqznpc1Ly5RQ
         VHyCEKnUIx7UboFLNIq788K4VlPoMnaz1/T06z5UHVV/qbi+Jf3A8V5mgcfrHuuRvmm0
         ggyDIUQlF2plb4K/3pbCBjk2ci+USEnb4rF6+oFXAdGDfzA+EPgDQDOfIONDH6KGC8oX
         UnsQE1oVHqsWpSrdFhWh3eFX+zCDXej3ZzsI1NofgdpKp/xdVnxQje4C9pXkywZwmzN2
         Nlow==
X-Gm-Message-State: AOJu0YznkzM+xNMFxuGJzvDDPj/CRuEW5i1fg0PVM4sTbtQtGdCcCH/m
	SGrPt/Hm/JZwvUjQQUyrjPfCs5hugfjobA==
X-Google-Smtp-Source: AGHT+IEA7bn2xEOrnHgvTjmO+M25nJu1oZXTYL0Vd9uaDJ3mdO29yjBGrEOxufxgaVsp9OBmYaqlqg==
X-Received: by 2002:a05:6000:1151:b0:336:7758:957e with SMTP id d17-20020a056000115100b003367758957emr4608345wrx.25.1703677234073;
        Wed, 27 Dec 2023 03:40:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d45c7000000b00336c6b77584sm5652687wrs.91.2023.12.27.03.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 03:40:33 -0800 (PST)
Message-ID: <88719b92-1d69-4571-9323-a844ffc90d7e@linaro.org>
Date: Wed, 27 Dec 2023 12:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: Fix typo error and extra space
Content-Language: en-US
To: Varada Pavani <v.pavani@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <20231219115834.65720-1-v.pavani@samsung.com>
 <CGME20231219115858epcas5p469e925738bcb93ee88842fdea0f9d3f0@epcas5p4.samsung.com>
 <20231219115834.65720-2-v.pavani@samsung.com>
 <58ded02d-a5d2-40e2-b575-dc520a7553cf@linaro.org>
 <003e01da381d$ae1b4240$0a51c6c0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <003e01da381d$ae1b4240$0a51c6c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/12/2023 18:05, Varada Pavani wrote:
>> hardware
>> - * registers to acheive a fast co-oridinated rate change for all the 
>> CPU domain
>> + * registers to achieve a fast co-oridinated rate change for all the 
>> + CPU domain
>>   * clocks.
>>   *
>>   * On a rate change request for the CPU clock, the rate change is 
>> propagated @@ -181,7 +181,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
>>  	 * If the old parent clock speed is less than the clock speed of
>>  	 * the alternate parent, then it should be ensured that at no point
>>  	 * the armclk speed is more than the old_prate until the dividers are
>> -	 * set.  Also workaround the issue of the dividers being set to lower
>> +	 * set. Also workaround the issue of the dividers being set to lower
> 
> Why? The double-space is correct.
> 
> Okay, I couldn’t see any double space at the end of the statement apart from this line and below one. So updated to have uniformity.

Wait, there are only two statements here, so where do you expect double
space? There is no "one space at the end of the statement".

Your quoting is still not correct. Which part of above is quote of my
message, which yours?

Best regards,
Krzysztof

