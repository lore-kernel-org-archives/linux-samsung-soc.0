Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE62F41;
	Wed, 19 Feb 2025 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739961293; cv=none; b=hQnqbSohY723KuV6jtXy0byPm4tZyUdGKJPeb6g7aMrbP6q+6LcVFWNE9EEem3jSDEA/XNHAGOtwrf4mZeLk6EyZws4J382LoubsIeokUUnzcub6pRqXghWlnhZjgiu5kzKQLasIIy1Chs7hxIT/E4SIiwX0sYd6vETvNu6i98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739961293; c=relaxed/simple;
	bh=9Ub+E5wMUiJzaBLWqqi6gei1gnHLU8PLO/WLmDQvMEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8CfmJ6cbSFQirGK/nDig3YxvHnN9RV+7QcGtlbil+lWVzkr9tDAIMl9hsXAqcIBjQQp7oaYINAVHE0LfeNSHAC5HURTtYd3n3YqN49dGwWBeuOECMU7X719g39ZGJb5ogzG8XRLJ9xCjV9fwUf0/YJpHsOjc40wdfXG4J74QM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C825z0XG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C825z0XG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43995b907cfso10371815e9.3;
        Wed, 19 Feb 2025 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739961290; x=1740566090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vW3Mq6FmuxLxhnil1RMWEPl2NZrnvIFyftaR5qP/us=;
        b=C825z0XGYFrcLxMqiqI2vYsrFJgt0rcriJ9sZLTfZ6DRcaVzZqtKOzs5TJgt9EYbYr
         bzgn5hjP9tn2Cb54gTmaz67yMgRW/7HogqnwNxVLqoABg+RGQSq2fyjEmZE3LYScinMx
         xH0xD0REEOK/lAFXwK1pB0HpJ3xJofsQax/M3ix4mljhMQlmz810DuM9b+5q+PgYenVW
         MzOw5QYeKbjB4dtMw2f3q5pmsHmjuTHhMJ3NDcH2WkwUg/3UBwOI0+LcdFlQXR8wsJqe
         rNb+CVnsSOMfULWcvH7F6FlSsMJWaYfOnVLwO8b6O+wOIR5sTTLHl1wEzAYNT2mskjaU
         OwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961290; x=1740566090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vW3Mq6FmuxLxhnil1RMWEPl2NZrnvIFyftaR5qP/us=;
        b=oS23HCa4M8AzmC6P+2rGr7Qw/3qrhvd2+CBYRDTT4YRMKjI11N1oiOYQ4TCLR4auqV
         jF3yw/rc4tHU/+vuOyLXKCE2CNpcI68krnhDF2qjDR8vHVFhM18b6P/AHLE78UvERQNV
         aeQZ/Km3bPwgYwfOBF8GIod6PnzVf5b6Rl49dEP4WNy70ZUF3zMkv2EOQFxImLjSLLdU
         HsB0vrWf8navwPHKGN73AUYna7/sb77lFsRaAaQPxAjp2peZmbvBtlbYVPVxd6n2o8wN
         CUUngemFQGHZ+8pjc/22mfUJ51nHnce24SxehWrVxDc6plU11DG0p8nJx8qE+8uun0UV
         GsLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+b/btd/klnvuGcQ2B61FODCJRdNThWPUhZIBPhcXHPhUb8Bn+UtYUA8k2V+/2CNjw0+JJdgjFk4jF@vger.kernel.org, AJvYcCWnVBbd8RV5gwJcE9wmrCQB8XoDqCo5DIdpFAh+St30FPJLg6LbqscqQdpPtrtp+OjmkabmkAfonr1CvSko@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8nmt1vby4Be8wujknkSfQgGjRmtsR+49gLXf6BYgqKXufXsN
	dVSARcP7qKxR6laVOQIsYQC0/hw8fonAnu0UQx1O3Kq/Vccay8rV
