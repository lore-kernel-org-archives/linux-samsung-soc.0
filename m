Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950111DF73E;
	Wed, 19 Feb 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739954480; cv=none; b=T0CqL9UoVarxGz92IzJXuJEVDxVy1yQpRhgWuQSjetYGTRm/UQxWjjy3gHFobC4lj8PdsArJT2NBShMxrxja1KI+s3RgJ6Kf/RQEXG5YMCokMPWgymUk/IQODa5nOVwaa6fHCjUMH5lR7sfGmaIR/zMyuwBz6+l7TW25jASGbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739954480; c=relaxed/simple;
	bh=AWxFIxSuM9UaTpKU/0MoKHzcPWlerTByo5D5vqmvIfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO89lntoQooXZbClSHm4sT9HrfhjuabhrCcqNXWfO8WCSlo+LRS8n4MDBYcde0bjIOGVE2odcMdfNrdfx2Hc/YeOP/NkHG6djEsyDFbmf7QfbR1utPQYVGwbKDoK6xhus106TTvdZHb+ehAsl/dWLZgjvL+HRZzALhIJZEN67UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIijJnw0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIijJnw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E12FC4CED1;
	Wed, 19 Feb 2025 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739954480;
	bh=AWxFIxSuM9UaTpKU/0MoKHzcPWlerTByo5D5vqmvIfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kIijJnw0ape2lmf/Jq93R6AJ9h5NBudnmJkGi7ddXqnfyBHZtA3OulmrggyTs0KLJ
	 atypGe1XFkxd7+e/COEQZKv9qAuSwVgqUd2BFnlKd8ym0PYQexi1r5/L0q+OU/TFsE
	 ejET0eFwVw7tj+COfoq6vDFBWrnkz/R5ny72Iu/vT0iwCptwab1zflYjJhLB/nlkzw
	 ykTstCIb+hJAFJMPnFP8dKjB1SFQ062nUXcfFT16++cmomNDhGvyS5ryHaCLYaHDM/
	 oc2uhcJMluJ8WfLgk9RbKVkwnl6zjE/rS7VyXSy6rzHDJ3zqVWPI7OxltYLYSp1BNq
	 878I90C7zkhZw==
Message-ID: <675ddbf4-dfeb-48dd-b48a-466bf2888ce5@kernel.org>
Date: Wed, 19 Feb 2025 09:41:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: exynos: add initial support for
 exynos2200 SoC
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215130500.170738-3-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250215130500.170738-3-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2025 14:04, Ivaylo Ivanov wrote:
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> new file mode 100644
> index 000000000..645a31d46
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -0,0 +1,560 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung's Exynos 2200 SoC device tree source
> + *
> + * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/samsung,exynos2200.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "samsung,exynos2200";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_alive;
> +		pinctrl1 = &pinctrl_cmgp;
> +		pinctrl2 = &pinctrl_hsi1;
> +		pinctrl3 = &pinctrl_ufs;
> +		pinctrl4 = &pinctrl_hsi1ufs;
> +		pinctrl5 = &pinctrl_peric0;
> +		pinctrl6 = &pinctrl_peric1;
> +		pinctrl7 = &pinctrl_peric2;
> +		pinctrl8 = &pinctrl_vts;
> +	};
> +
> +	xtcxo: clock-1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "oscclk";
> +	};
> +
> +	ext_26m: clock-2 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "ext-26m";
> +	};
> +
> +	ext_200m: clock-3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "ext-200m";

What do these two last clocks represent? Where are they?

I see we have them also on Google GS101, so same question there :/


> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a510";
> +			reg = <0>;
> +			capacity-dmips-mhz = <260>;
> +			dynamic-power-coefficient = <189>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a510";
> +			reg = <0x100>;
> +			capacity-dmips-mhz = <260>;
> +			dynamic-power-coefficient = <189>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a510";
> +			reg = <0x200>;
> +			capacity-dmips-mhz = <260>;
> +			dynamic-power-coefficient = <189>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a510";
> +			reg = <0x300>;
> +			capacity-dmips-mhz = <260>;
> +			dynamic-power-coefficient = <189>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a710";
> +			reg = <0x400>;
> +			capacity-dmips-mhz = <380>;
> +			dynamic-power-coefficient = <560>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&big_cpu_sleep>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a710";
> +			reg = <0x500>;
> +			capacity-dmips-mhz = <380>;
> +			dynamic-power-coefficient = <560>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&big_cpu_sleep>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a710";
> +			reg = <0x600>;
> +			capacity-dmips-mhz = <380>;
> +			dynamic-power-coefficient = <560>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&big_cpu_sleep>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-x2";
> +			reg = <0x700>;
> +			capacity-dmips-mhz = <488>;
> +			dynamic-power-coefficient = <765>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&prime_cpu_sleep>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			little_cpu_sleep: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "c2";
> +				entry-latency-us = <70>;
> +				exit-latency-us = <170>;
> +				min-residency-us = <2000>;
> +				arm,psci-suspend-param = <0x10000>;
> +			};
> +
> +			big_cpu_sleep: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "c2";
> +				entry-latency-us = <235>;
> +				exit-latency-us = <220>;
> +				min-residency-us = <3500>;
> +				arm,psci-suspend-param = <0x10000>;
> +			};
> +
> +			prime_cpu_sleep: cpu-sleep-2 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "c2";
> +				entry-latency-us = <150>;
> +				exit-latency-us = <190>;
> +				min-residency-us = <2500>;
> +				arm,psci-suspend-param = <0x10000>;
> +			};
> +		};
> +	};
> +
> +	pmu-a510 {
> +		compatible = "arm,cortex-a510-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> +	};
> +
> +	pmu-a710 {
> +		compatible = "arm,cortex-a710-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> +	};
> +
> +	pmu-x2 {
> +		compatible = "arm,cortex-x2-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		chipid@10000000 {
> +			compatible = "samsung,exynos2200-chipid",
> +				     "samsung,exynos850-chipid";
> +			reg = <0 0x10000000 0 0x24>;

All numbers in hex please:
s/0/0x0/

> +		};
> +

Rest looks good.


Best regards,
Krzysztof
