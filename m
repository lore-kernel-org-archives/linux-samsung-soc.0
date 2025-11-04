Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5241B87EB;
	Tue,  4 Nov 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762240754; cv=none; b=k2H4ALL8GhcDs9BglKUHPVxZtgvyuiZegAT5ErlVR7mv9M8dZ03uCLcNoBcAXd7caf3NJRPzppbNCNIis5/NuJ4QdHVSU18D12ME60yTMLpoyuGy340GEtVB2G4tq8GavXkqVWuz77MKM6ibppz23ctjf00iyns9L1JMsedBbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762240754; c=relaxed/simple;
	bh=1VqBPJua0R0bHLpOZL5JtWuxPmhUkmKa6r9tyoIY7UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjSV9qLIvfybvMDOHgpStd6JuGkbQ1kMiH5TPcnlHXLfpFiniLzMUI2/mqx/JNaXX/xxIY9/3i6fIHFfADOidcF0zBFrtiJz4rzndQrdcU/tAazth2BVGpLIVOV3Qat0uIlQwAr018a6zlxvAP7NLB1fm1jRPA7GbLg0D/RvIH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBGBC9p4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBGBC9p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEB4C4CEF7;
	Tue,  4 Nov 2025 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762240753;
	bh=1VqBPJua0R0bHLpOZL5JtWuxPmhUkmKa6r9tyoIY7UM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kBGBC9p4mQpg3XS12E3RweaLskIYe0bC27PMWxy9Suk8qzQMpMyYDG3/yx2cEX90L
	 T8a5LAlAC7Jhl6qfrXsRA2LLgASVTSuCgxFiqSNJtUZll4oUi3QqGPiD0AQmeOjKLc
	 qvvhY1/Re51Y4o1oysLltK4vM+oeDjIfRkHVWEeAhFPXmkCjuH4qLD0MG/yE9cD3PC
	 I9aTjL9JIPPKGEMhPxQ/dDxJI4VeOsklwMFO55UCi0pLlHlyxWDJHn9yrRzBoi1tw5
	 k+fkzC0eObQ/GS6bJEqgZUh7wEGViBUbRyqgMezlvZ+fo8yfL+F1k8LAf+WPn6VMQ3
	 fvNRXQ5Wsj7QA==
Message-ID: <93d5636b-a515-4976-b68c-9606924eab8f@kernel.org>
Date: Tue, 4 Nov 2025 08:19:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] nvmem: add Samsung Exynos OTP support
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-2-2a54f6c4e7b6@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251031-gs101-otp-v1-2-2a54f6c4e7b6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2025 13:45, Tudor Ambarus wrote:
> Add support for the Samsung Exynos OTP controller. On the Google GS101
> SoC, this controller provides 32 Kbit of OTP memory space that can be
> read/program/lock using a specific sequence of register accesses.
> 
> The OTP controller register space is of interest as well because it
> contains dedicated registers for the Product ID and the Chip ID (apart
> other things like TMU or ASV info). Register the OTP controller
> register space as a nvmem device so that other drivers can access its
> contents using nvmem cells.
> 
> Support for the OTP memory space can follow and be modeled as a
> dedicated nvmem device.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/nvmem/Kconfig      | 10 +++++
>  drivers/nvmem/Makefile     |  2 +
>  drivers/nvmem/exynos-otp.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index e0d88d3199c11a3b71cc274b2114e9554ac486fc..f973e009737f2fbdc8511e50f1aa9e6003286065 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -84,6 +84,16 @@ config NVMEM_BRCM_NVRAM
>  	  This driver provides support for Broadcom's NVRAM that can be accessed
>  	  using I/O mapping.
>  
> +config NVMEM_EXYNOS_OTP
> +	tristate "Samsung Exynos OTP support"
> +	depends on ARCH_EXYNOS || COMPILE_TEST
> +	help
> +	  This driver provides support for the OTP controller found on some
> +	  Samsung Exynos SoCs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called exynos-otp.
> +
>  config NVMEM_IMX_IIM
>  	tristate "i.MX IC Identification Module support"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 70a4464dcb1e25cf9116280a32f4a0f4f9941a75..920a536fc359a5a7d8f3aabba6a712e85c277ee7 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -20,6 +20,8 @@ obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
>  nvmem-bcm-ocotp-y			:= bcm-ocotp.o
>  obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
>  nvmem_brcm_nvram-y			:= brcm_nvram.o
> +obj-$(CONFIG_NVMEM_EXYNOS_OTP)		+= nvmem-exynos-otp.o
> +nvmem-exynos-otp-y			:= exynos-otp.o
>  obj-$(CONFIG_NVMEM_IMX_IIM)		+= nvmem-imx-iim.o
>  nvmem-imx-iim-y				:= imx-iim.o
>  obj-$(CONFIG_NVMEM_IMX_OCOTP)		+= nvmem-imx-ocotp.o
> diff --git a/drivers/nvmem/exynos-otp.c b/drivers/nvmem/exynos-otp.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bff9421e6f2b80a8f20533b490a289687d117e8
> --- /dev/null
> +++ b/drivers/nvmem/exynos-otp.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Linaro Ltd.
> + *
> + * Samsung Exynos OTP driver.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mod_devicetable.h>
> +
> +struct exynos_otp {
> +	struct clk *pclk;
> +	struct regmap *regmap;
> +};
> +
> +static int exynos_otp_read(void *context, unsigned int offset, void *val,
> +			   size_t bytes)
> +{
> +	struct exynos_otp *eotp = context;
> +
> +	return regmap_bulk_read(eotp->regmap, offset, val, bytes / 4);


So you are just reading MMIO and pretending this is NVMEM?

Is it possible to actually do the other actions from your commit msg
"read/program/lock"? If not, then you just created NVMEM abstraction
over existing chipid completely duplicating the driver (with more
translation layers).

Best regards,
Krzysztof