X-Gm-Gg: ASbGncuiua4RCWoEmob1KVVX+ShKkUZInTv8puFc/iGTxDAJZXKteonp2UOofQCTFPy
	1HxN0s4FMWFR9ll4+l9sGmB70sedUlfw+XOLAqNYdlXd+YmQeCZELrDLrfFLC2guS1dpYEFgqME
	dUEOHV1g9NF0xxvq9HE8SkFFc/qHGAYr2j+bDxnxrRp9K8VPLixOpMCxINTt4NLvDc++nusxE1W
	DJAQyULtFBWKeAknf9QPEYXVL8WfzDFlBXZx6XUawOXSghCn7EQ0cyZSMFJjNmR0AsIS2oOy4XR
	g1BO+iv/jg8QMKYHgBYfJ6yIxN3fLC3K27MNZTEClFCXI1kEkS8Z6Mhr
X-Google-Smtp-Source: AGHT+IH8omL6HrDnxAeU3OszfLwGA6mXMUbGoGbtQrSkt2R2L/0PJO2LLFU+a6jkdDY0idhFewAIbQ==
X-Received: by 2002:a05:600c:1d27:b0:439:9e8b:228d with SMTP id 5b1f17b1804b1-4399e8b2474mr7936925e9.19.1739961289921;
        Wed, 19 Feb 2025 02:34:49 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b59e9sm76783555e9.31.2025.02.19.02.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:34:49 -0800 (PST)
Message-ID: <451d52cc-ccb7-44ae-b6c1-cd3ab65465c1@gmail.com>
Date: Wed, 19 Feb 2025 12:34:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: exynos: add initial support for
 exynos2200 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215130500.170738-3-ivo.ivanov.ivanov1@gmail.com>
 <675ddbf4-dfeb-48dd-b48a-466bf2888ce5@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <675ddbf4-dfeb-48dd-b48a-466bf2888ce5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 10:41, Krzysztof Kozlowski wrote:
> On 15/02/2025 14:04, Ivaylo Ivanov wrote:
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> new file mode 100644
>> index 000000000..645a31d46
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -0,0 +1,560 @@
...
>> +
>> +	ext_26m: clock-2 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-output-names = "ext-26m";
>> +	};
>> +
>> +	ext_200m: clock-3 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-output-names = "ext-200m";
> What do these two last clocks represent? Where are they?

External crystals, apparently. They aren't passed as phandles to any
other node in the vendor DT, so I'm not really sure what samsung
would use them for. But they're described, so I assume they exist.

>
> I see we have them also on Google GS101, so same question there :/
>
>
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&cpu3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu = <&cpu4>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu5>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu6>;
>> +				};
>> +			};
>> +
>> +			cluster2 {
>> +				core0 {
>> +					cpu = <&cpu7>;
>> +				};
>> +			};
>> +		};
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu1: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x100>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu2: cpu@200 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x200>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu3: cpu@300 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x300>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu4: cpu@400 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x400>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu5: cpu@500 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x500>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu6: cpu@600 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x600>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu7: cpu@700 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-x2";
>> +			reg = <0x700>;
>> +			capacity-dmips-mhz = <488>;
>> +			dynamic-power-coefficient = <765>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&prime_cpu_sleep>;
>> +		};
>> +
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			little_cpu_sleep: cpu-sleep-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <70>;
>> +				exit-latency-us = <170>;
>> +				min-residency-us = <2000>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +
>> +			big_cpu_sleep: cpu-sleep-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <235>;
>> +				exit-latency-us = <220>;
>> +				min-residency-us = <3500>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +
>> +			prime_cpu_sleep: cpu-sleep-2 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <150>;
>> +				exit-latency-us = <190>;
>> +				min-residency-us = <2500>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	pmu-a510 {
>> +		compatible = "arm,cortex-a510-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
>> +	};
>> +
>> +	pmu-a710 {
>> +		compatible = "arm,cortex-a710-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
>> +	};
>> +
>> +	pmu-x2 {
>> +		compatible = "arm,cortex-x2-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		ranges;
>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		chipid@10000000 {
>> +			compatible = "samsung,exynos2200-chipid",
>> +				     "samsung,exynos850-chipid";
>> +			reg = <0 0x10000000 0 0x24>;
> All numbers in hex please:
> s/0/0x0/

Alright. Will fix, thanks for the reviews!

Best regards,
Ivaylo

>
>> +		};
>> +
> Rest looks good.
>
>
> Best regards,
> Krzysztof

