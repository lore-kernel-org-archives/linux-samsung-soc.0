Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DC218591
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359661; cv=none; b=td0voYjBGdLOZdZsENQsaRKhQhVEIfFSyWvogkeii3yMP96N5R2wV9F7W09h8Zws5DTPPWDXz/w/S1zxx14h0DDxKVU2F8mkFLGcvpaGV9akg2pCLzYhmSfCyA/ThHxaBP4kH3Sjl+8AKrhvRD/P6lZRLRjeDNtWNgEg6MtKfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359661; c=relaxed/simple;
	bh=qHtTx50HpEAPQhi+oOAilwuHPWB/0cppXyBnHt6uC6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2HdRiaXzzFIQ2FxUID51Qg05XZoQ7cSZnssVeZy25iw8TVnffbvJ4hUmWHmaPuD4WqbLMIa3/0tD7HHori0Cw44rGSMFkZx9X05ftzSOIZa4PMltC3RjYZ9gyfwJZSZe22FG9LLxT23qJl6VdKMQeyVa5kvh2rmzZyFkHHlgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNKP2ifI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNKP2ifI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43935d1321aso2097575e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 07:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359657; x=1741964457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CG/0+ifxr75o2y5vXP38zdPvnGa50K7D2JsI3Q0oVMA=;
        b=kNKP2ifIZTrPJtohysdbB8WyvMu3Ulk8KmsoGqBrv99iWGcw11xPsUCUwobXohS16D
         ksBTTr0+00+IVEfsFJ1syR2UHjkCH2GEyOKmyQg1jrMC7LrR5oH+uogsB45x0663czCG
         r8qFl+6JsKgU226/Gc97a7/6TAucNPJZFTZhE9hHIr/t0/u9XtddVIsNRPWToaGMYJCo
         h6Ht3hnm/GtdJVivO1CWm0T89ImT2geftJtf3P5LJc08wKqFupx7zBFp0v9MvWUkspm4
         fjaCHFZhelAz7dnmbZc4hzsvy6rJdr4v+PJjlOjN+4bb/amaLHs4ovcD1BB5SCAnEr2p
         rlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359657; x=1741964457;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG/0+ifxr75o2y5vXP38zdPvnGa50K7D2JsI3Q0oVMA=;
        b=SJDLMBnspxcc3JuKAUSI2Zt4fNA1BlBMF1CFuzAfAxXQj3UuEvJJ410TXxOKaYXjBq
         pKWend/u63ezTbZM0lI2T8IWA0k/h9FDGQCSaFI+ca1es42Cg1WXkRKdfCnu2+j2muQS
         NPSmwejC4tJ18TAqKtO9i04v0IaDbYh2Wuuo2C65tS7dAB/UXpBo8ebensAKjpG04rLc
         PJ5/vUjO/19i+k66cMt5zhBh0mVP84mo9pENTArccn9y0Yi69d0pOWNcTbywH2CGka4z
         69UgMjWXJ5/wT5YKQ8KY4WRASz4zrDak99EW8AJkP25dv0hk52f+BwyFzdam+v2sjLqK
         /N5w==
X-Gm-Message-State: AOJu0YxfjbE20bXzHpj2i5rayTcsrUf/44hkLGgxqOdPv3uTLpMaIi2Z
	6aAi0K/GtHgs7nkYISba46OgBK9W1PFvcQVBKSiyGPqpET6QRYR/jF4ClbWFCKI=
X-Gm-Gg: ASbGnctOdBk+0Z663rrN7A+iCrcfxLNTg8tWuFL9HQWvlZi9+27VESCLsLo2ns2nwz1
	c67PSRojnKccL76N56YQ9kpy9Mz5EHB2buCHg5x3h2py16aE9hhoITJReAsnrlet1gJj7+7Im9u
	AG78uQCYdPNO76JGSSmE4iSIaQ5t0kAsEAQX9/xXdRWkvv5gNbgUHBtuRbU0QrP3O1+tcfQ9qh4
	3HxM7asG826sJt7dSQh0LrNPhYgqU4psWYIRThHuLJx3oyCxIivH1xtMNXfi1SFd1kxi3dZ9mB4
	mMcxf4TZof+rMknDGHP3btAn+j2Iiy8gMYF9bq8ZF64Xz8AA1itNzlVxMfUtL1Fn
X-Google-Smtp-Source: AGHT+IGGZYO9R1Ir9jZGE3PRQGONJFCKHQHAZ8yS9pdVo8obZtmL6fx1WKDeNC/DhwpJv1mJ7ANdZg==
X-Received: by 2002:a05:600c:5108:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43c5c4bb61fmr11520345e9.4.1741359656901;
        Fri, 07 Mar 2025 07:00:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c11e9desm5476847f8f.101.2025.03.07.07.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:00:56 -0800 (PST)
Message-ID: <ceb3be8e-8f5c-43a8-a4b9-3ee62e67dfd6@linaro.org>
Date: Fri, 7 Mar 2025 16:00:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe()
 to avoid __refdata
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
 <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2025 15:29, André Draszik wrote:
> Hi Krzysztof,
> 
> Nice idea!
> 
> On Wed, 2025-03-05 at 22:43 +0100, Krzysztof Kozlowski wrote:
>> RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
>> and it caused weird oopses which even KASAN did not narrow. Probably
>> because of multiple exynos5-subcmu devices?
> 
> I've tried this on top of next-20250225, and it doesn't work on gs101
> either and OOPSes several times during boot in different places, but
> I can not dig deeper right now.
> 
> [   11.502919][   T58] Unable to handle kernel paging request at virtual address ffffbfe2ab25cc30

Thanks. I'll dig more once have a bit more time. The calltrace is
exactly what I saw with exynos5-subcmu and it puzzles me.

Best regards,
Krzysztof
