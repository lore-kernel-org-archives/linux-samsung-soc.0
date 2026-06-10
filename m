Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEF21CC58
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085367; cv=pass; b=ZTE2a/uFUqvgcxjEU0b5ljRUdMiLnDzGBy/TVc9saB7QNKKJZyh+OIka5UGUtGGz9fVVqw3KlJ7o7RWejCw7Pzjq7mjU+MS89jkypsljTsbakiHk+wGJAKvx0NVNPg/hB9lGG7/HmWTRlBQ4HzLcN/rS0bkUEpxnwe7SzTH0rfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085367; c=relaxed/simple;
	bh=hZNp1wzl7aMol0obQLeujStExhwYmp321tYBENr5gfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB4fSYT1FinuGGU/47QFk67l+4nzyv0qTluDZchXJ0ZgbizlVCD7adAgvs+lQf/xArjk1PkFgtFgQ+RGXmcYQiabG/mY9UtQiXnQtUFJW6LxlYLvW7aAiuOtDJQtIiW1QnNTuoDT7BT0qKt9B6/IX1/dVl03GNDhiUFhbkPrqrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJyl9nYe; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJyl9nYe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so9845338a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 02:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781085365; cv=none;
        d=google.com; s=arc-20240605;
        b=bbmHZ1vZ+CFiJo3fazDELq2Or1ODxdK2AMdCPW51Yy3Ox2onQgpYZDLHDjc4IpJmkc
         KCbzxP83dwHotxR/El8LwJ0MH9LKHrEofhiwXYyEsPkLUSr5UFqv9MZ1Y5ZTqCFCdmsm
         3KdPPJZGTCn+HtBGSqKBbuRh7VTpKYacEFOf7GnyA9p67vpqcm7AgXOoaneMLGUZznHL
         e2O6Iht0GYE4rKPokKqKUc/Ze95dAwc68W/klGuQ2nvPXWsoTNLrLT5t5OqQBQ0wv7vR
         a8pd76BnChlMwlghqKCT8eGyNICi7I6T4ZsciQtrGk3+B7yQXg6G1e9X3wMbDpwAedkp
         90Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        fh=4Y7sMpXKoSdgwZnKBdUJj/6wsFntxhsEoWlAsiMVyW4=;
        b=iDGc8q/jFaWFbMF8Rvgf+ePUdwujHDniIhs0G/J6tPMX4FcikoYeI7oZGaxRj/zxTQ
         AEQOOdCvufxiuwtkQEweYyj0Oo0l+7QkczCmAfXvMH9Ufw86UhyP8a9bXOi8TCUPkczG
         VA90k9GyxxFAcFACyQAdpWW7+iBBmf/Tc5Sz9yF2/ujbb6iTfjczuRR3PdxqWrycK+5G
         ZwcnXG/WDYkX5kwAASScP/N/QgAHYXB62sZoJX7T0wqOFhJWwcyDqedDMlqXiLXD8XJy
         A3xS2N/sbGQ8SGry6zM4jp2gwTqacT+hP+bpaSkSTsAJeZzgHg3aVeGfyXEwPWgDZ3vt
         GiGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781085365; x=1781690165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        b=LJyl9nYekUQk8o5/09+acieQM8M72nvIR6T8Iy4gh+Q2qH3MQuqgJIXTS80vqnNYh7
         TBWLPZfdCxfHIwqGPf1dI5dDlIkNWLb7QTpkJSEtd3bFJmlSY3xb/TIZGB8sPQQm/Nhv
         iP/gvzutuRHm7N2/kIjbyFXFnzIEftqpQk2ySUVqQ2kyc9SBXy69jeRAi9xmjkLCSsvO
         7Ipdemze8b577dmaOXNj1GH1qoC2NMqAE0OnK2BXwppSR4I23dVCbbc+fPkkLceAXcW3
         sX8/G0oIfCnK3aQEBpNxVjt70CwwV+Mimu2tp/SGJ9Oqdvw9Ke9S0JN4gzMd0tBfpZXf
         nurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085365; x=1781690165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        b=eDc0JhiI2AX+9y/THbshPi36ckhlwYaravNag2dw6xAqEe2aAteIo1Fift46V812Xt
         uqGzu/+kKWGNdqqLq0eFwiWfiQSYuvoIVkK49AHFbA1mtwVQcOwsWDhYTOgfND8qv6sH
         lgeSf/nDNRoqs44j6LaPcfRA2EcLW++cUlWaWuCD8qMPfEf/Qn25BRLKyxv73EOzS25a
         owraYccMr2BygXla1D3H+pqlDHyfdmHt6+89fXFW7Y3DL1IctQCQYGHvbG2OjcSCTTgh
         0vtWs9xxsDe0t1JXn3tGRgw44BGVNU3zAM7UUxvadWUgO8MS2jDKYyeW615OkmqSwVsV
         rdfw==
