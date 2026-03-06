Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DFC39A7F6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806549; cv=pass; b=ACsZ4+03gxgypL95gWFFIMvJI+yGXY+GoIaiKNFZvgRvNtwIOayCsqPl10GCWcmsjpolhhRlV/ToWHquGsks1OKwHTgUA+MJcaQlTH1C19uO0/JtkQRfUvHJteUqJ97LnodSlWbdRMyWkbooaayi8DfffiTgsvtJGeC0taD5TYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806549; c=relaxed/simple;
	bh=/CNVAqyXaUIfUUqCRxD9C1JjNw55xKz/vRPOZSl7GJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo3n1XUkd8isNgJq/87yoloQPq4F1Xb8kYI5YS9dRbD3rhsrltzzwwlc4tle+Te2Ukx5XBhVsWHx32trfuI0IByibb5A0/akYy49GmjNph2jnYuHjaWBmqiUmvsWehI9fdb4cOafu8c+XVG7nB/8d3gQvDR5hh37vGJriv7zGNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jl6E3cPK; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jl6E3cPK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b94358796a1so62646766b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 06:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772806546; cv=none;
        d=google.com; s=arc-20240605;
        b=cTWQw4+y2NEt2vHxjrFmMAf+xt1/RNVF/1vCcW8hEZWCGM3eA6Ntc3bAhXmda+uxp3
         B0Q+cRe3dgPk2jxfAg/pFKy108znv9tZEr6JDavkDbdp/vwUEJWc5tV/MwDvmAJ67FtV
         tb4RVM2Y8Ps0rSxxKZyTWRoHb49Pa3vIaK5iRSLkmmHd/EEv7Yolti1Ti/d3KB603/09
         Hkv3SzQSQX7QnpAEuyZwlGdnpljey/xatQqlS+VAkLhOd7HNiYHJQ1FVFaXpPDE2ieaw
         Sd96e/Cx2GCxrfpnIC322L2EcXTlyfAQGEAR2K9A95oRUzETpuIsBhFU9tINPOI3SP0I
         WZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        fh=Ym/o+WqacVFyRg8aXZ2KZC8bbTBjppYIU8p++2t0I6Y=;
        b=V7rDfjdfs/t2QxVgFx9Nql5K7aF71d8vVHQwFjNSkPukLaUnPpW1T1shPJ0TKYLWfM
         zW3okiVnKb77bHEAkhHrB3f9eJhIVVJVyFzNyXxCMHR385CrO/o7Kv+e/bSh32DY2FVh
         YYMiwVx5d3yWBTfhMvv9Qjdlpw+T82KQwL6pAvoFhnPht9MLJjUTI4+He/5PsUuvra8g
         tfzUXbXPePcqsNHriZXyMMKBnWQ+mavEkdlWYPxItsJeKdmXTVAvglOCVy4ZT04fD7cD
         P+EPxTv75drkJea9SIEWrm2txCNe8VddqU0C1SVIZskGcX3BKIEAVQckW0fZ8wI9HJWP
         gZwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806546; x=1773411346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        b=jl6E3cPKwMLcgrUoQcYYeX9PFFVNM+9eYnCaHYYlPErjUS057w/kMgsnrbeg/DyjOj
         UovjPAGCRO9mXn5nXAbwyF2J6XioT3xh6L2RcKtcr5PafeLYV1xUV0ASsuL6jxS4XYx0
         TzBGjZLmb0Pl8v5dPnREbLEs5pkwfL79KqML4kvF0BmZfDBeVCm8OrUsR80TZ95ejvcD
         I0897M0fkyyJi6C6T1OvUyOodGSoZOq6NZemts/7U0BSvkwEr8IPHR9pQkxnMtMs19Xe
         ucvrVyYwgxMaUM8wXayohTwSKYloQR3gp8hjgOPlljIZcVFYsLAjZaVw2vCasHRPZeHs
         /Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806546; x=1773411346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsd9xHQXwG0L/peVfvTrqZYVlLBD0w3lIYpT1q/1u0k=;
        b=ZarhNIj3JDZA6EpZpJiTxvIUIcX7eytCFwX8C5mxHQ6hzvO/y7izn73bzmZg7T75E1
         VRHHGf5weLs8OBpEMSeaZqE2+G3TQ3D6EybCJjZ+armV0nIGOPjiolJ2KFudnweo1+3Z
         d0WftBGE6AcvT6ciF9Ofbr4GxpJlXCW8WUQZmR0529mFTVVs7zZVyDLyjkm257rK/YzU
         sViVMhl93XQy3XT+qORPdJ0EUn9mqAwrKwVcI5iJlFowL+Q2rWFh3qHClETEo+uMHDhN
         m6Wv1Jg6Eu/246ScCPz4oxtYXZkNuwB471oSQIbPyI202vBQIPS0O3y/r7vQ7HRFkwOD
         0C4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh7xzGsn9CCJJZPpplm13jizmpfTuZbGnewgWWU6b8H7Wm/c4mDwfCpIGebeBZq5421nqt33M+PpKqy/kAlEf6FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyCxi7DxJEYfyo1h0W/sVRcDOceyqcNaHB0Mo1R25euc+k5HF
	PLYjaQiWpGZ6013N/juN3aoQWkWGO2mCTTSEigtC+VHlYAMjvwDxdDE5b/6hSUbh0qsdlS4GkRs
	JYxnSSxpBkopzAVpl6NsUCbPUtuv9RmWJxskEfwb5ug==
