Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB582EB5B5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948831; cv=none; b=TClhzK+Zkf8wBLOAI1Y9cKCzvPSpRbw+filv5QPwd82IKMqYfQPiFTD7qNY2PHaddoWwqZUvths15tvD5UuljXGx/g+LzN3uTfbh4ukXsQqUGDDE5Km8+FSAMpuFSDHheBvNqePCRUonR2fT/sRyeIZheIqH8dEsZI9/TKo80fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948831; c=relaxed/simple;
	bh=aHV1jI1fkhodloHyH4Cmzv72r5jWv5VROLncg/taXkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGnaIwyq6wfcYiBnA5gExQr02FzOLk3ZG1zdGVJmBmMvUrB8pRzMCICpWQKz6U4Fza7/dgkv03fvQ8UeE+LYWjY8tCAT3D/OQze6X+r81g9UpneQB4z5jGcvPs88+DvG1tV87a3W28qzCpKz59UL59n5TAdtqjrtuCpiXhOyn4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWaN82d/; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWaN82d/"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40af40aef06so710397b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948828; x=1751553628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxnJ+JMAeXEe0tFyoruENV/4pmqUfnDATYgkfRCTwwk=;
        b=vWaN82d/4v3L7a5QEPbqqEo3ZXz8m8USzJkGZUPOHQExRr6EYc+iBSFKsFj0sEpcSv
         gzTT5/fC3f7tClqcIX8HaAnMM4JknybP6zerMsS0nbdbNV/S2o84bS7XaYHAM+XV81g5
         iP7vb+GZ3Q7YW4DZsulR1m2y1zH0EwMhvOFtUH9PwF65GPi1aZ2goqzLhORHJZ8RI2Ow
         joIkLKa6UFPbwH60ybf+rXR+4kguQQ9HlbbFJywAdr8MPIJa+RkfVbh1eQqjPPsmXvAw
         YWmvPaEs++leM6XSAQTyauO0YsHHr37uCbCJEB0iPah9j4eYm/kdoVd2cWWvi5XE9/es
         BhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948828; x=1751553628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxnJ+JMAeXEe0tFyoruENV/4pmqUfnDATYgkfRCTwwk=;
        b=uAcOaOL+zqDOe3Mh6M4oKJobF8DI451FXc8Qy72c4MdWlr+4nQeLaUTmLU7SIj+9PE
         9KOegXNPyX1TcDW87HM9GCq0h2SAjgSpZYFer+1uWJEajIxqld95zCSKF5IcgU4r4HKQ
         uDpibtQCGOby/bf/3JXECjZqqvhGVKnxkchLhzWHX/UhWQ0yDKiZPd1OkwQKYUAZ/j7k
         +fdQ1GviQ8ohyMpmsp6cvQ3lghLOK6sBEIa3i60kGP9hJ/1q/WYG6H0RNHV1qVVy2oxA
         mPKpG36+FObDOkW+r8XO0sxVDSMUC/slxRPnmFLNW4AeiEEvc2Gu1VVw/D/K/kVJRsJG
         AjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBwLIhMaOWzG70t37KbXXtpwZyPu8mQ6nUSeG4RjfJ3fw1N5GdkqlIiAWd+/0qkz7NukJpmk88/yauZiikxFwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9OOEcyEzeRpelY6zDX5ALZemoUfWBzC/6/2eW7EVlZLqetBF
	4uJwRHmx8qc//N7OTmtL+XcNs++C6hsWdMQlZMg0VZ4Bt+QWHyzYwiaOlaA0bImnZidJ6LLE3fv
	q6bE8HnJXlFPm2aeqPTMpzF2OX0lTkU5KyVcj0a6Ctg==
X-Gm-Gg: ASbGnct5OvvGxvqIN+7XA/oq++K8dTnNvF1YMvDVzga+uxZzxkkpruhunVYjLWqdzxE
	ibZcRnfRXy5bF8OfvdVMhNgU5QQNq1IRz2GyAz5gc7c9W2kyrga4vSMfRGjb7jaK4eKk7eNjtAt
	R5Ei6ZIUiXU4L8QEfuLBdFZvYo77sZ8TlB6RAvGGhvD/Ex
X-Google-Smtp-Source: AGHT+IGHmBJjuI+jjZm5dEoJCIPgYdOyi9w4BnG28G9e5pmpEj5kPuV2QO71c3KUdTEVfpTi32Y/zFwNrd073ovM1Nk=
X-Received: by 2002:a05:6808:4fe3:b0:401:e67c:b3be with SMTP id
 5614622812f47-40b31c96519mr95767b6e.4.1750948827854; Thu, 26 Jun 2025
 07:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
 <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org> <4e827037-1bde-4eb3-a6f2-6416dace10b5@kernel.org>
