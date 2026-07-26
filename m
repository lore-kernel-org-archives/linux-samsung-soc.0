Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B33C109A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080535; cv=pass; b=JVJT/BXgKPDF9eJrCIePBZmh+dhKP9KMDWYnegnZJ4TWlTJ5+A8vDSedpuDTN94pXAMjFBlRgDeBFk8yLmLIf/rfAqm0zIuVB5OtKo8jzUSIqu0SkbnsvDUwq3EQH9A3eVcYdBSDdeNkFpp8tnWV3x929UdDJfO/NhEeTusl8xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080535; c=relaxed/simple;
	bh=bgJ9+WfH4PFDGqwfZG6L07hfTKFonjeGW30KZIvWFO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9u8H0zVKpUOi/puIm9K2d+5FjnadvDjhkUW6hMy8+QSHYOmgrkILVZyNCxOLxBoa9PB1FGZ2rRLoBocz1gLeFr69tPTYYMuDPKO8MVOFvxFVyE+l9HyCEpWf+DcuTPM2aV9OkRq576+lL5M0HbCeJw3i/fzR8yNPJS91rFoMYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z1gJMGeW; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z1gJMGeW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fdf8a536bso627284a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 08:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785080528; cv=none;
        d=google.com; s=arc-20260327;
        b=PBaCwv5bjmd2ezjAneHQWDkaTcHLk5FYmeIbp4lE0DD2MRZonQBFSggv2ef9mTLqqv
         +kbyALMSqxbDzvOV9qkURRJJzoJjxjLDBg+kSTn0Rk3/nmQsMx1w0M72Of+cQP+X0BpR
         9ftcofwIBg7/GY8jcuhb6d3ncSVQz4kFmxpgEWwB9UECuT8Y3BM5efif0iQoO2eHHPbw
         cl66VByDrEg5EObinQeHNiyqWZbVVpJ8uVIHT5ypgbyoOE5uNzMPPIBA1o+77L77XaX6
         ZgA6ZAMKWxie8DVutfc6Z9ohKSmU6u8nodzjL9TGYiEz3kso3i4a5ZOF51PzbyWyC9gb
         LtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        fh=Srl0O08gG4VvP48jYfK347MCHqqOV6oRDBlQL0qAMWg=;
        b=rqyF8f87gxRVccrPLnIG5zvsNLa3o3bmRnqd1WUoC+Ns8byRvd1Sr8e2h+E7H8TCLc
         r0Zjcriy0My2B3eogzJc52YsoTgYZpkadjCINRofgWix6K55gEqpj8IW0OhR+mJDFCge
         C5nwDztApPWusRhkjILtOoiap1WTgNkY94ai/mqYdDfYD3lJuUZ6Y5pl4kOzl1UvNdJx
         axqtFjQ3z4n0m21Biy2WyrcoBvXs9csK2SMDJX22dprRJjxNSofSFe6UQuUjJctvohbL
         yL3dzOCZ/RTtxbPsSCoroLa/P8jDm0rHBJNjOlvcT+8zoVv4ZmiK8gp4QQt51Yj4n+4/
         ZZkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785080528; x=1785685328; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        b=z1gJMGeWjKOxWTusarGCC1GF+2PZdnk7oZa4vloL39kASAkml/6wv7ExmhdWuDwCHO
         8VqcoNIslaRbZxs1+XLoNOyoGWMfp+OKHkkITodJpxMMVA4MTZbo7sEeTZxCNd1GjkaJ
         eye++ws6tmccIV6qYGtrS+Eo3CuB60/w0udjqlSbvR2VTfAbKuJK7T1DDo+mAGcqqzIr
         gHJVuFM5ov4lckg6pcEgb51qwu9FF7J/OmJYuih2N6UXnVsTrxUPrXDiCARB8nE87jUM
         MaUHOYkfgRz1pMxHJTkZMDK+1KwMMCd2guytsoIwcT4mvwD9bHP8xt9FmPzhyXi2rqz1
         xROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080528; x=1785685328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        b=FEok826chTWqEHFSnGDHdVV5hythV2wb54QRa89VImlGael6jzJ5PE1PBOuKZFRqTh
         5Y+cvObATt5UdavGl0nXmleJ56mI3EM96LbLfW+MWBGU3BZFWn4jhsFFDVBLd8n4QiR2
         dEb3WxypYEuhJlMahkcUe6PABvCS6szjaTN8glc1E/Bvh7StmSxOBMYqS6JsxivRTxLm
         8/Yj3sqvjzhEnXQqZt0btDKt7yxNPKWALGGZ4vcJw2nbynns5vISJ+yNKN8OgYpeJ+pJ
         vQI+HRecIo8M1P1s96OBYC3FOaSkWnmPjd0aYUKibfsaoTVOk/ZzLHff8bfviXUmmTHy
         akoA==
