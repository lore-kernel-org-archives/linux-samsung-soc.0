Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3134F482
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094191; cv=none; b=fChlhAAZUkhJepAne6TRhxDkDhQNW+Xc0zk1YQOQMSaeRuFVFtYycLHGzXflceP9gslrbcAQ0xex0wezqX/A9zygx4FFjRcAJMPTPbhK+O/y5/QK6wmDJja/UguXSqG/RJXNTZfLAe4PpoVEg4x3vOtH9WKnW6/slFFPKbL9Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094191; c=relaxed/simple;
	bh=spaONa8DiW1S+/HzVqAX3TqzmLODkfxT9O9QtYJ7APE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swhqJiu1r90b88OK3j17DvrP6Y7R9oguK7cqczcwti4m5dqRAjiqGdLOH/Ai1uv1h5QAHQ08xiuRuMHkqitHs4q/YmIzw/X00lV3QIcGdxb8+pGxbPCIRiB3DlYd52AcIwYv4AKzMtlyMpk8yf5hayb6QzDZYx82UW1GEat6C+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jevt5GWh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jevt5GWh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ddca76f22so4385e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Sep 2025 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757094188; x=1757698988; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OwtIggRcr5wxJSAP7GIf8f8SWw36+MX8jvX4Nt7H+dM=;
        b=Jevt5GWhu9JOWm0djiMhWHHchb6/UzuAiNdmJPKJqSw9JPPI/xiQT7KQrFxSlSS0aP
         YUPCz48FMcdRbiX3Vzfe2wVzXL1IBoNRPzbRK8yMwcQK7/coSlS3kv36VLvaz3lB1fEu
         l7EX1dC8gzU6q1WjS/OKu4KZ0yvxjGiyh3j2dQfHH9iEGE/FiO+5o3pan3U3evlyF9k6
         hUQQ4/AXxWZ/3meLt5weNYmuNpSythWPzwmV1YziECmfmUGtASkdot0/+ujNi8+pRaHk
         CmBZsB9LmqQuBRdl9TiQGbXwlLQ3Fg1ahbpScFKzlu/7T0zE9mP6O96pcpGJHR3WXCJK
         5GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094188; x=1757698988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwtIggRcr5wxJSAP7GIf8f8SWw36+MX8jvX4Nt7H+dM=;
        b=CXP+qXU+L0rtpi435T0WNdm5yI6KDkdcMrJo93AYOF15eVQMsLbXSE+tA87NH9FUHx
         GoRBmuNXryUVdJRN6Kvj/XxgxVOyxjA2SlEnEFH5+RcoLgjuqOy8+3oFDK1QFX22tTsy
         EIZSsof92Kliiz0mMN+KU93XoIGY+zhpsidZVhDNaGXQ0tgyLQeDIqHvI4CCgb2ugRTW
         6BSgF0VeC9BLhBhH6r7FyEWy0ber5IVJSoih3BzvNviLAu40zbEp/awd060qtE/fFyg4
         7VosWBgLYzYepZOlyX9HJlm5ouQZC2N2HkMzDOR+uEHcDYw2h5Bd66DVd16Jg0TazfyF
         wEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKZxVamLvNAG8ahSbDd1F/+AjERzhuAAVZeWUslS79okd4YaiUNvPO2NqaMRD+zc0sXryJRpdYrue08v5m02ThJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfK0MdeuYDgfYCjKsswWXfPqfIYpe83gk9QpfONfp5k9l9ANj
	rjuD7D9AMU6W/MNIi231IK9E7mXcXFHWEpzkg3HVrIKyNKqw+CnGcbryHT/gAkLz0AypSRpwSko
	pV4Q3EQ==