In-Reply-To: <4e827037-1bde-4eb3-a6f2-6416dace10b5@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 26 Jun 2025 15:40:16 +0100
X-Gm-Features: Ac12FXyqVtwDD2H_scgEAaexOZMihIpWC1bKrXvc2_bGE_Q9OwsMvGA0M86meco
Message-ID: <CADrjBPrWZ4JkNJ-c9Qiw=5mmMKePqg6ZW=ATwi8g-1F8Qekn=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks a lot for your review feedback!

On Wed, 18 Jun 2025 at 11:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/06/2025 11:34, Peter Griffin wrote:
> > Register cpu pm notifiers for gs101 which call the
> > gs101_cpu_pmu_online/offline callbacks which in turn
> > program the ACPM hint. This is required to actually
> > enter the idle state.
> >
> > A couple of corner cases are handled, namely when the
> > system is rebooting or suspending we ignore the request.
> > Additionally the request is ignored if the CPU is in
> > CPU hot plug.
> >
> > Note: this patch has a runtime dependency on adding
> > 'local-timer-stop' dt property to the CPU nodes. This
> > informs the time framework to switch to a broadcast timer
> > as the local timer will be shutdown. Without that DT
> > property specified the system hangs in early boot with
> > this patch applied.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Noted, will fix

>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2
> >  * Add ifdef CONFIG_PM_SLEEP to avoid
> >    Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
> > ---
> >  drivers/soc/samsung/exynos-pmu.c | 137 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 133 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> > index a77288f49d249f890060c595556708334383c910..7f72ecd60994f18bb639dd8e09e1c6ff6158066b 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/array_size.h>
> >  #include <linux/arm-smccc.h>
> >  #include <linux/cpuhotplug.h>
> > +#include <linux/cpu_pm.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/mfd/core.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/delay.h>
> > +#include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >
> >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> > @@ -35,6 +37,10 @@ struct exynos_pmu_context {
> >       const struct exynos_pmu_data *pmu_data;
> >       struct regmap *pmureg;
> >       struct regmap *pmuintrgen;
> > +     spinlock_t cpupm_lock;  /* serialization lock */
>
> serialization of what? Or rather, can it be not a serialization lock? Is
> it possible? It's as useful as saying "protection against concurrent
> accesses lock". No, you need to be explicit which members and/or code
> are protected.

I can update the comment to be more verbose, but the lock is used to
ensure the cpu online/offline sequence called from CPU hotplug
callbacks and cpu pm notifiers are serialized.

>
> > +     bool __percpu *hotplug_ing;
> > +     atomic_t sys_suspended;
>
> Why re-implementing own refcnt of pm suspend status?
> pm_runtime_suspended() and others?

sys_suspended is being used to detect whether a *system* wide sleep
state is happening. I see a bunch of different drivers using a similar
approach in the kernel to set a flag from their suspend/resume
callback. Grep for things like system_suspending, is_suspending etc.
An alternative approach could be to use register_pm_notifier() and set
the flag from the callback there.

pm_runtime_suspended() tells me the runtime pm status, which is not
what I want here.

> > +     atomic_t sys_rebooting;
> >  };
> >
> >  void __iomem *pmu_base_addr;
> > @@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >  #define CPU_INFORM_CLEAR     0
> >  #define CPU_INFORM_C2                1
> >
> > -static int gs101_cpuhp_pmu_online(unsigned int cpu)
> > +static int gs101_cpu_pmu_online(unsigned int cpu)
> >  {
> >       unsigned int cpuhint = smp_processor_id();
> >       u32 reg, mask;
> > @@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
> >       return 0;
> >  }
> >
> > -static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> > +static int gs101_cpuhp_pmu_online(unsigned int cpu)
>
> This needs either renaming or comments. One is cpu_pmu_online other is
> cpuhp_pmu_online. Sounds the same to me.

I can add some comments, but one function is specifically for CPU Hot
Plug, which is what the 'cpuhp' part was trying to convey.

