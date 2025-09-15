Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B710FD;
	Mon, 15 Sep 2025 04:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757910784; cv=none; b=I3SEaT0roAKgqs5y+Azzz2P5+IBKyYw7EW7AyZjzWCmDJ3Nd5ZcPrSbfOI37D6hT1G0dKJya14x34obopGsJPBBhnYtAq7PlfHt/CFCwHreya2dGkN4dBvSj8mz5kqNEj3u8qfatDGUPlaDuNJ5qJDNK/oL2qbSTB03dubFJplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757910784; c=relaxed/simple;
	bh=pykA1A3/Zg0D/ZaZ6KglsvOLp4vC0LMedDVJjoQuhpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl8e/JaVOsi9C/4XrIRNX2GgUGg48aclfQkTknPW+deU4Up/pLgGBQiD+NqV8jfhYdr9yUrGdbZeEA3qU9GyHaWWs++fOjjbmmfDEbACw82kAn3yqky0FL32ZwbJtcyIhROzlPSyPhWh6DuWoyBCtoGwy2KQKNFAIajYUb54hT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeEAJXcp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeEAJXcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3B5C4CEF1;
	Mon, 15 Sep 2025 04:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757910783;
	bh=pykA1A3/Zg0D/ZaZ6KglsvOLp4vC0LMedDVJjoQuhpw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EeEAJXcp//6Qb0FMBfCMiPMVoiiqCMa2329dXewXnCKIoi5MOma3r8T0jEawSr5Uu
	 HQst3nHsv/qGEhvJTDMa+alyMRQ6/4K5g5c0g/xLm8SElEh40rUGrBHsXuTBDH6qJ8
	 Rjs1IiZILiTOI7JA2g4MwYGrdbrAmWhzruKg/od84m7m8PnvdLYr+bXPc6yqK3I9RW
	 rsRFrtEZlT0BNe3W3Z76Lf89k69YOiAMEd6g7SnKrs/20kio1QEIHbeOGwABL3wTKs
	 YNzb4OASZJUt+hRS96Oi92FJq+qTBJAjAlEbB9pz47ABrwuwP/q63oZUObgUnfS806
	 yttGaicxuhi/A==
Message-ID: <9f255174-bfa4-4dfb-8c19-6488286fca21@kernel.org>
Date: Mon, 15 Sep 2025 06:32:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Tab S6 Lite (gta4xl)
To: Alexandru Chimac <alex@chimac.ro>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
 <20250914-exynos9610-devicetree-v1-3-2000fc3bbe0b@chimac.ro>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250914-exynos9610-devicetree-v1-3-2000fc3bbe0b@chimac.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2025 22:44, Alexandru Chimac wrote:
> Add initial support for the Samsung Galaxy Tab S6 Lite (SM-P610/P615):
> 
> - Framebuffer, through SimpleFB
> - RAM
> - Buttons
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  arch/arm64/boot/dts/exynos/Makefile              |  1 +
>  arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts | 97 ++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index bdb9e9813e506de3a8ff6d1c3115382cca6ea9d9..8aacff968fa10d6b645bafe910c71fb65e8569f8 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
> +	exynos9610-gta4xl.dtb		\
>  	exynos9810-starlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynos990-r8s.dtb               \
> diff --git a/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts b/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..f455af22ff872c6f07b9bcfc68b1ae1f45d0def3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Galaxy Tab S6 Lite device tree
> + *
> + * Copyright (c) 2025, Alexandru Chimac <alexchimac@protonmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "exynos9610.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	compatible = "samsung,gta4xl", "samsung,exynos9610";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@ca000000 {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&cont_splash_rmem>;
> +			width = <1200>;
> +			height = <2000>;
> +			stride = <(1200 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3AB00000>,
> +		      <0x0 0xC0000000 0x20000000>,
> +		      <0x0 0xE1900000 0x1E700000>,

Lowercase hex everywhere.


Best regards,
Krzysztof
