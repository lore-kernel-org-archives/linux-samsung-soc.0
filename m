Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05271D0E39
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152302; cv=none; b=mPBYva/j1FI58nkVvnDvTyCuTiDHlm14lRdtu4+e8KMTXFxSF9FEL/cQ2purJgB8TUoInv5aN7K1iMBtHncBVQGJMEmE+jYU3UNCulnrsCYzawNiHCRyVVuiDzhfaUiveYw5sP1e3vluESu0HaDCWvp6D4EpYWbVQgqoHTfhVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152302; c=relaxed/simple;
	bh=oNKqOXKcCSuWwn7QD24H5bQrK3ZS8YdpLiLnSBCam+k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i4ZRkphbQ8ByX66sYA173UcOpY6L1solEQ3H+HW6mJJdfEh4W9H7ExmRCODOyCDscXSIIH4KNxGYlrUKneZBE/VUd79tgle2N13WI67Q3bTO0YnaT+Kw2GWnHKe4RlXk1SIrx4RPCpDy0XVvUTGEN3Gd5a0dzadup8jNvJKRxEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1nId8cg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1nId8cg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431506d4f3bso1126205e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729152299; x=1729757099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KEjGzsEsxUj0KxHyyQ50SAmkXnA8WmgHQLcKXPcmx4s=;
        b=O1nId8cgzsW+lfBqg+9ZBpuELzB5ut6s8aG+ZR88kguLCVtd/J23M9JujETPnV2QOP
         9gtCQi/AHp2AfsKrn8SGXlHG6so/V9q8VuePz0K6jqNcxFzdlusu/HCw7MsZ3LG481ro
         c0h5cwiYd1ichNXY9IOTLbC3e8eSIDHhRIm2wkvRRlUnFMM1qHG2FIOmK7cgh4JPqRr+
         EBgyyk97o7Ndc/X/hxJ6iARyZTFRUrTu6IZ0k8BGVrHElpM9n8C5/BpExBg6X3U+HljL
         2vU71sUyXekKLydFbP+DhbXgKyNT+iF57gqBPbo9BFdt0WK5vl35fDsbe1jddJFymrEm
         MpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152299; x=1729757099;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEjGzsEsxUj0KxHyyQ50SAmkXnA8WmgHQLcKXPcmx4s=;
        b=VZLJLRdcJB4UduJMtdvmsDCJxyIUWmCL24w5a6dor4p7oihNI/6rGlPq+UwAPD6FkB
         2Y1fvBERJWRLfwcZSmqWEDyVoBUd9HbQ5+Hu2pGpAzAK77VjhWRkb/35LUT1McMJP6xq
         BGhEA5uzrmLNZPPBKaQNFkeLlNqGGkDU4tEkZ4IQoteDCAU0VBaeCk16p7GTMdaxPKNC
         vsZKC3Fu01yrYRRX3xGHXw5+fkFJy2/OXXH7rtdNgKyjWcD5uGEPJS48fXRcuItKC0sw
         Y5ZLN4Cb1ns4RjKIsac9+/nJSvzz3uYrddiz/gqlNLyiJVkPVobx5Uh1pIVaLBxTWYBm
         KIDw==
X-Forwarded-Encrypted: i=1; AJvYcCXi4nqNoXI9eiDFzevT/s9uP/gPNy/3IiELB5XXxZD9/ZF/9cUiMbVss4XN79GfKA2hMVPmK2hSxUYb9Nrc+x0cJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoc02k3TpvvIp/lr6z0tMFEy/212GMVqorgAC/NizST5urf+xx
	4k1MYAiZ1swuyr+A6CTZ7cZ9M/bg7OxsC9I4dhhl7DswxRYeJl+DPntTsv41Lf6wz1eL/uenvRa
	s
X-Google-Smtp-Source: AGHT+IFXTgszlJ4Kb3abh8g2Wah0CJsvDK9L+ASc+MZsoLVYNFKnRDmL2xEixz6EuUTZIUyezLrgfw==
X-Received: by 2002:a05:600c:3109:b0:431:55f3:d34b with SMTP id 5b1f17b1804b1-4315858a1f6mr7699925e9.3.1729152298880;
        Thu, 17 Oct 2024 01:04:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c55a71sm17839985e9.38.2024.10.17.01.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 01:04:58 -0700 (PDT)
Message-ID: <810ca064-4b09-4a54-bd41-519004b407e3@linaro.org>
Date: Thu, 17 Oct 2024 10:04:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/6] Add minimal Exynos990 SoC and SM-N981B
 support
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
 <172915219372.18330.2035321894922518356.b4-ty@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <172915219372.18330.2035321894922518356.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 10:03, Krzysztof Kozlowski wrote:
> 
> On Wed, 16 Oct 2024 17:47:41 +0200, Igor Belwon wrote:
>> This series adds initial support for the Exynos 990 SoC and also
>> initial board support for the Samsung Galaxy Note20 5G (SM-N981B)
>> codenamed c1s.
>>
>> The Exynos 990 SoC is also used in the S20 series, as well as in the
>> Note 20 Ultra phones. Currently the device trees added are for the
>> Exynos 990 SoC and c1s. The device tree has been tested with
>> dtbs_check W=1 and results in no warnings.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/6] dt-bindings: arm: cpus: Add Samsung Mongoose M5
>       https://git.kernel.org/krzk/linux/c/0d16910e899d0645e45128102c5113836eaf9bc1
> [3/6] dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards
>       https://git.kernel.org/krzk/linux/c/f7aeff28f2768443a49600625b6f3d0aad1fdd52
> [5/6] arm64: dts: exynos: Add initial support for the Exynos 990 SoC
>       https://git.kernel.org/krzk/linux/c/1e5f14efd65caf1d173af8fb4eeb3e04b2625ad3
> [6/6] arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G (c1s)
>       https://git.kernel.org/krzk/linux/c/8354f854a90bcecd32dc1dc9646e805d60e96f0a

Not sure if all thank-you letters are correct, but to be clear:
I applied entire patchset. Thank you!

Best regards,
Krzysztof

