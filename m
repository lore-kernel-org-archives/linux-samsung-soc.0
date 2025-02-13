Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26123208974
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431227; cv=none; b=ne/FHBV0t2eH/QF1pgGR7a7V6WsZDQwaNFYlLcHRKf3UnLgezBTc9ipGdxK5CJPaXzKFOsVWb4jjvm9QYQ61zOFZW6q4zMUMxKCvXyFIrJFMIekB1xfkEUC+VkpCgM1uwyqpbxWGhGbuLiQUiv0/xUydQrK5/rKcr4QQoKfV07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431227; c=relaxed/simple;
	bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=buk5YW4un2MObQFB06NLpsqoBbzQwOmalR48/REu6ZNTFIiWwSjnycSCe5ovdZ/tOHAcTdpC8B+kougk5kD2YNaOrN4PwGjRumikzNUdU+ctCeAV4vnSbgKZvooGf8CPbak90RxUu6Gie/vBW9agxY0m1t41XjaKS14qKjM4YiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nr6PcTii; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nr6PcTii"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de6069ceb5so2890134a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 23:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739431224; x=1740036024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=;
        b=Nr6PcTiiRkAnY7LZWY3BD7ITa0OAQ63nPuWz8zsBbFTLOPUNrsIkYqvF8X8k1HYn5B
         s69fmWAKB0t19xG6FosNmmz0VdH9/ZQodTieQOqpwyL3OVp0MA2V22E3Q+P92iT/t+HO
         gkvf3Xkun79sCueZhRPPUsKCCIfK8ly7iTKpBGiCiaqt1dDoo3SLLoAWh78N7SSUBgN5
         LYO7BaVph6XbiwvB9u5Mu/pImu8QHLCU9jSsjM3deK4yqEWC7g2tTVfmh9FpANWHwDbh
         ZHbrnF6TnHXgpd1wOSvH+j3QSxTmxIIfm3qCclLVh9IdxDTE4ilDlRucH0ZUBka1oAPh
         roYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739431224; x=1740036024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=;
        b=I27LGCBaCp3FKdtv1gcMpLWpTievnLRGDt5fPlXvV5XFlgVkjaDQUoBV2x4NskLh5d
         OD+ohqBOLwcBG+9QeofbZnr5pNqJzs5YJ/J+LzYGVwGMU5JppJldIPfbw/upYioK9JVn
         1bVKy0/9/LHAKl60yuU24j4Xuz4awLtsguSgRNyVP/CYWrhjlARBCy4kt1JJPclsPoER
         gJqrzYPEdh+1iE5mxyOWQ/hg4TTLoMuFD5/yS+jCEfR+UfS5sehfQ0oV3LSHgpdj3K0f
         +WTCp/TL6fPayaqXidYxclXz8hDRqZsEc+DE2cKgP2Q/re8ep5boV/bwY47/9+v54pBf
         +RTg==
X-Forwarded-Encrypted: i=1; AJvYcCVWHoZ4InBagS7EXLb45I3bpRbqaUBnCJoNm4yG3yHLqkTCJZHAFcbyYuIJoEmJ4e8dVzTM8CoG0BjsEugg8bhICg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+k8xmrfwQn3KRqV9Lqu3u5/gNtpZKYSKvfRCGNqsKBVjdV3GQ
	yPSPFVStmetLi2z5JelswW6FfoSJEeX2SYr5jUdMJVrpU2d5go2jP3nktUyhh1g=
X-Gm-Gg: ASbGncvshaAyF2UZ3pfA+TPuG5qhDabcPNh7LZnE4YOTY+KsacpDMPEyU6x2F+F6rz6
	4WjpWcqlyrN1prZ29IvBIwvOaHDLwhGdZpQYmqbERck7DahOoevhcU07JRlxmn9XymqHilOUP6e
	hJn9txuvYTmHUZ436mD8ZDAeHZQATTITeSIxYTnYEYCAryVaHc68IJysyNEwM1bBtpo4dwYdjK8
	OR1LQVicYzBdnmzsKdcL3ShyWZsbnI/MaxjPt9PjqRvA11SNWQ10RIgb2imPWQh6ENyLUCjo1A0
	xzPWqoByDMsd/jQvDPCaf2nn
X-Google-Smtp-Source: AGHT+IGhPxIg59b6w0WCU7iMGOfAb73XGY1LMG+4SX9yxgvaUCg2qqNEqVjigzMYlqAJgEcHDBCS0w==
X-Received: by 2002:a05:6402:458c:b0:5dc:abe4:9d8d with SMTP id 4fb4d7f45d1cf-5decba62fcdmr1363256a12.9.1739431224388;
        Wed, 12 Feb 2025 23:20:24 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c4687sm674664a12.22.2025.02.12.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:20:23 -0800 (PST)
Message-ID: <fc341dbf-3add-4728-9ec5-7291ad3bcbe9@linaro.org>
Date: Thu, 13 Feb 2025 07:20:22 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: serial: samsung: add Exynos990
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212234034.284-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/12/25 11:40 PM, Denzeel Oliva wrote:
> Add samsung,exynos990-uart compatible. It falls back to
> samsung,exynos8895-uart since FIFO size is defined in DT.

doesn't the 32 bit register restriction apply to uart as it applies to
SPI? If so, you shall probably fallback to gs101.
