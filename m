Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C7D4D9FE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706781859; cv=none; b=eEtoyi5Z64/7791geJzNv43uDzvG6S9cb+BkJpGiQAAAy4VspHoYOuzINH1CyiqEixj9WEyh96BKJbqE4ji/8Wi1H9yuSvFeNPw0PN4zQWXEg7RZFi0MdoS/DBJwVhOX3naAA7GO9O939zpREOEHS4LvTTTYPFkTDijim4n4eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706781859; c=relaxed/simple;
	bh=naOyBoZkptYSDUR1lA0nlhfggkIdvlyZI2PXu8T7Q0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3wf5M5f/HkRyXlfv/fdB8hH0M/A1LUAv5KRNYqik8j38rFaulHN9q/2dtRsAuuvXKQc5jFSGtSfiHvD8JGndANkR6Mg9Jc9nBCSEJ2Affqrl9N/h56J3fdXXhpXLy0JGvgur8bIDdJJMFaxwTjV98zm6CEj/6HdG2NcajVDGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PDJM0zqc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDJM0zqc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a35385da5bbso115949166b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 02:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706781854; x=1707386654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=La41roGmstZM72Ind4OE+MAOqK2v8qYEga0FpVHBx3U=;
        b=PDJM0zqcHrIaXGYIUZDee8loS1T6w7cIU1AgGQk7om6uWXnXVBwQgcIcjzscHY0HX7
         0Qnnjv36aleBPxmccXDp46JikmrjrF/vQGok5G6rFVh0+jp7Exxvz3xdMZ9LkpxifK/A
         2Nm3JSobTEEIjtSb1mDL5P5vsO42W3/AzboQkwAwyPWuz/uEwKB+HXGvpNGlBhJ9sYGP
         VFkVpBU7K/ISmhJr9K41joe/r6wcyAFOX1FNyvhw+MyDF2ewfOhmrCKO9LC4vhptLTQf
         oRrCbeSSNrHNbQu+NCMFVP0N/nu9sn18TNJeZB6/mTW+tec077RHjjMyvzQtoaK6/dpF
         283g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706781854; x=1707386654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=La41roGmstZM72Ind4OE+MAOqK2v8qYEga0FpVHBx3U=;
        b=KrF/5HdFQ7XbjfHyX4BF53HVri283Y3uBCb2IZ7AeDJWHCs9g91WBKsEKKcuwK47qV
         bh+9/eRNSt0TS7wldNxF3ggwaFTqRZW24kij5uXruTCCXNCu8e75vgt/etgcdmisBeRp
         cqqEwdWMRGY59gRlMjeOUKNjVFXBf0hcYWLK8yA0dglYkYQ16OSdqLQwC/qUkmDHf5XZ
         CR3kT69x2i5COBQbGhDWLkyyTKFy2QDrg67bruor6uf52O3WcCi+NUcjZE2fpyCqRZOs
         Pl4p8q0HJSKjOYxSGPi7lHWHjsRktx2JkpofGRl2FCAAFo29ZIsWn4KgSs2coXg/7VuU
         DeIQ==
X-Gm-Message-State: AOJu0YwYfD9k2tNAlH1vxLT23ODI3zBwt9oF+GMyYMREMf4EaHb8Q17N
	X4CaYAlK1+BAZ00C9zy6ledOEqQ/LZugFfKaArIV8LhuAUXoDFuukqv5ZGTmuYk=
X-Google-Smtp-Source: AGHT+IHa1PgElzQLBRKnvYHOUEapTQmESbWXvl+VCnOKwTnMAtFYXDSqUzjqXdp95D1lSJq2YO7Org==
X-Received: by 2002:a17:906:c29a:b0:a36:5e44:a2dd with SMTP id r26-20020a170906c29a00b00a365e44a2ddmr2707927ejz.5.1706781854431;
        Thu, 01 Feb 2024 02:04:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW2xMP6gkamzhuO9CqrCPEDUY7kEzQujCBpCqb1QhRz5NchS7XSvKQtFP+ImOI4eN+djG2VvCdRZQ4TassCSC1B4B7qDdJpIQ2ndKOmAvp2ATVHlnf1QcB94q6HGRiXMDiiohV0qgojl1K+k6Ri90eKUjJIhaL7dsq91jpBT6A6jJvlX03GBpuCA4T8tBfrf/k0Mo3a/DThlqc/WCo09a5gn9WYsdhN6sb/DvD1NbAar/wY4RgHr+CnFxAYwXPF0OS/pod0JUN6GIll6SVxMJrboi2ajosr/hea8Y538gQ4udlu2cIrltk8JFXEFx6GNOrDtihcwC3OZ5CqKixz1wToxqVyHB2tV8r4Ky5HaShgqQ7L5fqaG/OGHXQTeQaL1qpCcpBGmsFL0pBN/ynLTxQM+bmBUdSuoBGnFzN9aXIZykB5QN0+24mqSsJf3m1Oyx2ShOwMUqXto+ZQwpad2z4GTHD7ogUaKBg8O++vP85+wjqwOeNLKU9C61tDHZF4ing8UFEMUHgLd1KIz+ss3lnguzBwlPxCT1rfQctn7fN5cfNl84ZY8FgyM8BEXlzayXd6ud6VWcAta6AhfJDUQA5eR+tUjf6Hj0K9rwI9hwI08TDNdyxKSP/eTZf5NRBEdJCeysps0TCR72IURJyvENfDVukq3e4+lZD8syCM1pFy3NaUyKdNog==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id cu2-20020a170906ba8200b00a35757cbd9esm5184171ejd.4.2024.02.01.02.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 02:04:13 -0800 (PST)
Message-ID: <98810c49-38e6-4402-bd47-05d8cbc99ef3@linaro.org>
Date: Thu, 1 Feb 2024 11:04:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: gs101: reorder hsi2c_8
 pinctrl-* properties
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
 <20240130093812.1746512-7-andre.draszik@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130093812.1746512-7-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 10:36, André Draszik wrote:
> The preferred order for these is pinctrl-0 pinctrl-names.
> 
> Update the DTSI accordingly.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> ---
> v2: new patch in this series
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-

This is trivial cleanup, which is fine but then do it for entire Google
GS DTSI and DTS, not only one case.

Best regards,
Krzysztof

