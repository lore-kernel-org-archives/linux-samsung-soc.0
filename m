Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305938E106;
	Sun, 13 Sep 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294894; cv=none; b=HEekAaaMHOxc0TLbyKZb91OJCkXYz2m+8z9pTAfB8Dh6GivjJG8Inv0Sen/UgJAlVuWhmqFj21WvIJWyd3RlGsN0CM2Sze7BcDNcMIqQCnOsKNdj1+HJxWk9aWQuwPn5mmtB/OllABQap+aV1KlFdS4RIZpog0RThxLiWJx89QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294894; c=relaxed/simple;
	bh=0SZpvtdiXRybF1B+EXRwXtcWXnp2YQyuyDLN3XnjL5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCvMI4syzYTy96wSuoVytd7Fi3KrpQFjioVs76aV5T9Ao7YoQ9GHEOHZtcQVI/TdeNGQv4m5YcMvYkLIAL0hBVX0HlrGBgmt7GeShvMhnH5/O006iLfOP3I0QsJxFn6MvpT1a4Y9Ivq2SB6GtpE+6M9NXoRwcoz2Qxs1x+X0oxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eB5Nfplt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eB5Nfplt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597FA1F000FF;
	Sun, 13 Sep 2026 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789294893;
	bh=Nj1Sc2FSNN6ZhJZTa8LiP2iCAf/RUsi5xVB8DoPPUN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eB5Nfplt65+eHzqIV29cFpdR+4YyBzlZxMdHjkFTXjrjx26YIlBVbGwURHtCZ1nGI
	 YEtDcebU5jThAgIuqx9s8Q9YHN8QLAhr7Oby7pIhDm1sC8pXQUC8wBiowxIm8QTvvv
	 yv2YIXRlkeE1zy41hIheOv3HvJX2GpLQoX8kyO3T/FeX6FlGdKOBS+Jf+1YGtSgEyN
	 g08EJ9G6UCBuuwrUj22q6Q1wNA6Mre0uwA5Vt2nFvEcJW00ygSnHq8I7bc4iPZ6G8H
	 7PUGEAWJdl7dh7+L0DCixL7/W/aXCCYAjBbdKfFxEDBByA3ZCtR0EFIQuvcDe4UhW/
	 28kORmTQQJrag==
Message-ID: <882f2529-1d57-4911-b924-d05fd88a58bd@kernel.org>
Date: Sun, 13 Sep 2026 12:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy A21s (SM-A217F)
To: Thomas Turner <tturner@lineageos.org>, semen.protsenko@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas_turner@talktalk.net,
 alexey.klimov@linaro.org
References: <20260913101331.198835-1-tturner@lineageos.org>
 <20260913101331.198835-3-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260913101331.198835-3-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2026 12:13, Thomas Turner wrote:
> Add initial support for the Samsung Galaxy A21s (a21s) phone. It was
> launched in 2020, and it's based on the Exynos 850 SoC. It has multiple
> RAM configurations: 3GB, 4GB and 6GB.
> 
> Since our bootloader does not set up memory nodes beforehand, default to
> the 3GB variant. Custom bootloaders can be used to initialise other
> nodes per RAM configuration.
> 
> The Exynos DPU clocks required by simple-framebuffer are not kept
> enabled during boot. Add the DECON, DMA, DPP, PPMU and SSMU DPU clocks
> to the simple-framebuffer node so simpledrm maintains references to
> them. Without these clocks, the framebuffer fails to remain operational
> further into boot.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 3GB RAM
> - Buttons
> - Ramoops
> - MMC
> - USB
> - Watchdog
> 
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
>  .../arm64/boot/dts/exynos/exynos850-a217f.dts | 193 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
>  3 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 76cc23acb9b2..f197f8eb633b 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7870-j7xelte.dtb		\
>  	exynos7870-on7xelte.dtb		\
>  	exynos7885-jackpotlte.dtb	\
> +	exynos850-a217f.dtb		\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
>  	exynos9810-starlte.dtb		\
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-a217f.dts b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
> new file mode 100644
> index 000000000000..f1d11f91a353
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Galaxy A21s (a21s/SM-A217F) device tree source
> + *
> + * Copyright (c) 2026, Thomas Turner <tturner@lineageos.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos850.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Samsung Galaxy A21s";
> +	compatible = "samsung,a217f", "samsung,exynos850";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@fa000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xfa000000 (720 * 1600 * 4)>;
> +			width = <720>;
> +			height = <1600>;
> +			stride = <(720 * 4)>;
> +			format = "a8r8g8b8";
> +			clocks = <&cmu_dpu CLK_GOUT_DPU_DECON0_ACLK>,
> +				 <&cmu_dpu CLK_GOUT_DPU_DMA_ACLK>,
> +				 <&cmu_dpu CLK_GOUT_DPU_DPP_ACLK>,
> +				 <&cmu_dpu CLK_GOUT_DPU_PPMU_ACLK>,
> +				 <&cmu_dpu CLK_GOUT_DPU_PPMU_PCLK>,
> +				 <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3c900000>,
> +		      <0x0 0xc0000000 0x20000000>,
> +		      <0x0 0xe0d00000 0x1f300000>,
> +		      <0x8 0x80000000 0x20000000>,
> +		      <0x8 0xa0000000 0x20000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_voldown &key_volup>;
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 7 GPIO_ACTIVE_LOW>;


linux,code goes to the end.

You can run dt-check-style from
https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines in
"--mode strict".


Best regards,
Krzysztof
