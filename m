From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Wed, 24 Jul 2013 14:30:18 +0530
Message-ID: <CAK9yfHzF=PqCkLMwV63gSUqaK9-emzoFvK9kUutSp6M6xmYTXw@mail.gmail.com>
References: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
	<0dff01ce881b$cd21c500$67654f00$@org>
	<CAK9yfHzMyfprmtGkDxwbQcYUXueCTPYVZDU_uM=oMudAiaoC_w@mail.gmail.com>
	<0e7c01ce883f$c1edafe0$45c90fa0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:63139 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855Ab3GXJAS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:00:18 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so12291943obc.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 02:00:18 -0700 (PDT)
In-Reply-To: <0e7c01ce883f$c1edafe0$45c90fa0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 24 July 2013 13:01, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> On 24 July 2013 08:43, Kukjin Kim <kgene@kernel.org> wrote:
>> > Kukjin Kim wrote:
>> >>
>> >> Sachin Kamat wrote:
>> >> >
>> >> > Remove unused declarations that got left behind subsequent to
>> >> > making Exynos a DT-only platform.
>> >> >
>> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >> > ---
>> >> >  arch/arm/mach-exynos/common.h |   41
>> > -----------------------------------
>> >> --
>> >> > ----
>> >> >  1 file changed, 41 deletions(-)
>> >> >
>> >
>> > [...]
>> >
>> >> > -
>> >> > -struct device_node;
>> >> > -
>> >> >  extern struct smp_operations exynos_smp_ops;
>> >> >
>> >> >  extern void exynos_cpu_die(unsigned int cpu);
>> >> > --
>> >> > 1.7.9.5
>> >>
>> >> Looks good to me, applied into -cleanup.
>> >>
>> > Just note, needed following additionally.
>> >
>> > -struct device_node;
>> > -void combiner_init(void __iomem *combiner_base, struct device_node *np,
>> > -                       unsigned int max_nr, int irq_base);
>> > -
>>
>> There is already a patch to clean that up [1] submitted earlier as
>> part of combiner cleanup series.
>> Please apply that first or squash it into this one.
>>
>> [1] https://lkml.org/lkml/2013/6/26/296
>>
> Already did when I applied.

 Thanks Kukjin.




-- 
With warm regards,
Sachin