>
>
> > +{
> > +     gs101_cpu_pmu_online(cpu);
> > +
> > +     /*
> > +      * Mark this CPU as having finished the hotplug.
> > +      * This means this CPU can now enter C2 idle state.
> > +      */
> > +     *per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;
>
> Quoting docs: "Per cpu data structures are designed to be used by one
> cpu exclusively".
>
> ... and further about write access. Adding standard driver code using
> "highly discouraged" practice is not something expected.

I'll update this to dynamically allocate based on num_possible_cpus()
and then read/write the flag with cpupm lock held. I didn't realize
the docs described the per_cpu remote writes as "highly discouraged
unless absolutely necessary", so thanks for highlighting that. The
per_cpu variables with remote writes seem quite widely used in the
downstream exynos-cpupm driver, but then it takes all sorts of locks
through all the different cal layers.

>
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int gs101_cpu_pmu_offline(unsigned int cpu)
> >  {
> >       u32 reg, mask;
> > -     unsigned int cpuhint = smp_processor_id();
> > +     unsigned int cpuhint;
> > +
> > +     spin_lock(&pmu_context->cpupm_lock);
>
> This does not disable interrupts...
>
> > +     cpuhint = smp_processor_id();
>
> ... which is a requirement here, according to docs, no? Maybe the
> original code had an issue, though.

CPU notifiers are called with interrupts disabled. We do use a similar
pattern in the CPU hot plug path which isn't called with IRQs disabled
though, so I'll add some locking there in the next version.

Thanks,

Peter



>
> >
> >       /* set cpu inform hint */
> >       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> > @@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> >       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> >       regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
> >                    reg & mask);
> > +
> > +     spin_unlock(&pmu_context->cpupm_lock);
> >       return 0;
> >  }
> >
> > +static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> > +{
> > +     /*
> > +      * Mark this CPU as entering hotplug. So as not to confuse
> > +      * ACPM the CPU entering hotplug should not enter C2 idle state.
> > +      */
> > +     *per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
> > +
> > +     gs101_cpu_pmu_offline(cpu);
> > +
> > +     return 0;
> > +}
> > +
> > +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> > +                                     unsigned long action, void *v)
> > +{
> > +     int cpu = smp_processor_id();
> > +
> > +     switch (action) {
> > +     case CPU_PM_ENTER:
> > +             /*
> > +              * Ignore CPU_PM_ENTER event in reboot or
> > +              * suspend sequence.
> > +              */
> > +
> > +             if (atomic_read(&pmu_context->sys_suspended) ||
> > +                 atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
> > +                     return NOTIFY_BAD;
> > +
> > +             gs101_cpu_pmu_offline(cpu);
> > +
> > +             break;
> > +     case CPU_PM_EXIT:
> > +
> > +             if (atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             gs101_cpu_pmu_online(cpu);
> > +
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block gs101_cpu_pm_notifier = {
> > +     .notifier_call = gs101_cpu_pm_notify_callback,
> > +     .priority = INT_MAX     /* we want to be called first */
>
> You should say why. Everyone wants to be the first.
>
> > +};
> > +
> > +static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
> > +                                     unsigned long event, void *v)
> > +{
> > +     switch (event) {
> > +     case SYS_POWER_OFF:
> > +     case SYS_RESTART:
> > +             atomic_set(&pmu_context->sys_rebooting, 1);
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block exynos_cpupm_reboot_nb = {
> > +     .priority = INT_MAX,
> > +     .notifier_call = exynos_cpupm_reboot_notifier,
> > +};
> > +
> >  static int exynos_pmu_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> >       struct regmap_config pmu_regmcfg;
> >       struct regmap *regmap;
> >       struct resource *res;
> > -     int ret;
> > +     int ret, cpu;
> >
> >       pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(pmu_base_addr))
> > @@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >                        */
> >                       dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
> >               } else {
> > +                     pmu_context->hotplug_ing = alloc_percpu(bool);
> > +
> > +                     /* set PMU to power on */
> > +                     for_each_online_cpu(cpu)
> > +                             gs101_cpuhp_pmu_online(cpu);
> > +
> >                       cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
> >                                         "soc/exynos-pmu:prepare",
> >                                         gs101_cpuhp_pmu_online, NULL);
> > @@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >                       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >                                         "soc/exynos-pmu:online",
> >                                         NULL, gs101_cpuhp_pmu_offline);
> > +
> > +                     cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> > +                     spin_lock_init(&pmu_context->cpupm_lock);
> > +                     atomic_set(&pmu_context->sys_rebooting, 0);
> > +                     atomic_set(&pmu_context->sys_suspended, 0);
> > +                     register_reboot_notifier(&exynos_cpupm_reboot_nb);
> >               }
> >       }
> >
> > @@ -471,10 +578,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static int exynos_cpupm_suspend_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 1);
> > +     return 0;
> > +}
> > +
> > +static int exynos_cpupm_resume_noirq(struct device *dev)
> > +{
> > +     atomic_set(&pmu_context->sys_suspended, 0);
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops cpupm_pm_ops = {
> > +     .suspend_noirq = exynos_cpupm_suspend_noirq,
> > +     .resume_noirq = exynos_cpupm_resume_noirq,
>
> SET_LATE_SYSTEM_SLEEP_PM_OPS or one of other wrappers.
>
> > +};
> > +#endif
> > +
> >  static struct platform_driver exynos_pmu_driver = {
> >       .driver  = {
> >               .name   = "exynos-pmu",
> >               .of_match_table = exynos_pmu_of_device_ids,
> > +#ifdef CONFIG_PM_SLEEP
> > +             .pm = &cpupm_pm_ops,
>
> pm_ptr
> > +#endif
> >       },
> >       .probe = exynos_pmu_probe,
> >  };
> >
>
>
> Best regards,
> Krzysztof
