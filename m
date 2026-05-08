Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DBC3CCFA8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272639; cv=pass; b=BktqyIGw7c0pcj4js6ahcNpOJji2FDnnDII/8UJKfUDAvdm+Vet6WJFWq0j/pAdjtYNNDxXnAStujk2JSTGmyY9jNmb6tfHSq/uettrB92ML8Lbds9eW4tnK2lmqixJ0RHyIgUNh51hWsaRRMR0RYrANhlCmN7aTwY8uzivQc3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272639; c=relaxed/simple;
	bh=Fvv0vDducwpyaRHo4SKqVuJGCrqP1O8ARjyy/ZF6F1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0APst0r5LjGHkcFPyaxn55wDqbdcNs0UgDnE90RhxqMc1zItQ5T4cVGfQZ1j7p1f/ZQzjLuSugyKWv4BTFI8eI3bCJEFrHsBtO8lokQuLSA6nD9Kd2WdQL8XMTp6riVAMYDXuAYkLhp5bu61nFJ/aDA9//k7/qabdyH3RDOKaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAeKOzco; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAeKOzco"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso4048356a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 13:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778272636; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWA6Bs4YaeTnHwEqjap1Fo63S59T9eNijfVSGQ2BK3yQNU929Aigjmop2lWSWiXj7H
         vulydf48J4ILKWn7uhO8UL25OhTMAooQsirlZAdMNsLiWl/MNjbkLdJTonnC6/1CeEbP
         C7lQdcJpxb8zP5Akt0LcoKGyNL80aIXnBT9uV4EAwCBD8Dayysp5RsREmeka0FvJ1xSK
         DuWxOupFD9aJ2DPCJGqc0t8y4VFca+MhWsw2G0p2pmi8QjhDhpXa7t5QAz7oFvBCReES
         xEZs0NGstkpjgUulaTqW98k8o8Jg/3bkRMTv8iZEZy3QtApqN0iqe80Qq7GRYjn7tzLY
         WxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vya27Z17NqK1C/nX3c58Ts5S2yWSMhK88Ygp9qs1+ao=;
        fh=KlUtfvZt+eHRnE6k2SF6oIYono3l3vxcrjpByT5AFvQ=;
        b=Li/XzQEXW5XVA79HIxRQtD5yrdZGrdrzItY80A/mGpszbr+Iz0vRjr4CkpziqS+6xa
         dFtExM5DXVmtwfdByP1B52TcSNHWA4y5lQjf5e1nqQXyTteSotUxmOIx6YpI0XC7YQP6
         FaN+3nksHTtGVhZSURmW0gQFp+xUZX8dUThcH4J+CC0FVoVEkbr2U5IGIBQ0QFzI2s/N
         +l+Kqwddu5JJC447VokUCBE/c6IYCK+cQdpWuZVQlqOEbCncbBhyMfzecdaXpmYkW1ln
         lGUt5OtczecpBXZNg3sDUr3i3owYXR8k1ljnI0VGB0fw+jylKxzgZakpnmRg3X6C1eeA
         1Iew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778272636; x=1778877436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vya27Z17NqK1C/nX3c58Ts5S2yWSMhK88Ygp9qs1+ao=;
        b=IAeKOzcoZStQVlQMQz2Qlp0N/fW50xd9jRtqzY+zB31aCIkkcnZeLyIHvtMzMoHB/l
         i3WhsfBKYevuBUpsn98y6fQus7wHol54ibh8OfwaVoXzK6ejn4feI+4rlJ/ycDmqfMZT
         9i+Z7Tjy0fpSI3KIRQkDcvUDc2/4D71grS2UJO8wYiTSqQtz2XG8uFO3DwUtsAGwwRhW
         5bxQMErVkZDTwXcbfPQFFUqdjG5GnFki3lb0glX0ZLq400Kzm3TIL76c+ltxz7nCxKeL
         ozHN8kzXIAxSOpk3wM6MRUfTyVBrPC+LmyIMm8jeBZPv/HK8q6LGgqRBMoFrVb+0B7wp
         OmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272636; x=1778877436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vya27Z17NqK1C/nX3c58Ts5S2yWSMhK88Ygp9qs1+ao=;
        b=ChhuvoUQ7jncImir4Iukk009j0e9zJHshG6PXEfNQhF+l+7+1oDUOH9mcbbGvvUPaQ
         XDYmnXBI5o8qxZiXV2rleSNQ+lRxWyqb0gd/ow6gt7pFoiykbyqs6vAq9mOkCLUgHyzJ
         wiWnzFXq1lFSH3/8hiMqzXdOZ9Mz52CRrrvzqLoXkFpqSZ4yQJ8qW7fyCOFlJsTSbMo1
         YwMVmEMBiq9WYEBWOwIoiZpZux3J8bTmZZIL4xBykbYV9nlzUvsVZYhnkQdQOi8kIx7H
         RH68OWk9KO2M+9KuYDKtI2kB0LgbkhOqghP/wwzTMBr9Bn2E9yljOq/N9Nsm0+CU4Fuf
         Kkrw==