X-Forwarded-Encrypted: i=1; AHgh+RrcN8KzKcPmhnXeNN8l2CbMB1WrrbqhaQZJCMtyIZHYX/prRsnbILEX3Htd6MmyPjkcJRohTrjfIvWlsXZ43xMLNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/V+VlF+rsnQvdG9eYp/gY0uGChmYQsZh1YJUfH4GiNiNGN30s
	Wr9LQVv5y1E8Ye8wd9nvzOd0qSVyhkQShRHcW32GjWG0Q3Il2DAHFR46FlH9rGPTBgRg6Ubvw4n
	3yhrTkYlx6QFD1vd69LZOMO+bQWSeFJChA1SWpG3QsQ==
X-Gm-Gg: AR+sD125/nLxQcP7zVFEk24HNKejHKepSIcD8v9mNuAli0qv3sc/nj574d5WOvc8grd
	p3YopweXRVL9YI0KcBPMCN/CwwX/s1/Z22Pi+mKLcJad98Lw1Rhzd02918ppy3riniToNQjDMv/
	0nBzHVQ59xbtwK24oCDUZ+xqjxRWjmyep8f+gGA5VwEvS/3p9SdMUj0hdXJKNvWBgrtQKcogdXi
	YFFqnx4u+GlMggsjovystrs8mIVfONfk9adp6zieuBuGHwHLS4lmsixIO3eO+Q=
X-Received: by 2002:a05:6402:518e:b0:69e:98bc:b74 with SMTP id
 4fb4d7f45d1cf-69fc1178531mr2081934a12.35.1785080527429; Sun, 26 Jul 2026
 08:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
 <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com> <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
In-Reply-To: <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 26 Jul 2026 16:41:50 +0100
X-Gm-Features: AUfX_mzMjkQcMBVfevDXjcIpqzBWckoO6ast3bT9N3LNyKp-DvhMeUqpSXU7zEA
Message-ID: <CADrjBPqq7mfvyfoKeJmjt4-mxwy7emsG_X3a9ABD+92_kp9HLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Thanks for your analysis on this issue.

On Wed, 15 Jul 2026 at 22:35, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> On Wed Jun 10, 2026 at 10:55 AM BST, Peter Griffin wrote:
> > Hi Alexey,
> >
> > Thanks for your patch.
> >
> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> >>
> >> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
> >> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
> >> determine the target register offset for the CPU inform hints. This may
> >> be fine for cpuidle flow but broken for cpu hotplug where the target
> >> cpu is passed as an argument and could be different from cpu where
> >> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
> >> smp_processor_id() returns the id of local CPU but hotplug flow
> >> deals with another CPU core undergoing the transition.
> >
> > This was intentional. The powermode hint is always programmed based on
> > the currently executing CPU core in the gs101 downstream code (for
> > both CPU Idle and CPU hotplug paths). See
> > https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powermode.c#15
> > and the pmu_intr_gen is done based on the actual CPU being
> > enabled/disabled.
>
> Beware of the Downstream bearing gifts.
> Dowstream may or may not contain mistakes or maybe they have something
> that workarounds potential problems. I agree that it is a good source
> of reference but I doubt that we must use it as an ultimate GOAT reference
> source.
>
> Even Qualcomm downstream things have mistakes sometimes.
>
> > It's possible Exynos850 requires something different. I suggest
> > checking the equivalent function in the e850 downstream kernel.
> >
> >>
> >> This causes the pmu driver to write power down and power on configuration
> >> hints to the wrong hardware registers, messing up the power state of active
> >> cores and failing to configure the target core. Fix this by removing the
> >> cpuhint variable entirely and utilizing the target 'cpu' argument passed
> >> to the callbacks by the hotplug core infrastructure.
> >
> > Unfortunately I think you're introducing the bug you describe with this patch.
>
> I wouldn't be so quick judging this like this. I think this patch actually
> does fixes a problem. IIRC I also tested this and there were no issues.
>
> Considering that neither your team nor me have access to the implementation
> details it would be easier to just drop it instead of endlessly debating
> over this if there is no interest narrowing it down.
> FWIW this was reported by Sashiko in the first place so I couldn't say what
> justification can be provided.
> https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
>
> Let's go over details. Idle callbacks are executed on target CPUs so
> target CPU is the same as local CPU.
> The hotplug callbacks are slightly different. Offline CPU callback executes
> on target CPU so again the local CPU is equal to target CPU (CPU offlines
> itself). The online hotplug callback stands out. It is executed on
> some CPU and deal with target CPU, that some CPU is not the same as target CPU
> as system assumes that CPU undergoing online transition is not ready yet.
>
> All these callbacks write to CPUx_INFORM register (where x -- is CPU id).
> The number of these regs are equal to the number of CPUs. I think these
> are per-CPU registers.
>
> Idle callbacks and hotplug offline callback write cpu power state hint
> to the local CPU's cpu_inform register. On online callback, the random
> CPUx_INFORM register is chosen and its state is cleared (because online
> callback can be executed on random available CPU). Does it make any sense
> to you? Why among 4 callbacks one of them updates random CPUx_INFORM
> register?