X-Gm-Gg: ATEYQzzdZtXkTdtUTjC/zpdDqDMMlSfycRc4+queb9Wtvv0f6eNu/r1EEGgI67TWjDj
	NgN7IiMc4PkGwGnpUs1ro+Gpm4qPXohfbzlSksHp8EDHxo5lMFqU9gfcUJ3BuSqkLIRTg7Ccfi0
	+h6zhXC3LBR/Om9yGEwn7EB5iFk7fS7CxZnHIsrfVtxN6eA4GWuIoVH5aDFKuzkX1HwsiC1FwL/
	/cXieL/RuAUjXWfjNRrvSygbwhGsE3BnKedZz7cs0mOE8WWvmj1WPimIcuxxinTsa3SHOTGZfRB
	k1ZazSfD43FZoLEYjk63ACz07Z+iT94ncMFi5bD1ag==
X-Received: by 2002:a17:907:97cc:b0:b94:1722:fe4c with SMTP id
 a640c23a62f3a-b942e0b51aamr127144266b.33.1772806545787; Fri, 06 Mar 2026
 06:15:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:15:34 +0000
X-Gm-Features: AaiRm50_59W0lqO5S3dEhyJtxjXmMUrxStP6qFX90WC4mn1HuOypqUtemGTXM44
Message-ID: <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>
Subject: Re: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Thanks for your patch.

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Some Exynos-based SoCs require specific set of writes/updates to PMU
> and PMU intr gen blocks in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF.
> The same is valid for a reverse procedures like wake-ups or CPU(s)
> online. Without these writes/updates the CPU(s) wake-up or online
> fails.
> Add support for Exynos850-based SoCs for PMU and PMU intr gen write/update
> sequences.
> While at this, also add description of Exynos850 PMU registers.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c            | 86 +++++++++++++++++++++++++++--
>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>  2 files changed, 87 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 0967fa56708a..7b9b8e22d91b 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr = {
>         .use_raw_spinlock = true,
>  };
>
> +const struct exynos_pmu_data exynos850_pmu_data = {
> +       .pmu_cpuhp = true,
> +};
> +

You may want to consider having an e850-pmu.c file to contain the e850
specific data and hooks.

Andre recently moved some of the gs101-specific parts into gs101-pmu.c
(although not the actual gs101 online/offline hooks). Now that more
SoCs are being added it could be a good time for exynos-pmu to contain
only the generic code and the <soc>-pmu.c file having the
peculiarities/hooks for the specific SoC.

>  /*
>   * PMU platform driver and devicetree bindings.
>   */
> @@ -151,6 +155,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
>                 .compatible = "samsung,exynos7-pmu",
>         }, {
>                 .compatible = "samsung,exynos850-pmu",
> +               .data = &exynos850_pmu_data,
>         },
>         { /*sentinel*/ },
>  };
> @@ -229,6 +234,65 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  #define CPU_INFORM_CLEAR       0
>  #define CPU_INFORM_C2          1
>
> +static int __exynos850_cpu_pmu_online(unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +       u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* clear cpu inform hint */
> +       regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +                    CPU_INFORM_CLEAR);
> +
> +       mask = BIT(cpu);
> +
> +       regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +                          mask, (0 << cpu));
> +
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
> +
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       regmap_update_bits(pmu_context->pmureg,
> +                          EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +                          1 << 3, 0 << 3);
> +       return 0;
> +}
> +
> +static int __exynos850_cpu_pmu_offline(unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +       u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* set cpu inform hint */
> +       regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +                    CPU_INFORM_C2);
> +
> +       mask = BIT(cpu);
> +       regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +                          mask, BIT(cpu));
> +
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       mask = (BIT(cpu + 8));
> +       regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +                    reg & mask);
> +
> +       regmap_update_bits(pmu_context->pmureg,
> +                          EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +                          1 << 3, 1 << 3);
> +       return 0;
> +}
> +
>  /*
>   * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
>   * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
> @@ -416,8 +480,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>         void __iomem *virt_addr;
>         int ret, cpu;
>
> -       intr_gen_node = of_parse_phandle(dev->of_node,
> -                                        "google,pmu-intr-gen-syscon", 0);
> +       intr_gen_node = of_parse_phandle(dev->of_node, "samsung,pmu-intr-gen-syscon", 0);
> +
> +       /* Fall back to the google pmu intr gen property for older DTBs */
> +       if (!intr_gen_node)
> +               intr_gen_node = of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
> +
>         if (!intr_gen_node) {
>                 /*
>                  * To maintain support for older DTs that didn't specify syscon
> @@ -427,9 +495,19 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>                 return 0;
>         }
>
> -       pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
> -       pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
> +       if (of_machine_is_compatible("google,gs101")) {
> +               pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
> +               pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
> +       }
> +
> +       if (of_machine_is_compatible("samsung,exynos850")) {
> +               pmu_context->cpu_pmu_online = __exynos850_cpu_pmu_online;
> +               pmu_context->cpu_pmu_offline = __exynos850_cpu_pmu_offline;
>

There should be no compatibles inside probe (that rule applies to all
drivers & subsystems). Instead use the driver match data
(exynos_pmu_data).

regards,

Peter