X-Forwarded-Encrypted: i=1; AFNElJ8iFI9W6F0KLybNq/n3OOsLvsDH8l5wVfLo9zYWzQaJmE0bmvHc0Csg3md9YInQV71vTlm4PbGXuxyEY4TLTYXJ3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxD96cvDld7l640QRuvpNFsQ0kzQOMEQB/EKDDZ1dBcwKR5EU
	Ppj7CCj1cdDAzerpPdRvbHX20fI/eIzBT2x2/wOFCvH9xBIsaVCsNynqWiJY7ayiomdnw9ilepS
	+MgirF3JVtEC/W6vipUBhPWpMYsWfSyhglGuUvri4Ig==
X-Gm-Gg: Acq92OHCXNBKLqE/StFM7qFRWlg5pZs3MWuoCZi6Ox4k9lfZ3E4B7Cqw19hKPfnwLwW
	SFEVKRPxZMJfAUfCuJCcqAmWcTiQJ4L5zD6y1YN/r6Frf4l+r/1pqO2li25L+mQ4zQzPHeTmpMW
	/GEo+WZ+XrC28GzqNbhIGbNhF6ttcWRDwvQaxhbmZ9p+RToXwZ+05lfwEmfRgmIGs9iAbxGC0p8
	rUwtaJBx9UjsRRwQEhNQPm/ZhpZSXNtkyROKw58tjiCwhUFSWPkHU5m5RQ7VDrR/nM/68pjylTg
	rigEwJnG1oDLC9urhqpcr6soYRhvBTU0vbyFtfzG5yYAGTt4NXgP
X-Received: by 2002:a05:6402:26ca:b0:68e:66da:c39c with SMTP id
 4fb4d7f45d1cf-68fa52595a9mr11429014a12.24.1781085364631; Wed, 10 Jun 2026
 02:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 10:55:51 +0100
X-Gm-Features: AVVi8Cefu1n2MWDEUi6aR9N7alNw0lKukQb9HTmuDkQk8K2PjK6RnQfXSI6M9T4
Message-ID: <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Thanks for your patch.

On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
> determine the target register offset for the CPU inform hints. This may
> be fine for cpuidle flow but broken for cpu hotplug where the target
> cpu is passed as an argument and could be different from cpu where
> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
> smp_processor_id() returns the id of local CPU but hotplug flow
> deals with another CPU core undergoing the transition.

This was intentional. The powermode hint is always programmed based on
the currently executing CPU core in the gs101 downstream code (for
both CPU Idle and CPU hotplug paths). See
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powermode.c#15
and the pmu_intr_gen is done based on the actual CPU being
enabled/disabled.

It's possible Exynos850 requires something different. I suggest
checking the equivalent function in the e850 downstream kernel.

>
> This causes the pmu driver to write power down and power on configuration
> hints to the wrong hardware registers, messing up the power state of active
> cores and failing to configure the target core. Fix this by removing the
> cpuhint variable entirely and utilizing the target 'cpu' argument passed
> to the callbacks by the hotplug core infrastructure.

Unfortunately I think you're introducing the bug you describe with this patch.

regards,

Peter

>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index d58376c38179..6e635872247a 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  static int __gs101_cpu_pmu_online(unsigned int cpu)
>         __must_hold(&pmu_context->cpupm_lock)
>  {
> -       unsigned int cpuhint = smp_processor_id();
>         u32 reg, mask;
>
>         /* clear cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
>                      CPU_INFORM_CLEAR);
>
>         mask = BIT(cpu);
> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
>         __must_hold(&pmu_context->cpupm_lock)
>  {
> -       unsigned int cpuhint = smp_processor_id();
>         u32 reg, mask;
>
>         /* set cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> -                    CPU_INFORM_C2);
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
>
>         mask = BIT(cpu);
>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
>
> --
> 2.51.0
>
