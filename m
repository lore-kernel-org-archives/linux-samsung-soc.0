From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V2] ARM: EXYNOS: Move arm core power down clock to exynos5250
 common clock
Date: Mon, 21 Oct 2013 06:34:29 +0900
Message-ID: <52644C65.3040805@samsung.com>
References: <1381470134-29410-1-git-send-email-amit.daniel@samsung.com> <4953642.S7P9jyspGP@amdn883>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:39172 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800Ab3JTVee (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 17:34:34 -0400
Received: by mail-pa0-f44.google.com with SMTP id fb1so4271569pad.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Oct 2013 14:34:34 -0700 (PDT)
In-Reply-To: <4953642.S7P9jyspGP@amdn883>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org

On 10/11/13 16:33, Tomasz Figa wrote:
> Hi Amit,
>
> On Friday 11 of October 2013 11:12:14 Amit Daniel Kachhap wrote:
>> Now with common clock support added for exynos5250 it is necessary to move
>> this code to exynos5250 common clock driver as clock registers should be
>> handled there. This change is tested in exynos5250 based arndale platform.
>>
>> Cc: Abhilash Kesavan<a.kesavan@samsung.com>
>> Cc: Thomas Abraham<thomas.abraham@linaro.org>
>> Acked-by: Kukjin Kim<kgene.kim@samsugn.com>
>
> nit: Typo in samsung. Probably something that Kukjin can fix up when
> applying, though.
>
>> Reviewed-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
>> Signed-off-by: Amit Daniel Kachhap<amit.daniel@samsung.com>
>> ---
>>
>> Changes in V2:
>> * Rebased against linux-next tree.
>> * Removed un-used macros in regs-clock.h
>>
>>   arch/arm/mach-exynos/cpuidle.c                 |   35 --------------------
>>   arch/arm/mach-exynos/include/mach/regs-clock.h |   16 ---------
>>   drivers/clk/samsung/clk-exynos5250.c           |   42 ++++++++++++++++++++++++
>>   3 files changed, 42 insertions(+), 51 deletions(-)
>
> Otherwise
>
> Acked-by: Tomasz Figa<t.figa@samsung.com>
>
Mike, do you want me to pick this patch into Samsung tree?

- Kukjin
