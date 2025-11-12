Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D12DEA77;
	Wed, 12 Nov 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762935014; cv=none; b=Sme0W18qcbKrjGQx3KAWKksXtTdkgWhwY2oL7cQ4oTPG+/wOF42N5Xat5tjrwefgAvo/qO9jvSrVnkpm45V2cYKFwaWBAOpxo9uG1EAnqQ5FKXVaT6ZpeWeUieXu+24nlj1qSLLUPOeJx8TvBSqQdh9hmOgT+b96J17bWvE8kss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762935014; c=relaxed/simple;
	bh=iv/OPEfQvs2X2gEq4hDNQaM+Mdv+7H4qcOkVCuUzYvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfuYODuv1eh+k3LLknG7HYQiYtTh4ZPNNwJlYQR80L4jeejtXokc54LKzSoKC3bi76IUjvkpCEvIXL/pPXK4A3d5hFDxbudQNd3tShEC5v7zlcOGGdKyn9h9i2hAgdCTy5k9joOerrzLuXQB+vu0WEPXExuatVUXEjjps0m9sFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+16XDEn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+16XDEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9FAC16AAE;
	Wed, 12 Nov 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762935013;
	bh=iv/OPEfQvs2X2gEq4hDNQaM+Mdv+7H4qcOkVCuUzYvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t+16XDEn2tz88QHz1qof4GA7lGaNoQ8SBVlOT4YHqqiRtEU/n0xdDxY70KEIN1Wlq
	 5yj91quFLQHofrnrYAoI4AB88x5AcfpbI1KTRthlrRcclbAJQ99ykS9p/sHTVlrJtb
	 6BZZd9MFBCGPVX/PJYmQKKAmcueOQYjbJnf7ZEGlQ6056yRXBN7WJcqQdlbKtT0/vg
	 adASYXnaVFyHVDYqsVK70Z0ZRoomJTkoYMaOckyP3P9hGmyV/41wbjyjRoyv5Btf5P
	 fLVoU+X8FkLDZJHnmemrY7QhmJHtdjqHxzURQGY2dedz6DD6J6HrCY6Kp9PsRKCDCJ
	 jUfZALiZyMLvg==
Message-ID: <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
Date: Wed, 12 Nov 2025 09:10:07 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2025 20:22, Douglas Anderson wrote:
> The first four Google Tensor SoCs were offshoots of Samsung Exynos
> SoCs and their device trees were organized under the "exynos/google"
> directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> Google Tensor SoCs are now of Google's own design. Add a location in
> the tree to store these device tree files.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  MAINTAINERS                         | 1 +
>  arch/arm64/Kconfig.platforms        | 6 ++++++
>  arch/arm64/boot/dts/Makefile        | 1 +
>  arch/arm64/boot/dts/google/Makefile | 1 +
>  4 files changed, 9 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddecf1ef3bed..f73a247ec61c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10606,6 +10606,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
>  F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
>  F:	arch/arm64/boot/dts/exynos/google/
> +F:	arch/arm64/boot/dts/google/
>  F:	drivers/clk/samsung/clk-gs101.c
>  F:	drivers/phy/samsung/phy-gs101-ufs.c
>  F:	include/dt-bindings/clock/google,gs101.h


I am fine with this but also please consider having separate maintainers
entry, because, as you said, this is a completely different SoC.

In any case, up to you folks.


> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 13173795c43d..044af9a3b45f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -138,6 +138,12 @@ config ARCH_EXYNOS
>  	help
>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
>  
> +config ARCH_GOOGLE
> +	bool "Google-Designed SoC family"
> +	help
> +	  This enables support for Google Tensor chips starting at the
> +	  Google Tensor G5.
> +
>  config ARCH_K3
>  	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>  	select SOC_TI
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index b0844404eda1..b4b5023d61d2 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -17,6 +17,7 @@ subdir-y += cavium
>  subdir-y += cix
>  subdir-y += exynos
>  subdir-y += freescale
> +subdir-y += google
>  subdir-y += hisilicon
>  subdir-y += intel
>  subdir-y += lg
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> new file mode 100644
> index 000000000000..a6b187e2d631
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
Drop the '+' in GPL license.


Best regards,
Krzysztof
