From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for
 Exynos4 only
Date: Sat, 19 Oct 2013 18:09:15 +0530
Message-ID: <CAK9yfHxNPKeRPpxPjoeUs1Xbu9pibn=dLK2U=7atpxEmKY1k1Q@mail.gmail.com>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
	<3434799.pjC3lbNE3P@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:57316 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab3JSMjQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Oct 2013 08:39:16 -0400
Received: by mail-pb0-f50.google.com with SMTP id uo15so3603055pbc.9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Oct 2013 05:39:15 -0700 (PDT)
In-Reply-To: <3434799.pjC3lbNE3P@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>

Hi Tomasz,

On 17 October 2013 18:35, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> On Thursday 17 of October 2013 17:33:12 Sachin Kamat wrote:
>> L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
>> Thus move this function to Exynos4 early init call to avoid non-Exynos4
>> SoCs from calling this function in multi-platform support.
>
> I believe that at the time .init_early() is called there is no ioremap()
> infrastructure working yet and so L2 cache initialization which needs
> it will cause a kernel panic. This patch worked only because currently
> there is no L2X0 controller defined in device tree sources of Exynos 4.

It is not clear to me as to why device tree entry is required for this
to work in current form
as we call the  L2X0 init function explicitly.

>
> Other than that, it will be required to register firmware operations
> before L2X0 initialization, because on some boards it is needed to
> initialize the L2 cache through secure firmware.
>
> Please let me handle this by the way of patches adding firmware based
> L2X0 initialization.

Sure, please go ahead. BTW, any rough estimate about when you plan to post them?

-- 
With warm regards,
Sachin
