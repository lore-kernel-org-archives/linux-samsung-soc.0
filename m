Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF28A78F4A;
	Tue,  4 Feb 2025 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693335; cv=none; b=t2uVRcaDkrLW2SGZfWBaNfVxiK7wjgkCPO55H1IUGFIA2tNu6rL/Oa6X5Hu21F2r8h5okq2f3evkeRhFAQbw5tyVL0y7OsyDDNPdV7hPYFt/L4R/0+j5g6/GmVR+CLHjScHkqQRgg5dVqWT9lFiTGfWWwyzB75inLZz5FO2qX2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693335; c=relaxed/simple;
	bh=2x1NwtHWAOEEICZyjoxoW/wEa4Gwmje6nQ9gTEczNFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8IWt+U0fKD+5Xa3WwGnb94W+isOTFbim58q/BAu+Fnc2v6fd0+BIUJHHUR7eqt0FPgfmnh178Kf7W9amddUUFhWqj8zUL1HrqjeCxJjBWD5MQZ39iDTYFgerJ30JHEBEtYD0rKwYJtAGl1X1qJg6y6fN4ij/t3TAkRqw/rsgCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfPSMemV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfPSMemV"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so10151226a12.0;
        Tue, 04 Feb 2025 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738693332; x=1739298132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQ5++agd0QoEY64Wz7u8d59Bv8ZNS8ggDIsozpgsnM8=;
        b=BfPSMemVl+PyVcgUDULcQQahPmJPCJBDszNqUvZ9IzTrRz5ITl7H3M3tD3cvD7sgAk
         SGdjQLVwnL5atirmfLA45nkD4lHuCCWWjrBswqA3IJNnnpgfWJ/BB6rMLNPbCGpy6mfY
         pi/J0Zl/oflSHcS0SL4/Sw05NIWtHvuqURTrV6b96K0AoUX8qABqlK2do+Kege/4/Pqn
         8XmYUfTMfkOzfwnMrhAAz/O9D5++zv2c1nop7xlgi2bq9WTzNmG65kf7vYFS43lexVM4
         FvT4thzxpTKSfyPn8DRUSOaX/g+hZj+QjVD7IfEKn7I6DcNj4p1M2V+z/iHQEUhC3r00
         1MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693332; x=1739298132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ5++agd0QoEY64Wz7u8d59Bv8ZNS8ggDIsozpgsnM8=;
        b=oXRtuNzBYLjK2KRkfOY0eb9IZFUR9iJonubYPa8UfiME66ACmBMu5+qNYZfHnMyJHU
         h/UVqb08Zn4x8sXM6WT3Y8iUzibhCRIicCd2r7/VTCvlupVMJ5DBjoyD2GhTc8Fr2LDJ
         14T/C6aWoZtImmhYHbhei0p9FlZTQXCh2QYFKWB/lveShWNj5sqzQfsVjBNEj08HnAN1
         +3GQsteVOM8kOuE7o4x+RnHaCD3gbAHfWIzk+VScFZgzR0G9iMEYSvPQpH2/DaJ1JSzX
         3pes5wi2fVqUyJ7I7s8J+3qEXJgH5DxcHYxtPb8f9EqrKgc3t7rJg+pV+R2lCgXGxu+S
         xKFg==
X-Forwarded-Encrypted: i=1; AJvYcCUHIASAciPVgu+YqXNFIKcHZPGWRWpNIJbZKmG/lb7FsAuBUeopJGz6xZqFW3ny8OQeJfD57uoRYCg6qdD/p7gU@vger.kernel.org, AJvYcCULVXup5dLR5jYEZpWea5Hsj6sY7jOYI93Db6llsjPSX6oXeY0MLbagOdy/SJvo/72PBCqBxfaqpLML@vger.kernel.org, AJvYcCWrUgWR/XzzlO1dnNZ0LnkZ+QKk128nqDw1moe09H9gJopBTk0ZPQkJ1Fsuo54tNWyIYocMtLqREL2hTta/@vger.kernel.org, AJvYcCXpr2nsXEsUlw87x5Pxr14YsCzt2YwUmlxzJ+eO6KaeVDX3d1ZsbBOkAav11cg6ubYOpwFMTVhWET/fKgQCZAqdIE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXdasgu21kiiUQiCmCnmHPRCUra5m9uaXtAYy7BlJnJCkCCrQ
	lccjBkaEbo6WFWdUbjy8NGPyGO7AMjjrNToaX22ViLJe2nVNmf7D
