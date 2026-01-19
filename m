Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7330CDA6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819436; cv=none; b=Fa1xkXtXypZKB3cvRdvMpOosNNQZAS7qN8j74ChgzaXJMaXwIkP61EmCKpNq4NcIgcahvTo/mF/k3HOZYmKOC05KHXZw+COCBB2dGOplj1MKU5sI0X8ARfFbaFhwOPE2sIMO48e7e/gfEQxVqVePXJ3XT/5Lyiygs7XYK/a2jkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819436; c=relaxed/simple;
	bh=JDp8XZrS8np8tDMV49tHpzOCjc6Fhjm7F8tLG7gTiYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2k0fCrwkt9sJP2MwsEJphGGr1GG++p6i08ymOQNQYent9PHEf8+LZ5tzD+Is2j1n1cFLLUtGvRskZuKUKnXaxPARkQfjwQyEI4jYsYCNHMv4m6tcsX0XLOO8ELhUIQ3zhd/hGTKoqoRC1OVFs1idhdBARx45jlwiVOSC8XObss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka0+5FwY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka0+5FwY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-655af782859so5785925a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768819433; x=1769424233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=ka0+5FwYzVv8SqdaZzLFiQMPl0p6tqbExYk3AfKBTkIJ9K5aLmOaTkCE6xZi0kLCMy
         QaQULSZ0rulFUexPuUqVcKG3arBQMYjwP64z3KgO74bSd237cez0EYPkrexu6JGOXY1q
         58NRd3c+SAiTaUUMqGqsnyoBb671DXjVyXL7YsiGsP9qNHIyMNgwCI+7NF6mQ+ngePRm
         +eJTuARVUROn+g/P0+2kvoJ+hxZ8KBUOnvQJywPOR+Lfy0oTT72KNnZoalZvComKY2QZ
         4NdoO02yHv+/5gW8ldZEDI7u0R9IgI8RHdHMVp4aIvTav3qg8iIh12DquJZvxbWOyQax
         hUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819433; x=1769424233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=LVhYZsdqTJGVHIEV1H5WkO+1yAT8AP67m/bIu47TQRkyI+Wyp2Akto3+Bn5clCGM8q
         eAM3kSznA+jq3/R9wcj52WJYIR6kW6PM0tcP0nQt9iAfiKm5Bg7jsvv80o5ZHGqnMaxw
         ptnQS6bj5v5qjaW/3f5NkNdvNmUQcH5+a8AUhLTNRjuCo5/gXvng/NBju//ixUkTTDdl
         ruu+iydDaGnA/Tz0rJr8uknz+fOTT601N3+Nujis7k+6ZHCzcnTYl1J9AX1HfXFXgJ+P
         wmEg1HXSPqCohlGUb3AiltXz6QTTLpWKta9bZnErB+z5bs6nsM8cLaAblTklKsPdGc/E
         kkQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2FN30mYi2vNsqwVInk6gxNvdltxp13jUPBKHRcivQSGjHDFiqZs3eLPd4815aut//KnHwFaNqBPAgzkud3Icnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLjLBlu0eOYTzovbvdgjKVVCa+nqn94iZSaTJIcTB0D0yJ8+P
	dR84ABLACovXdlAK9VniGYYZRyxyuhq9NFaFOUmBSYhmD2NO2g6vunTm
X-Gm-Gg: AY/fxX4wZ6axBuJdMH1RCqwNeaJqN65t0hagS6UBu5PB0aZnut3l/mzoJwpivbDl0dc
	Ch+/UaXcFcl0164ifsdeoC2hSoT5bNdBWAGe+tO2ShkiO535Ckj3FGmoWM6pGPPW/t3yGLycOOL
	NfMEhzF8VBbMgE+rzMpd3LOdgm9ua8H09Rj7NFE5D5mGQE46DksKn9mUuu4IGJ2UkundHeVlAQW
	N0gFMbn22gpWLR8PSP5bP45o9Q4tnDPkKIBL70ThqDnhP/bZlWGxiQLEFbfRpTh32oiGPNZQDej
	1cuBdLY7rTaLrCydrl7251WnjzlxWcRBLKSNlq9V9OPIM0K8FGzRdqG0BayuZuqi01TupmLX39b
	9Cnlqf9Ya9M5GjvQXYPk9ZV206iellZQOJuXHwMdXpLvVyBDEIHIRyGu5TQCeEjxirxGv3lV4Bk
	HjZDwBNfGUNAou2ZrT/u/h+WXfqOi8lu5DXmFiuH8aRoyU4bQT6HcHiFMQ4r71ttMs3k7+sNK1s
	bMRKA37CrUe6qPK1vbP0HxgKtqskLg52wfIZLsVQbMuv0US8A==
X-Received: by 2002:a17:907:930b:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b879327f46fmr849354566b.50.1768819432497;
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Received: from ?IPV6:2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896? ([2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879528dcc7sm1076503966b.29.2026.01.19.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Message-ID: <ce6d0f29-6ce0-4c31-af9a-522335b0979b@gmail.com>
Date: Mon, 19 Jan 2026 12:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add exynos8890 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
 <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Language: en-US
From: Ivaylo Ivanov Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.25 10:44, Krzysztof Kozlowski wrote:
> On Fri, Oct 17, 2025 at 07:13:29PM +0300, Ivaylo Ivanov wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-aud
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_AUD PLL clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: pll
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: "528"
>> +            - const: "200"
>> +            - const: "132"
> 
> We do not want the frequency here, for sure not frequency alone. There
> is no such code/syntax. Really.  Please do not invent your own style.
> That's just pclk. You describe here the logical name of this clock
> input.
> 
> ACLK is AXI bus clock, so if this block receives only one ACLK, then
> this is just "axi" or "bus". Recently we were calling this "bus".
> 
> Same in other places. If two AXI bus clocks come in, they could be named
> bus0 and bus1, or in this case - because these are sources for
> generating further ACLKs - bus_528 and bus_200, to indicate that one
> will be for AXI bus clocked 528 MHz and other for 200 MHz.
> 
> Please wait for some other opinions, because same rule I would like to
> apply to ExynosAuto, Artpec and Google GS.
> 
> @Raghav Sharma, @Alim Akhtar, @Sam Protsenko, @Peter Griffin, @André
> Draszik  - share your thoughs please?
> 
> And to clarify in simple terms for others or for the future:
> 1. HCLK would be the AHB bus, so also bus. Both ACLK and HCLK are for
> memory accesses.
> 2. PCLK is APB bus, for registers.
> 3. SCLK is for main operation of the block (called special clock, but no
> clue what is so special about it).
> 

So the consensus is to do something like this..

- const: oscclk
    - const: bus_528
    - const: bus_200
    - const: pclk

.., right?

Mentioned people haven't replied. I'm asking because I think it'd be more
straightforward to go with just aclk_528 pclk_132 sclk_... or axi_528 apb_132.

What do you think?

Best regards,
Ivaylo

>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus1
>> +

...

> Best regards,
> Krzysztof
> 

