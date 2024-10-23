Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0235F1AB52F;
	Wed, 23 Oct 2024 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729684751; cv=none; b=QevV4Q7ugnZs/zM+XPXDf/Ud/xZEjKeQWzqOflcIt3Ns7pI5BqmNq17pJURGnjKw3wMj6t3Ei3j1wofDBN2kNDSOue4f4ondvmX/TqxYjH7hQ7+BrtHyCDv2qT2qmueTbCqe+IHGiHzyUQtIoXCGY8ncpVnFMuQc1G90guTqcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729684751; c=relaxed/simple;
	bh=3oAdXRUqoqdZu7WlqibJxCVed1wP6L7xU2te9lis9PM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GgHd5nzxLE3f+waQQ5ikrlCK75cyPqPxH4M80xvNhj3Hdt2dknxiEitcl5n8BFj1pDaaRIEwAkkZZvm8oYC+hmkKlRjVSodfv+Z5MABeqIgCmlYhwi738zr/gw+MyZTwEh/01tfGvQYoVRqWOA/+uBzbs0bEcdZOscYOhbuE/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYwlJ6c4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYwlJ6c4"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb58980711so70211381fa.0;
        Wed, 23 Oct 2024 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684748; x=1730289548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSrZoDHar+RR75Use/GTyw4Z+RteH8/soUihixxCcSU=;
        b=CYwlJ6c40MkOiAJXL8E/trOD+jj/MOvDicMDcXrR+wqAJHV6RVKNbi5yd0OAha6TIU
         RXvnTzak73D6ZN9DtFBjI7HU0uPKK06MV7tbUlhm5IFX5Zc1ZmgZxOSw1VZP9snbPuv3
         +xQFWnOQihcx5OA3r440giCxVvytPQ865roIsr2QFg0mFhFR/SiIEg8L8z/wM+u1FyJA
         H4B89lSU58OQRHtl7ioDtX4ckw7tjnT4udoGkpnU79EYZ8MRVJh3mIrsXMLce7TKxOML
         LpUEbjWj5llm5wY20qVw71J0ShBhsZZb3ZFfzN2vCtqQkz1ej3Keduc21SIjSNlmSt8o
         gsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684748; x=1730289548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSrZoDHar+RR75Use/GTyw4Z+RteH8/soUihixxCcSU=;
        b=DCFs7CopV4vJK2SCRo1F3k8XUxzk24y3YOZDK3DQWVCLQgEr8OKaeIkYtaJP4YR+Ak
         2YIMxIFp+1aoWoas4EJidaCaa7aSnAKo01oU2y4YhsC54fiqaWH0WHo+Oyrb0kqyiHIQ
         cS62NRwtPfZGuyKmzPbAfmXqcPk8GKS5/mkXA3TLbWQwkcRG6yhiTYlCw1WkkG7lsSyK
         1D4vxfWqD4b9E1F5GA6GfscTmzbKhQBxypLFqf2d9D19YQ4LECfjSD8euo5qaa+z9xJd
         niqjBlko+9XAAeNgMHXJOOXVLiLd0ex4ZFmG8M0LShoAiCj7EAhr9XVMR0HGx5/mhM1e
         qIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLO3Yju+vpA8i518kUEeo1CwSYogt9xQFYfR8OPt1KOOj3+MEdAtcJ9Hvp4IG5QYpA7P7WPr+7mm6rn5lh@vger.kernel.org, AJvYcCVTvcFDcV2i7cM5tBXQ8rqIXdVBdg2TS27aZVHqVehTDq87KOUY5AlP8VhcQV5tVQ3ZsQHj/yF8U0jN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfjQjIZEi1ZW/M03cEAqn5ByZ6mHsWZ5v6/KPCg7BQMQjLDEl
	uXUbcPwZoX/3L7MggjPn8RmJDWkFhtMPUtNcFUCwfQhPDcIt8mlC
X-Google-Smtp-Source: AGHT+IGrJ5IYAvwm3x9JP5LDD/HoD1kxDf6GW9zNzKdONXpDADYeHDr3cEtxhRUCR/qMuZDpi6oxaQ==
X-Received: by 2002:a2e:a991:0:b0:2fb:4ddd:a8f0 with SMTP id 38308e7fff4ca-2fc9d3467ccmr13445811fa.15.1729684747818;
        Wed, 23 Oct 2024 04:59:07 -0700 (PDT)
Received: from [172.20.10.3] ([176.222.0.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a445sm4360600a12.41.2024.10.23.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 04:59:07 -0700 (PDT)
Message-ID: <99ac4890-b6b2-4192-bdb8-62e70084ffbe@gmail.com>
Date: Wed, 23 Oct 2024 14:59:04 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/23/24 12:17, Ivaylo Ivanov wrote:
> Hey folks,
>
> This patchset adds device tree nodes for multiple clock management unit
> blocks, MCT, SPI and UART for Exynos8895.
>
> Exynos8895 uses USIv1 for most of its serial buses, except a few that
> have been implemented in this series. Support for USIv1 and HSI2C will
> be added in the future.
>
> This patchset is dependent on [1] and [2], which add driver support for
> CMU and UART.
>
> [1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/
>
> Changes in v2:
>  - Add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>  - Change clock-names according to the v2 changes for clk bindings

Forgot to mention that I dropped the SPI patch due to it getting applied.

Best regards, Ivo.

>
> Ivaylo Ivanov (5):
>   dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct
>     compatible
>   arm64: dts: exynos8895: Add clock management unit nodes
>   arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>   arm64: dts: exynos8895: Add serial_0/1 nodes
>   arm64: dts: exynos8895: Add spi_0/1 nodes
>
>  .../timer/samsung,exynos4210-mct.yaml         |   2 +
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 161 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>
