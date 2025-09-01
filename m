Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25D203706
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707909; cv=none; b=nWDxb2tilksIF0e84cCu3lM6IR6okOLB8ATGfhkhvV9N1dp034Q8srueKi+vSGsGK8S+w3UdmDnuYyKE0+U/DQlONCPhHAaXqWBt2xmNMsjtRXQNB56jbNxLcYYQdOQlLh6l4XpHvh0IHYDpXaE2wbph6Mr1uOY718NSQIPhyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707909; c=relaxed/simple;
	bh=5tEFRvyGeKDN+x2Ei9Cj+rHE7MmPIKyHBlDmb1SmtGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIxn1qIU5ILK33xS7G14/zXvu0ieB50xiK9f4oSgbNb1pNYqOxl8caju3mMBQeUp21h3eiJbzTkSvZlVjzuftNaElQQu946N9qvlbmGy+WNokRPIrNIeAbKwjNIvM9NmYZdIuKs30OiR8NDrjh5+GISNXstHDCQRcpNzXSpk5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDKvjeYO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDKvjeYO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso24673795e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756707906; x=1757312706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=JDKvjeYOO/6HDrP0X+HHkWGd75rKWnbeZl/5VBOLYpQoPKXtFqX5dbwIKAm8QysPGT
         5NpMTn9JKuXTSluQyPoG/yGxLVvODNUlVtXus+Kfd7ZVGScS+WPnURCutJ0IaVALK1wK
         Vf9DzIZI+Eol67nnigq6GhdsFYfI/frYX2huZmoMPN0P8PM2mvtKGUI2O1bkSerWURug
         0F9+k3ANaVx++ezFQm9KylhlTxs3gXztLa/oFi0ABlD1u7o4fJ3BJMUSA/LTywiTo7+D
         zrqwfcMSevmVKE0qRzeZrV61g12N3gPKC+/eznUYvIcWbohVkQGzFByDt3BWq95YfMjo
         4nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707906; x=1757312706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=UOJcJwT4a4v3tE73DvWr20y3glmB8+ZFmpnANJn4bX+l31PCN9mwFJnXFW0U494cdM
         hhXMj1MTNUPR4szdTScyjN05c8SRzuyW6YVBj0bBXF/aqFjRckPIg/v4SHVyYf9H8lZz
         Fs0ftOwgDVG9/1ODLC3bv5E8OogO08a5bcgxGx5BsAnVAU8X20deitizvTP/hg+bHyfn
         m9yqxCsZZvmIOV93g3SwqDC0AVEHq5nrnZD/yzkDvZZdsJ3g52NRh3b7PxeQCa92fFLE
         ggUDFYgZiheYPJTEkWGHtSFetdhhwt3+JbQYvhslMVY0nyKy+BOqo2rHmtImVms5sUbG
         hk/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSUldSqwV1ZbWUqjfWng/FQGmmWonZtLJajGr9LRSdP2l6iRNpojkNNu3CcXykbyqlNuICtt7pntpffAKqPQrBEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQjlMk+RlVmmxkBN62x8YahvK2Frtx8+2Vjx3Im4auv8baRf5
	PPE/LqIahSRGy4YwtLkBF21YuLtEmsmFi/FXpChpHxGJ6TNdFHrNmWU0ZYl4fozCMRc=
X-Gm-Gg: ASbGncvlN2lldmbC1vnNJsBgcXRl9f4f1gsHrF1BXwAONCRNfXXB+G/CzTcwOrgRjtj
	OPGuUPfvwOvMU9uFhmASVNDfUPMy3kYzHar2xCLaYIMBIcKdWW/NaawZ4jj8Ha0rD5i0MHioFYG
	WsTyzrvE7TBgnPs8HJlPkMoRpsOWuKEsUrWWO2uiH9U6uRj1FwIW5eYLEY4ee+MbFduSuKaVCgl
	IMKTjM8kAnanbgG7TywtRKOODE44gtXq0IXLp/8YnCIcEFqdlEtObDX4bRrFijc02iZAIM2yQ7J
	P4iqDQv4Xr3zLeJn90j18WVj2h//znuXoog+QUfFaNYwQbsNo45ks8veRbBQ0bNLn5KB+ygRWft
	WUlAb3rz3aWxSeb04lJZO4JyZrucShVXmBoKXgIRf
X-Google-Smtp-Source: AGHT+IHnke2GT0NOJivpigEQtNHBZdI155ZzMIvdBsIqtx3ducDptv4HE++iJXeOAgJzi8Q9MoWEvg==
X-Received: by 2002:a05:600c:3b9a:b0:45b:8866:50fd with SMTP id 5b1f17b1804b1-45b88665357mr41091535e9.32.1756707905579;
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d3a7492001sm7507997f8f.42.2025.08.31.23.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Message-ID: <788c3aba-568d-4297-bc8e-f47921859d57@linaro.org>
Date: Mon, 1 Sep 2025 07:25:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
 <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 11:40 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
>> index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
>> --- a/include/dt-bindings/clock/google,gs101.h
>> +++ b/include/dt-bindings/clock/google,gs101.h
>> @@ -634,4 +634,19 @@
>>  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
>>  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
> 
> I missed it last time - this is a header for SoC clock controller
> bindings. ACPM firmware is completely different device, so should go to
> its own binding header.

right. Will do, thanks!