X-Forwarded-Encrypted: i=1; AFNElJ832hg/5UTjPdCL/AuhHDN5uraL/LgdnUE8h9xGwB6lNjPzHJAFKrLnH4Y9x4ogqK7bgW8Vz9BRch3OuKrMryjzXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Hi+oEQ2do3GNyzUmZDsJCLxFvOf/m2669uo+KTSk4CjMubjX
	fID1oKu6DrpNOS2yA158YWsffWvt2apv8p3zJNIDyHwkgGVag40Ct4oRDN+xFKvuUhe+ep4mJOd
	P/pwVHXPOiXid2EVaTxdBpPe+qyglg9oaXu3CQgOVZPdniRO29AqighM=
X-Gm-Gg: Acq92OGLKCUw3ind+Sw3Vgd8ZYA3T/nLn4H+W3kbzKWf4OpJz6F4GuHbR0VnoXtOeF3
	zt1eOE9I9iRP1/G1FNzzGMHKRWWicg+WTZ2ut3BJqCLhhCKOu0mi4XunVwS71Saolcbv3iu6AOI
	VNEUxO9zPe0WbuC+DNKUYaE7DvQJ3fbCXRwG9dvse7xrplQ0hcrYeSDxW21M8mz9KReDez4976S
	53OmhEHWiLOQD2R7IBbnduMqgJ8Xhzp675q5Utq0Ew+AmP/0Gvl40nAxNZuIB4Wz7eTkDaH1YqQ
	m8t02qOJ+AKvYqOstZz0ZXPg0EpfTBN7dxokUBpAMM7K55/yCIQnHMyjuheHawY=
X-Received: by 2002:a05:6402:4516:b0:678:edab:6f40 with SMTP id
 4fb4d7f45d1cf-67d638b17c2mr7648390a12.4.1778272635895; Fri, 08 May 2026
 13:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-3-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-3-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:37:04 +0100
X-Gm-Features: AVHnY4L2QHGgWCBX2Y-yjxyRTm5FUL7ePwIP-OAPQsettndRpyboFNS8-btgZD4
Message-ID: <CADrjBPrjN8Hn=eiKjk-YN+BAcnbyyPpdDxZe2c6jtS-CWNwj0A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Thu, 30 Apr 2026 at 02:56, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The cpuhotplug and cpuidle support for GS101-based SoCs which
> utilizes GS101 PMU interrupts generation block can be generalised
> to be (re)used for other Exynos-based SoCs. Also, the GS101 PMU
> interrupts generation block is not exclusive to Google GS101 SoCs
> and should be made more Exynos-generic.
>
> Specifically, apply the following changes:
> - rename gs101-specific calls, structs, names to be exynos-prefixed;
> - move exynos_pmu_context and CPU_INFORM_* defines into exynos-pmu.h;
> - introduce cpu_pmu_{offline,online} callbacks in driver-specific
>   exynos_pmu_data which can be used to hold PMU and PMU intr gen
>   update routines for different platforms and update cpuidle and cpuhotplug
>   support to use them;
> - add checks for the presense of cpu_pmu_{offline,online} callbacks;
> - move and rename gs101-specific cpu{offline,online} PMU updates
>   routines into gs101-pmu.c file, also removing underscore prefix;
> - update gs101_pmu_data to use newly introduced callbacks;
> - rename PMU interrupts generation GS101_INTR_* regs to EXYNOS_INTR_*.
>
> This allows other platforms to add cpuhotplug and cpuidle support in
> a similar manner, using their own platform-specific PMU and
> PMU intr gen update routines.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