X-Gm-Gg: ASbGncsG3U8HPwK33Mi6R7Qo83z0uB3Kun0H0ZfaWCnDNbvzj6yqm71XLYNoVj27d7w
	vzo5H0YrOMBVEgxZuwzCWgVlWzCYxMXwzGZxCMJx8GJo3hq2KpbSKVY2Qd2ZkFbN5n/x+1Ar+nK
	KibH7TDWpzcu7DIo+H4cKWpZ09ehOh6MdxsUspG4vzCah5t2H1UVxvrvT9b9Gw//9pH9fno1QfO
	F5+jM89JOPWQFqI/4ihL8dRFf/5lhJ9Nou54e3dvErpgeYdVP+shZYIcraXzgdE0udCof7O7m+R
	+FHD9fDRviCyjeGUn6HGYZlYkyq1bLfVsyUlJZmT1j1C5HqG0M8RL1EFaZSD16WTmmxHBS+Ca7Q
	NXmzVK+AJNSrQ9TsgO2uO3upGcGE5wxgFQyBXTEZyJK8tUiI+Dz2MAfqu3ajSTOqTyZU=
X-Google-Smtp-Source: AGHT+IGIUe8jcq4QkryXOklmIX18T8CVETybZwMU9Yokjp/gJoqXng9Eo2lvOISZKvvxWpy8bYMluQ==
X-Received: by 2002:a05:600c:15cc:b0:45c:b4fb:f0b3 with SMTP id 5b1f17b1804b1-45dd7b0f058mr1073055e9.3.1757094187488;
        Fri, 05 Sep 2025 10:43:07 -0700 (PDT)
Received: from google.com (26.38.155.104.bc.googleusercontent.com. [104.155.38.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm32299414f8f.43.2025.09.05.10.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 10:43:06 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:43:03 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aLshJ11k3c2T-MRs@google.com>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>

On Fri, Sep 05, 2025 at 07:09:09PM +0200, Krzysztof Kozlowski wrote:
> On 05/09/2025 18:24, Mostafa Saleh wrote:
> > Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> > following WARN:
> > 
> > [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> > [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> > [    0.784439][    T1] Hardware name: Oriole (DT)
> > [    0.784441][    T1] Call trace:
> > [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> > [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> > [    0.784460][    T1]  dump_stack+0x18/0x24
> > [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> > [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> > [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> > [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> > [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> > [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> > [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> > [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> > [    0.784508][    T1]  platform_probe+0x64/0xd0
> > [    0.784516][    T1]  really_probe+0xd0/0x3b0
> > [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> > [    0.784524][    T1]  driver_probe_device+0x44/0x140
> > [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> > [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> > [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> > [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> > [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> > [    0.784547][    T1]  device_add+0x4d0/0x700
> > [    0.784550][    T1]  of_device_add+0x4c/0x78
> > [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> > [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> > [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> > [    0.784567][    T1]  of_platform_populate+0x84/0x178
> > [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> > [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> > [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> > [    0.784589][    T1]  kernel_init+0x28/0x168
> > [    0.784595][    T1]  ret_from_fork+0x10/0x20
> 
> Please trim from unnecessary parts - [time].

Will do.

> 
> > 
> > As this value is only read once, it doesn't require to be stable, so
> 
> Why it does not need to be stable? Onlining wrong CPU number is not
> desired...
> 
> > just use "raw_smp_processor_id" instead.
> 
> You might be just hiding some other real issue, because above stacktrace
> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
> disabled. Provide analysis of the warning, instead of just making it
> disappear.

Not sure I understand, how is preemption disabled? that wouldn't fire
in that case.

I am not familiar with this driver, but as I see the value is used
only once, it would be stable, for example using get/put_cpu won't
really matter, because next access doesn't depend on the current CPU.
Otherwise, if you imply that this might not be enough, that means
the driver is already broken even without CONFIG_DEBUG_PREEMP
(which is beyond my knowledge at this point)

> 
> > 
> > Cc: Peter Griffin <peter.griffin@linaro.org>
> > Cc: André Draszik <andre.draszik@linaro.org>
> > 
> 
> No blank lines between tags.
> 
> Missing Fixes tag... and then Cc is not necessary. Please follow
> standard kernel process.

I will add the Fixes.

I am working with Peter and André, so I thought Cc is fine
(according to the process) in:
https://docs.kernel.org/process/5.Posting.html

Thanks,
Mostafa

> 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/soc/samsung/exynos-pmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> > index a77288f49d24..338f4758a089 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -338,7 +338,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >  
> 
> 
> Best regards,
> Krzysztof