X-Gm-Gg: ASbGncuypZk37TCjd1W25ZISioyN0+6qm/ct67ldS5wxUKsAnMcM7I4prV45lqpFT39
	sH1Tx6gt7cmOkjj8zpmCVSSsk0F+zLJ/OIKckUgAA+oFizf+0JFt24R1+RW2z+KqbV9GZNP9VID
	JqiaCUXoQRqaiQP5YLB0sH2cVXRkfPz4artPmfkuo++jaXtXFDLFWUDqDsTgRJ+vJhcIJjAqVDe
	7EPSzZcXPEygQxN7SD82vIZmncnZgC5VuomJcRunEewQMEsUKsOg2ogbUJa6kPXK5zMtbqlrGId
	yAA4A2xm0Ym5YTDJqyVjOfAnbvw++d2rZ+yOMSACbui0jXvZ3Ipwe8fyBnTNiF+u2srmVw==
X-Google-Smtp-Source: AGHT+IEQ4DMWF7roCrp5EJD85FGwjsBCdu+Kca8lx2Hj1i97FM9pySSYNrsTVSCzOrQrFS6BR/FM0Q==
X-Received: by 2002:a17:906:9c8c:b0:ab3:3bab:c533 with SMTP id a640c23a62f3a-ab6cfcc2e94mr2804249166b.21.1738693331664;
        Tue, 04 Feb 2025 10:22:11 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2f90asm954865966b.129.2025.02.04.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:22:11 -0800 (PST)
Message-ID: <00aa901b-5de9-4b72-a157-c54ad29df458@gmail.com>
Date: Tue, 4 Feb 2025 20:22:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: add initial devicetree support
 for exynos7870
Content-Language: en-US
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
 <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 22:46, Kaustabh Chakraborty wrote:
