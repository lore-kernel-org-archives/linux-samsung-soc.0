Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC17393DCA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756124984; cv=none; b=m4D2edf5rotfYx7IqTt6Qm8xBq99gWvxRqVCV+j4xRNDcyzB68hcFEgHsfyWVAJGPBoblpJDvyny7m0UIwMAtyH5iy7U+yd9E4cNW9C1VxfpU6KhhrtVdvVEx5BIJ2yor0PhzXVcSoMyPH6uZ9aIYGQrdh33GU+JcihS7QrrqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756124984; c=relaxed/simple;
	bh=jiQL7tU9QbcztiQhi7qKT01sqNx/0iK61wo4QpQbNgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzH29Oj7YPG93MwgZ6iPQFAYLtQ/XmHoj74DW5lgJeBfgyed4KuVtCF66QD9lSnzrKSDj9LTY6FOD519/cD1r09s/r40XpClqLlVB5I15iQ60U1biIfD2UOklnxtAbXMyhjMeBm1rOKiJnY1aVojitKHuAojD0ksuFKclMPIPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/Zwb/FI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/Zwb/FI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so35327265e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756124981; x=1756729781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eai2SOVFyKY7uDjz0RBz4QRcfaX15jQWQ/bFhzOuBu8=;
        b=S/Zwb/FIRNe9MsvoC+QVHiPggARJmZwqMDvtikOcrW+YkNC1NCTqpcg+74e4/nuZAP
         IAUOdS0c5FhdSMDXxEWqZaYSfOmKIJ/jFr41cqnS2c+0NXh8WkWDBJnQYDPOSKHQqwu6
         LEUpWzq8GFVZYnqQgHeNFckYNbuutje3AzRD8KzDQtz23RoeZWDd+FGNHPOioiTN2uZK
         36EYHvgrmkthWTwmFQWbXT3xQGsQ4dAtc7lnuqYTBVJyNd0uHL1xuL0vtdSF6uYZYCMR
         HD4EfNF75qyoFUj2r73ETIYFTF416+fqgvOEy4cYB3AnXVSObLUQVd9npoo3n66m4nON
         ypgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124981; x=1756729781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eai2SOVFyKY7uDjz0RBz4QRcfaX15jQWQ/bFhzOuBu8=;
        b=O9hkVcKQPiZBD1e/IAr86+T/k8KAGkcmcOFRnORjjKRniA+YAjvQSdal6py1WKssVU
         /Q908s1a2u2SJQ/P9J6unMPHfelrPpNHH6/ntnBaJfe/rvEA/Y3V6VRC1X/7AQwzRus9
         ET+f8MWRH/7F1fyRTCEeLw81sIBE57gK60iPKuIF/DfZ1QD8Lay27IQ1f4oaCsHDU7ly
         fTNERa/pL+nIL72A57z1MT3SWzMGy2E6OZB3op+0PSM9VuRyhtU0PdDVvnsO6e/NpboC
         EAVCsYba7O7LQT7U9oXhnO4QhRpM/iQXQXTN0m7unaa5yQou90Uy2j263Jb5F3RfjxiK
         GXxg==
X-Forwarded-Encrypted: i=1; AJvYcCUt82ISc4z4pjr4hrNxXZuHckZxWvpU6aS2yaBdHhTL4uoORNVg+LUtaK7bFIDHEqo0xSMSbTKmdXb1idwxM1DX8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YytRYh9Ivl97X41+bfp09CpmIgMQ7HII42d7DMc2WWcWmP8w9YG
	RULc/CllXtuWw2jD0gIUlJMoJLbKGNvzAYelNSKECUOyavoP4MxHWbe5DDuYZ2urPBM=
X-Gm-Gg: ASbGncvjQyIngQpsVx0U49teMk/T3EoLRS9DRzIQub9xMUJDfPr73uomMaoNzC21Ihz
	uK/9D4Ovkq3ViXu5jRitZ5I2w2EU8I+gyY5/jD+DGPdJVrhppm5O+puMTNmZ6COECUmFGTXesfs
	3WtDMhdEfGIDM+0Mi1+DgBM2/42ZB2N8J0HL9ptfF/BnQ9Rcx8aIOYZUYpFCzPrqzImEh3lAYfy
	sZs92OowRLiDwRHqrZ9PVrAStLkB6qn//Gxc5oH8HGzb5KR81d2ZqkCn1sjaYzK+KKIoXjw32Tn
	lsTH4Q55rW/xAOjuQgihuNmlrD61IoUr8UXufFfz0GvlIkIt2/wn2190elx8FXtsVMYnhvVFdp5
	hG4PR4mH5q4QGYPjqN3V2h7gwwmFVz+0=
X-Google-Smtp-Source: AGHT+IEv1kH6bqyVtAllBNsNRCwow2nM6JC//3mmwEWBmo85Nw3V+P3tVEs7CQiOJz1KhUJg0ZYTeQ==
X-Received: by 2002:a05:600c:3b95:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45b517cba02mr109565765e9.17.1756124980706;
        Mon, 25 Aug 2025 05:29:40 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753b77dsm113994195e9.10.2025.08.25.05.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:29:40 -0700 (PDT)
Message-ID: <c89c7670-01c6-4002-a269-08cf19e1abcd@linaro.org>
Date: Mon, 25 Aug 2025 13:29:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable Exynos ACPM clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250819-acpm-clk-defconfig-v1-1-70f5963ef90a@linaro.org>
 <aafe8482-7017-47e8-b035-7adc49e69a06@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aafe8482-7017-47e8-b035-7adc49e69a06@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/25 6:00 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 14:21, Tudor Ambarus wrote:
>> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
>> implement ACPM to provide support for clock configuration, PMIC
>> and temperature sensors.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> The patch should go through the Samsung SoC tree.
>>
>> The driver is proposed at:
>> https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/
> 
> 
> Please send it with above patchset - it target's same maintainer: me.
> 

I noted it down for the next time, thanks.
