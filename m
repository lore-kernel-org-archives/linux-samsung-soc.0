From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/8] [media] s5p-fimc: Use clk_prepare_enable and clk_disable_unprepare
Date: Wed, 17 Oct 2012 21:05:01 +0530
Message-ID: <CAK9yfHymckQLOp=xavQ1sj5uJKRg7tFMXgvo68Dp8GL6N9g0JQ@mail.gmail.com>
References: <1350472311-9748-1-git-send-email-sachin.kamat@linaro.org>
	<507EC1BF.6040107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:57716 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932148Ab2JQPfC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 11:35:02 -0400
Received: by mail-vc0-f174.google.com with SMTP id fk26so4063281vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Oct 2012 08:35:01 -0700 (PDT)
In-Reply-To: <507EC1BF.6040107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, patches@linaro.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Turquette, Mike" <mturquette@ti.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

Hi Sylwester,

Thanks for the review.

On 17 October 2012 20:03, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi Sachin,
>
> On 10/17/2012 01:11 PM, Sachin Kamat wrote:
>> Replace clk_enable/clk_disable with clk_prepare_enable/clk_disable_unprepare
>> as required by the common clock framework.

>
> You need to be careful with those replacements, since the clk *_(un)prepare
> functions may sleep, i.e. they must not be called from atomic context.

OK.

>
> Most of the s5p-* drivers have already added support for clk_(un)prepare.
> Thus most of your changes in this patch are not needed. I seem to have only
> missed fimc-mdevice.c, other modules are already reworked

I did not find these changes in your tree. Please let me know the
branch where these changes are available.

>
> $ git grep -5  clk_prepare  -- drivers/media/platform/s5p-fimc
> drivers/media/platform/s5p-fimc/fimc-core.c-
> drivers/media/platform/s5p-fimc/fimc-core.c-    for (i = 0; i < MAX_FIMC_CLOCKS; i++) {
> drivers/media/platform/s5p-fimc/fimc-core.c-            fimc->clock[i] = clk_get(&fimc->pdev->dev, fimc_clocks[i]);
> drivers/media/platform/s5p-fimc/fimc-core.c-            if (IS_ERR(fimc->clock[i]))

>> I would prefer you have added the required changes at fimc_md_get_clocks()
> and fimc_md_put_clocks() functions.

Ok. I will check this.
>

-- 
With warm regards,
Sachin