It's nice to see this being extended for other Exynos SoCs :)

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested on Pixel 6: -
* CPU hotplug still works fine
* CPUIdle C2 idle state (which requires the ACPM hints and code paths
renamed/moved in this patch) are still functional

regards,

Peter


>  drivers/soc/samsung/exynos-pmu.c            | 118 ++++++----------------------
>  drivers/soc/samsung/exynos-pmu.h            |  31 ++++++++
>  drivers/soc/samsung/gs101-pmu.c             |  57 ++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |  10 +--
>  4 files changed, 115 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index d58376c38179..660416c0db43 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -24,22 +24,6 @@
>
>  #include "exynos-pmu.h"
>
> -struct exynos_pmu_context {
> -       struct device *dev;
> -       const struct exynos_pmu_data *pmu_data;
> -       struct regmap *pmureg;
> -       struct regmap *pmuintrgen;
> -       /*
> -        * Serialization lock for CPU hot plug and cpuidle ACPM hint
> -        * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
> -        * flags.
> -        */
> -       raw_spinlock_t cpupm_lock;
> -       unsigned long *in_cpuhp;
> -       bool sys_insuspend;
> -       bool sys_inreboot;
> -};
> -
>  void __iomem *pmu_base_addr;
>  static struct exynos_pmu_context *pmu_context;
>  /* forward declaration */
> @@ -219,44 +203,8 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>
> -/*
> - * CPU_INFORM register "hint" values are required to be programmed in addition to
> - * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
> - * This is required to workaround limitations in the el3mon/ACPM firmware.
> - */
> -#define CPU_INFORM_CLEAR       0
> -#define CPU_INFORM_C2          1
> -
> -/*
> - * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
> - * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
> - * disabled and cpupm_lock held.
> - */
> -static int __gs101_cpu_pmu_online(unsigned int cpu)
> -       __must_hold(&pmu_context->cpupm_lock)
> -{
> -       unsigned int cpuhint = smp_processor_id();
> -       u32 reg, mask;
> -
> -       /* clear cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> -                    CPU_INFORM_CLEAR);
> -
> -       mask = BIT(cpu);
> -
> -       regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
> -                          mask, (0 << cpu));
> -
> -       regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
> -
> -       regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
> -                    reg & mask);
> -
> -       return 0;
> -}
> -
>  /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
> -static int gs101_cpu_pmu_online(void)
> +static int exynos_cpu_pmu_online(void)
>  {
>         int cpu;
>
> @@ -268,20 +216,20 @@ static int gs101_cpu_pmu_online(void)
>         }
>
>         cpu = smp_processor_id();
> -       __gs101_cpu_pmu_online(cpu);
> +       pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
>         raw_spin_unlock(&pmu_context->cpupm_lock);
>
>         return NOTIFY_OK;
>  }
>
>  /* Called from CPU hot plug callback with IRQs enabled */
> -static int gs101_cpuhp_pmu_online(unsigned int cpu)
> +static int exynos_cpuhp_pmu_online(unsigned int cpu)
>  {
>         unsigned long flags;
>
>         raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
>
> -       __gs101_cpu_pmu_online(cpu);
> +       pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
>         /*
>          * Mark this CPU as having finished the hotplug.
>          * This means this CPU can now enter C2 idle state.
> @@ -292,35 +240,8 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
>         return 0;
>  }
>
> -/* Common function shared by both CPU hot plug and CPUIdle */
> -static int __gs101_cpu_pmu_offline(unsigned int cpu)
> -       __must_hold(&pmu_context->cpupm_lock)
> -{
> -       unsigned int cpuhint = smp_processor_id();
> -       u32 reg, mask;
> -
> -       /* set cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> -                    CPU_INFORM_C2);
> -
> -       mask = BIT(cpu);
> -       regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
> -                          mask, BIT(cpu));
> -
> -       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> -       regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
> -                    reg & mask);
> -
> -       mask = (BIT(cpu + 8));
> -       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> -       regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
> -                    reg & mask);
> -
> -       return 0;
> -}
> -
>  /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
> -static int gs101_cpu_pmu_offline(void)
> +static int exynos_cpu_pmu_offline(void)
>  {
>         int cpu;
>
> @@ -338,14 +259,14 @@ static int gs101_cpu_pmu_offline(void)
>                 return NOTIFY_OK;
>         }
>
> -       __gs101_cpu_pmu_offline(cpu);
> +       pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
>         raw_spin_unlock(&pmu_context->cpupm_lock);
>
>         return NOTIFY_OK;
>  }
>
>  /* Called from CPU hot plug callback with IRQs enabled */
> -static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> +static int exynos_cpuhp_pmu_offline(unsigned int cpu)
>  {
>         unsigned long flags;
>
> @@ -355,29 +276,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
>          * ACPM the CPU entering hotplug should not enter C2 idle state.
>          */
>         set_bit(cpu, pmu_context->in_cpuhp);
> -       __gs101_cpu_pmu_offline(cpu);
> +       pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
>
>         raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
>
>         return 0;
>  }
>
> -static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +static int exynos_cpu_pm_notify_callback(struct notifier_block *self,
>                                         unsigned long action, void *v)
>  {
>         switch (action) {
>         case CPU_PM_ENTER:
> -               return gs101_cpu_pmu_offline();
> +               return exynos_cpu_pmu_offline();
>
>         case CPU_PM_EXIT:
> -               return gs101_cpu_pmu_online();
> +               return exynos_cpu_pmu_online();
>         }
>
>         return NOTIFY_OK;
>  }
>
> -static struct notifier_block gs101_cpu_pm_notifier = {
> -       .notifier_call = gs101_cpu_pm_notify_callback,
> +static struct notifier_block exynos_cpu_pm_notifier = {
> +       .notifier_call = exynos_cpu_pm_notify_callback,
>         /*
>          * We want to be called first, as the ACPM hint and handshake is what
>          * puts the CPU into C2.
> @@ -425,6 +346,11 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>                 return 0;
>         }
>
> +       if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data->cpu_pmu_online) {
> +               dev_err(dev, "PMU write/read sequence is not present for cpuhotplug and cpuidle\n");
> +               return -ENODEV;
> +       }
> +
>         /*
>          * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
>          * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
> @@ -458,17 +384,17 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>
>         /* set PMU to power on */
>         for_each_online_cpu(cpu)
> -               gs101_cpuhp_pmu_online(cpu);
> +               exynos_cpuhp_pmu_online(cpu);
>
>         /* register CPU hotplug callbacks */
>         cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
> -                         gs101_cpuhp_pmu_online, NULL);
> +                         exynos_cpuhp_pmu_online, NULL);
>
>         cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
> -                         NULL, gs101_cpuhp_pmu_offline);
> +                         NULL, exynos_cpuhp_pmu_offline);
>
>         /* register CPU PM notifiers for cpuidle */
> -       cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> +       cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
>         register_reboot_notifier(&exynos_cpupm_reboot_nb);
>         return 0;
>  }
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
> index fbe381e2a2e1..186299a049a8 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -13,6 +13,14 @@
>
>  #define PMU_TABLE_END  (-1U)
>
> +/*
> + * CPU_INFORM register "hint" values are required to be programmed in addition to
> + * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
> + * This is required to workaround limitations in the el3mon/ACPM firmware.
> + */
> +#define CPU_INFORM_CLEAR       0
> +#define CPU_INFORM_C2          1
> +
>  struct regmap_access_table;
>
>  struct exynos_pmu_conf {
> @@ -20,6 +28,22 @@ struct exynos_pmu_conf {
>         u8 val[NUM_SYS_POWERDOWN];
>  };
>
> +struct exynos_pmu_context {
> +       struct device *dev;
> +       const struct exynos_pmu_data *pmu_data;
> +       struct regmap *pmureg;
> +       struct regmap *pmuintrgen;
> +       /*
> +        * Serialization lock for CPU hot plug and cpuidle ACPM hint
> +        * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
> +        * flags.
> +        */
> +       raw_spinlock_t cpupm_lock;
> +       unsigned long *in_cpuhp;
> +       bool sys_insuspend;
> +       bool sys_inreboot;
> +};
> +
>  /**
>   * struct exynos_pmu_data - of_device_id (match) data
>   *
> @@ -44,6 +68,10 @@ struct exynos_pmu_conf {
>   *            used (i.e. when @pmu_secure is @true).
>   * @wr_table: A table of writable register ranges in case a custom regmap is
>   *            used (i.e. when @pmu_secure is @true).
> + * @cpu_pmu_offline: Optional callback to be called before entering CPU offline
> + *                   or idle state. Only valid when pmu_cpuhp set to true.
> + * @cpu_pmu_online: Optional callback to be called after CPU onlined or after
> + *                  exiting idle state. Only valid when pmu_cpuhp set to true.
>   */
>  struct exynos_pmu_data {
>         const struct exynos_pmu_conf *pmu_config;
> @@ -57,6 +85,9 @@ struct exynos_pmu_data {
>
>         const struct regmap_access_table *rd_table;
>         const struct regmap_access_table *wr_table;
> +
> +       int (*cpu_pmu_offline)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
> +       int (*cpu_pmu_online)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
>  };
>
>  extern void __iomem *pmu_base_addr;
> diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
> index 17dadc1b9c6e..5f2a59924144 100644
> --- a/drivers/soc/samsung/gs101-pmu.c
> +++ b/drivers/soc/samsung/gs101-pmu.c
> @@ -322,11 +322,68 @@ static const struct regmap_access_table gs101_pmu_wr_table = {
>         .n_no_ranges = ARRAY_SIZE(gs101_pmu_ro_registers),
>  };
>
> +/*
> + * gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
> + * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
> + * disabled and cpupm_lock held.
> + */
> +static int gs101_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* clear cpu inform hint */
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
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
> +       return 0;
> +}
> +
> +/* Common function shared by both CPU hot plug and CPUIdle */
> +static int gs101_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +       __must_hold(&pmu_context->cpupm_lock)
> +{
> +       unsigned int cpuhint = smp_processor_id();
> +       u32 reg, mask;
> +
> +       /* set cpu inform hint */
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
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
> +       return 0;
> +}
> +
>  const struct exynos_pmu_data gs101_pmu_data = {
>         .pmu_secure = true,
>         .pmu_cpuhp = true,
>         .rd_table = &gs101_pmu_rd_table,
>         .wr_table = &gs101_pmu_wr_table,
> +       .cpu_pmu_offline = gs101_cpu_pmu_offline,
> +       .cpu_pmu_online = gs101_cpu_pmu_online,
>  };
>
>  /*
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index db8a7ca81080..9c4d3da41dbf 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -1009,11 +1009,11 @@
>  #define GS101_PHY_CTRL_UFS                      0x3ec8
>
>  /* PMU INTR GEN */
> -#define GS101_GRP1_INTR_BID_UPEND                              (0x0108)
> -#define GS101_GRP1_INTR_BID_CLEAR                              (0x010c)
> -#define GS101_GRP2_INTR_BID_ENABLE                             (0x0200)
> -#define GS101_GRP2_INTR_BID_UPEND                              (0x0208)
> -#define GS101_GRP2_INTR_BID_CLEAR                              (0x020c)
> +#define EXYNOS_GRP1_INTR_BID_UPEND                             (0x0108)
> +#define EXYNOS_GRP1_INTR_BID_CLEAR                             (0x010c)
> +#define EXYNOS_GRP2_INTR_BID_ENABLE                            (0x0200)
> +#define EXYNOS_GRP2_INTR_BID_UPEND                             (0x0208)
> +#define EXYNOS_GRP2_INTR_BID_CLEAR                             (0x020c)
>
>  /* exynosautov920 */
>  #define EXYNOSAUTOV920_PHY_CTRL_USB20                          (0x0710)
>
> --
> 2.51.0
>