I agree it seems inconsistent. Since hints are always programmed when
entering a power state, clearing the hint is probably not really
required.

>
> I think these callbacks should deal with target CPU undergoing transition
> and not with random CPU id.
>
> If I consumed enough coffee and can still trust my eyes, I tested two
> configurations:
> -- this commit (and similar change for e850);
> -- change where CPU_INFORM_CLEAR write is removed from online callback.
>
> On e850 (with consecutive series) and gs101. All were fine.
>
> My understanding from experiments is that:
> -- clears of CPUx_INFORM are less important and maybe not needed at all;
> -- important thing is the value in correct CPUx_INFORM when CPU goes
> into a power state, upon executing psci call.
>
> The potential race doesn't reproduce presumably because hotplug ops
> are fully serialized.
>
> The downstream probably uses smp_processor_id() for cluster power
> down and up states. Perhaps, cluster offline callbacks don't have CPU id
> for transition into CPD state and they are executed on the last CPU from
> cluster undergoing power state transition.
>
> Anyhow, I think it will less compilcated to remove this change rather
> than speculate without a way to confirm the behaviour.

I agree, let's drop this patch temporarily and continue to follow up
with Samsung folks. Hopefully we can get clarification or confirmation
from someone who has access to the firmware code. If/when revisiting,
I think some of the analysis from this email could probably be added
to create a more verbose commit message or possibly a comment to
clearly explain why upstream deviates from the downstream
implementation. Of course, the best solution would be a fully
compliant PSCI firmware, which doesn't require any hints.

Thanks,

Peter.

>
> BR,
> Alexey.
>
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> >> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> >> index d58376c38179..6e635872247a 100644
> >> --- a/drivers/soc/samsung/exynos-pmu.c
> >> +++ b/drivers/soc/samsung/exynos-pmu.c
> >> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >>  static int __gs101_cpu_pmu_online(unsigned int cpu)
> >>         __must_hold(&pmu_context->cpupm_lock)
> >>  {
> >> -       unsigned int cpuhint = smp_processor_id();
> >>         u32 reg, mask;
> >>
> >>         /* clear cpu inform hint */
> >> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> >> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
> >>                      CPU_INFORM_CLEAR);
> >>
> >>         mask = BIT(cpu);
> >> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
> >>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
> >>         __must_hold(&pmu_context->cpupm_lock)
> >>  {
> >> -       unsigned int cpuhint = smp_processor_id();
> >>         u32 reg, mask;
> >>
> >>         /* set cpu inform hint */
> >> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> >> -                    CPU_INFORM_C2);
> >> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
> >>
> >>         mask = BIT(cpu);
> >>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
> >>
> >> --
> >> 2.51.0
> >>
>
