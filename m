From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/9] Samsung PM consolidation part 1 (clocks)
Date: Fri, 14 Feb 2014 08:17:06 +0900
Message-ID: <52FD5272.7010309@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com> <CAJuA9ah97MQKrNeKG2vijFCr8b7T4r2Zr9gsGtETwtBLmKBrXg@mail.gmail.com> <52F4C9CB.6060901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:64145 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795AbaBMXRP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 18:17:15 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so11465018pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 15:17:15 -0800 (PST)
In-Reply-To: <52F4C9CB.6060901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <ta.omasab@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/07/14 20:55, Sylwester Nawrocki wrote:
> On 07/02/14 04:45, Thomas Abraham wrote:
>> On Thu, Feb 6, 2014 at 11:46 PM, Tomasz Figa<t.figa@samsung.com>  wrote:
>>>> This series reworks suspend/resume handling of Samsung clock drivers
>>>> to cover more SoC specific aspects that are beyond simple register
>>>> save and restore. The goal is to have all the suspend/resume code
>>>> that touches the clock controller in single place, which is the
>>>> clock driver.
>>>>
>>>> On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
>>>> Arndale boards (except suspend/resume, which is broken because of
>>>> unrelated reasons):
>>>>
>>>> Tested-by: Tomasz Figa<t.figa@samsung.com>
>>>>
>>>> Tomasz Figa (9):
>>>>    clk: exynos4: Remove remnants of non-DT support
>>>>    clk: samsung: Provide common helpers for register save/restore
>>>>    clk: samsung: exynos4: Move suspend/resume handling to SoC driver
>>>>    clk: samsung: exynos5250: Move suspend/resume handling to SoC driver
>>>>    clk: samsung: exynos5420: Move suspend/resume handling to SoC driver
>>>>    clk: samsung: s3c64xx: Move suspend/resume handling to SoC driver
>>>>    clk: samsung: Drop old suspend/resume code
>>>>    clk: samsung: exynos4: Add remaining suspend/resume handling
>>>>    ARM: EXYNOS: pm: Drop legacy Exynos4 clock suspend/resume code
>>>>
>>>>   arch/arm/mach-exynos/pm.c            | 148 +-----------------------------
>>>>   drivers/clk/samsung/clk-exynos4.c    | 172 +++++++++++++++++++++++++++++++----
>>>>   drivers/clk/samsung/clk-exynos5250.c |  49 +++++++++-
>>>>   drivers/clk/samsung/clk-exynos5420.c |  49 +++++++++-
>>>>   drivers/clk/samsung/clk-exynos5440.c |   2 +-
>>>>   drivers/clk/samsung/clk-s3c64xx.c    |  79 +++++++++++++---
>>>>   drivers/clk/samsung/clk.c            |  71 ++++++---------
>>>>   drivers/clk/samsung/clk.h            |  14 ++-
>>>>   8 files changed, 348 insertions(+), 236 deletions(-)
>>
>> Nice series!
>> Reviewed-by: Thomas Abraham<thomas.ab@samsung.com>
>
> Yes, that's a nice cleanup.
>
> Reviewed-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>
+1 Nice

I've applied this whole series.
Thanks, Tomasz.

- Kukjin