> Exynos7870 is an arm64 SoC manufactured by Samsung and announced in
> 2016. It is present in multiple mid-range Samsung phones and tablets.
>
> Add basic devicetree support for the SoC, which includes CMUs, pin
> controllers, I2C, UART, DW-MMC, and USB-DRD.
>
> Co-developed-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
>  2 files changed, 1757 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..28ff409c4fdc5f766d92617ea2df7be2112c28d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
> @@ -0,0 +1,1035 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos7870 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl0 {

I haven't had enough time to look deeper, but these are my 2 cents:


Can you label them according to their block name rather than numbers?
For example, pinctrl_abox (make sure to keep them alphabetically sorted
as well).

> +	etc0: etc0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	etc1: etc1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa0: gpa0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa1: gpa1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa2: gpa2-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpq0: gpq0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	uart2_bus: uart2-bus-pins {
> +		samsung,pins = "gpa1-1", "gpa1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	uart2_sleep: uart2-sleep-pins {
> +		samsung,pins = "gpa1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	bt_btwake: bt-btwake-pins {
> +		samsung,pins = "gpa1-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	bt_hostwake: bt-hostwake-pins {

Sort these alphabetically, so you have:
all a-z-gpio-bank, after which all a-z-pin.

In this case bt_* can be first after all gpio bank nodes.

> +		samsung,pins = "gpa1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	gnss_sensor_irq: gnss-sensor-irq-pins {
> +		samsung,pins = "gpa2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	gnss_sensor_i2c: gnss-sensor-i2c-pins {
> +		samsung,pins = "gpa2-5", "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
...
> +		#interrupt-cells = <2>;
> +	};
> +
> +	hs_i2c0_bus: hs-i2c0-bus-pins {

s/hs_i2c/hsi2c/g

> +		samsung,pins = "gpm0-1", "gpm0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
> +	};
...
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..11129e37fc86ebaee01684ed6841c932dd6cbc8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> @@ -0,0 +1,722 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos7870 SoC device tree source
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/exynos7870.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,boot-mode.h>
> +
> +/ {
> +	compatible = "samsung,exynos7870";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	/* Samsung's bootloader (S-BOOT) checks for these DT properties */
> +	model_info-hw_rev = <0>;
> +	model_info-hw_rev_end = <255>;
> +	model_info-chip = <7870>;

You could skip the properties with a shim bootloader like uniLoader. Up to
Krzysztof to decide if you should keep these.

> +

...

> +	};
> +
> +	oscclk: oscclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +
> +		clock-frequency = <26000000>;

Frequency must be defined in the board device tree.

> +	};
> +
> +	timer {

S is before T, so this goes after soc {}

> +		compatible = "arm,armv8-timer";
> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +
> +		/* Samsung's bootloader (S-BOOT) doesn't set CNTFRQ_EL0 */
> +		clock-frequency = <26000000>;
> +	};
> +
> +	gic: interrupt-controller@104e0000 {
> +		compatible = "arm,cortex-a15-gic";
> +		reg = <0x0 0x104e1000 0x1000>,

So it should be @104e1000 and not @104e0000

> +		      <0x0 0x104e2000 0x1000>,
> +		      <0x0 0x104e4000 0x2000>,
> +		      <0x0 0x104e6000 0x2000>;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x0 0x0 0x20000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		chipid@10100000 {
> +			compatible = "samsung,exynos7870-chipid",
> +				     "samsung,exynos4210-chipid";
> +			reg = <0x10100000 0x100>;
> +		};
> +
> +		pmu_system_controller: system-controller@10480000 {
> +			compatible = "samsung,exynos7870-pmu",
> +				     "samsung,exynos7-pmu", "syscon";
> +			reg = <0x10480000 0x10000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "clkout8",
> +				      "clkout9",

Could fit more than one per line.

> +				      "clkout10",
> +				      "clkout11",
> +				      "clkout12";
> +			clocks = <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>,
> +				 <&oscclk>;
> +
> +			reboot-mode {
> +				compatible = "syscon-reboot-mode";
> +				offset = <0x080c>;
> +				mode-bootloader = <EXYNOS7870_BOOT_BOOTLOADER>;
> +				mode-download = <EXYNOS7870_BOOT_DOWNLOAD>;
> +				mode-recovery = <EXYNOS7870_BOOT_RECOVERY>;
> +			};
> +		};
> +
> +		cmu_mif: clock-controller@10460000 {

Sort all of these by address.

> +			compatible = "samsung,exynos7870-cmu-mif";
> +			reg = <0x10460000 0x1000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "oscclk";
> +			clocks = <&oscclk>;
> +		};
> +
> +		cmu_dispaud: clock-controller@148d0000 {
> +			compatible = "samsung,exynos7870-cmu-dispaud";
> +			reg = <0x148d0000 0x1000>;
> +			#clock-cells = <1>;
> +
> +			clock-names = "oscclk",
> +				      "gout_mif_cmu_dispaud_bus",

bus

> +				      "gout_mif_cmu_dispaud_decon_eclk",

decon_eclk

> +				      "gout_mif_cmu_dispaud_decon_vclk";

decon_vclk

Clock names here shouldn't be long. You'll still describe them in the
clock YAML either way. Check other SoCs like 8895, autov920, 990.

> +			clocks = <&oscclk>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
> +				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
> +		};
> +

...

> +
> +		i2c1: i2c@13880000 {
> +			compatible = "samsung,exynos7870-i2c",
> +				     "samsung,s3c2440-i2c";
> +			reg = <0x13880000 0x100>;
> +			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";

Status always comes last. Make sure to sort all properties as per the DT
Coding Style [1].

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c1_bus>;
> +
> +			clock-names = "i2c";
> +			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
> +		};

...

> +		};
> +	};
> +};
> +
> +#include "exynos7870-pinctrl.dtsi"
> +#include "arm/samsung/exynos-syscon-restart.dtsi"

Didn't this already include a reboot node?

Best regards,
Ivaylo

>

