From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v4 0/4] Adds PMU and S2R support for exynos5420
Date: Fri, 16 May 2014 10:37:58 +0530
Message-ID: <CAM4voan82jypoHTOo9KwsvA7tPzdYYa3QYNHMo4Q2Yvt_cf7gA@mail.gmail.com>
References: <1399982522-27928-1-git-send-email-a.kesavan@samsung.com>
	<53753021.5050801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:50750 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725AbaEPFH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 01:07:59 -0400
Received: by mail-qg0-f41.google.com with SMTP id j5so3432143qga.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 22:07:58 -0700 (PDT)
In-Reply-To: <53753021.5050801@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Tomasz,

On Fri, May 16, 2014 at 2:52 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Abhilash,
>
> On 13.05.2014 14:01, Abhilash Kesavan wrote:
>> Rebased on
>> 1] Kukjin Kim's tree for-next branch (which has Sachin Kamat's SYSRAM
>> patches merged) with Tomasz Figa's samsung clock tree (samsung-next branch)
>> merged.
>> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>> 2] Pankaj Dubey's v4 PMU patchset
>> https://lkml.org/lkml/2014/5/10/29
>
> I think this patch is not safe to base on yet. I need to find time to
> review the latest version and share my latest view on this with Pankaj,
> as I have a bit different design in mind.
OK, do you think the PMU series might make it this cycle or should I
drop this as a dependency and re-base my patches just on Daniel's
CPUIdle consolidation.

Regards,
Abhilash
>
> In general, I don't like the fact that you end up with using regmap to
> access registers that are used exclusively by PMU driver or for accesses
> happening at late suspend or early resume, where concurrent accesses
> from other drivers simply can't occur.

>
> Best regards,
> Tomasz
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
