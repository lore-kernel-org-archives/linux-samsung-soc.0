From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
Date: Wed, 24 Oct 2012 10:14:39 -0700
Message-ID: <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
	<1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:38570 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932816Ab2JXROk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 13:14:40 -0400
Received: by mail-ia0-f174.google.com with SMTP id y32so548861iag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Oct 2012 10:14:39 -0700 (PDT)
In-Reply-To: <1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kyungmin.park@samsung.com, sachin.kamat@linaro.org, thomas.abraham@linaro.org, will.deacon@arm.com

Hi,

On Tue, Oct 23, 2012 at 10:34 PM, Chanho Park <chanho61.park@samsung.com> wrote:
> This patch defines irq numbers of ARM performance monitoring unit for exynos4.
> Firs of all, we need to fix IRQ_PMU correctly and to split pmu initialization
> of exynos from plat-samsung for easily defining it.
>
> The number of CPU cores and PMU irq numbers are vary according to soc types.
> So, we need to identify each soc type using soc_is_xxx function and to define
> the pmu irqs dynamically. For example, the exynos4412 has 4 cpu cores and pmus.

I wonder if it's worth doing this complexity on the non-DT case for exynos4?

I wish there was more focus on the Samsung platforms for getting the
DT support up to par with non-DT so you can avoid having to add new
platform devices like these in the first place.


Thanks,

-Olof
