From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Wed, 24 Jul 2013 09:07:09 +0530
Message-ID: <CAK9yfHzMyfprmtGkDxwbQcYUXueCTPYVZDU_uM=oMudAiaoC_w@mail.gmail.com>
References: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
	<0dff01ce881b$cd21c500$67654f00$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:57898 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148Ab3GXDhK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 23:37:10 -0400
Received: by mail-ob0-f176.google.com with SMTP id v19so11838663obq.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 20:37:09 -0700 (PDT)
In-Reply-To: <0dff01ce881b$cd21c500$67654f00$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 24 July 2013 08:43, Kukjin Kim <kgene@kernel.org> wrote:
> Kukjin Kim wrote:
>>
>> Sachin Kamat wrote:
>> >
>> > Remove unused declarations that got left behind subsequent to
>> > making Exynos a DT-only platform.
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> > ---
>> >  arch/arm/mach-exynos/common.h |   41
> -----------------------------------
>> --
>> > ----
>> >  1 file changed, 41 deletions(-)
>> >
>
> [...]
>
>> > -
>> > -struct device_node;
>> > -
>> >  extern struct smp_operations exynos_smp_ops;
>> >
>> >  extern void exynos_cpu_die(unsigned int cpu);
>> > --
>> > 1.7.9.5
>>
>> Looks good to me, applied into -cleanup.
>>
> Just note, needed following additionally.
>
> -struct device_node;
> -void combiner_init(void __iomem *combiner_base, struct device_node *np,
> -                       unsigned int max_nr, int irq_base);
> -

There is already a patch to clean that up [1] submitted earlier as
part of combiner cleanup series.
Please apply that first or squash it into this one.

[1] https://lkml.org/lkml/2013/6/26/296


-- 
With warm regards,
Sachin
