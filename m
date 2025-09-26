Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33E194137
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878181; cv=none; b=PJ3GEkSH1z+RSYFrHbbnZt0BiYsa2/LnqYUShZUCPDRzFORb9A7PV01Hh/MFsEmwGkqIW8Xh5eXXSYMPPYUWorT750PWoCfSbh8wUNncpfOfzue6ZAXhvICig3W11p5rfGkrBHlxtxpyLLAkmuIhasu1jqs0lb5XU66nqY1anRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878181; c=relaxed/simple;
	bh=N5Nn5ASoUV/CLfe1qwCVq4qrqLwYCl62U+RpSnol/00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKQSbqg28tbwRgoRZEPvpB6KSEmaqAhulENZLis/bF+Zr8CiFOtTezB78/+rf0Q4Ao5/o++/QBqmp2FsP2syh4w+W0+fb9UPDxrK7I+y74AcibrLJZF6bcIa+ZD0xEsmzGnfkTz66dHUsB5ltdmJJuHIwmznhQvCkDMbpbSjrks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ck/i/8K2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ck/i/8K2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so21035985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758878177; x=1759482977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=Ck/i/8K2Ewnx98L+wvIm4R8/2kMTphZr33Pqa7U5ZqTRQ4T0IDNz6Nx1+SQkGJPuKe
         ypN9xR35cjX+1tx2U7nFqCxuc3UWDgvCW7IjdN5sTC4mCHT6gSH9pl1hazQMiSNDpocf
         Js7yP1qILy+YOJuh7DtZcKyoW3YGis/3RGWEWUI5pVWtNHKvIwhY2ixNOrR6GzAHmoZF
         1gJB3GulmFjLTdLuMv59DXa2jN6VkbpjiesbPBIMi30DkJo22Q0bZ5nZhd8BN/gwN6xV
         wzPAFI0nDlqYgtqVWa9BMjWhXR4/Z51hLi2dfu++tEHb9tlEpqY0TYbO2unjUtngHHGW
         LdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878177; x=1759482977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=eArg5IcN7NX6EyfnbG3vDJjQOwtgAVv/r9wMAyUeKrufuZSPDshNtbzmJAzb6XnSLO
         BFKqdJOfz/xz2XOViBudLkVVymUTxgXMGwgiX2KFuTaO3ws5jLcympBukzzLuAdyTUFx
         zJtZCNY2LGkReRXmraIeCdUNsSIQnz7IKmtCppLxt2K0pizN2zuUb/JTJRjq9H1RfYfH
         XeXlYMhn50pWN7Vl2rG9FDs6TD7LnkVbqYDNGGyadK+PFmj24ww6HQaSXTUSyG1S3zY1
         jFSFlFKxtYT1o2/zvJu98iCLOub4E8EMn25K6VbTFm3Om7fSGbTcuH0wlNg0Qy2cYFUy
         HNmg==
X-Forwarded-Encrypted: i=1; AJvYcCWDQ0sMX/4zvK008NaKUpTDMnmT+P+BD1IUdxtjbK5rNP/9b54As7ZueI/2gYf0W86C1d2EKfyO5upC3QLZ9QtZQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMF3SMfY7c0qrAfm6+HOJ4K7VmHCwxe5iRIJImf3LR3XZGdt5N
	+8GOiWIfpy14drbKOz/E3W+aDZqaWKyWGg7eIFCFRrNv1ZITRP5PYjEI/NdtNQ7d+1k=
X-Gm-Gg: ASbGncvorI+h964DJxfvkCJmCgGE/DyFg/KK0WhyTFuUDmvD/Du20re0Jh70nxt9bbM
	aK9/UBdn6hzG7Zz7/1MYr9QPS3S+ux/Qbat9A3JOfUyfpHKp+/dwZBGCM3w/FRp+YgR+C2pt96e
	X3FXPVQeNM2sBZVOr5chvRb6AbFaDg4YP6uGmE537Yr0emF9VmGfA35A19+PEfS5M2WXVJCbVFk
	nbRNoL2eZSFJ4cSTeXHBDS8xkDe4266xNiLEihF1cLWW1kKOMNknA76Z3Iwz+rjNkVWvU5/eAAQ
	IFh9Ud1iwNN/4ysQODnRhiPp+KtL9B655s73zFge2wYIPR02uSzGU2nPXftVeJvR5PcoHVprIYw
	tVHYceOyI7/bxmmjQQY0k+aPDIAooz/Dy
X-Google-Smtp-Source: AGHT+IHWIpWJkFH6MgSaK7Lwa2sAdlk8StsGUnX1BeyXoXscm4t51npqgFevzyhLcqPW6OMTyJKXjg==
X-Received: by 2002:a05:600c:8b33:b0:46e:1fc2:f9ba with SMTP id 5b1f17b1804b1-46e32a0d5e7mr75187965e9.25.1758878177511;
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb71esm6152127f8f.1.2025.09.26.02.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Message-ID: <ec25789f-eb79-4a52-b93a-3005756cb572@linaro.org>
Date: Fri, 26 Sep 2025 10:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] clk: samsung: add Exynos ACPM clock driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
 <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
 <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/24/25 5:00 PM, André Draszik wrote:
>> +	ACPM_CLK("b0"),
> The last one should be 'bo' (bigocean), not b0.

Oh, yes! Will change it, thanks!
ta
