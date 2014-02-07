From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/9] Samsung PM consolidation part 1 (clocks)
Date: Fri, 07 Feb 2014 12:55:55 +0100
Message-ID: <52F4C9CB.6060901@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
 <CAJuA9ah97MQKrNeKG2vijFCr8b7T4r2Zr9gsGtETwtBLmKBrXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41455 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbaBGL4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Feb 2014 06:56:01 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0M00FTUJTB6P90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Feb 2014 11:55:59 +0000 (GMT)
In-reply-to: <CAJuA9ah97MQKrNeKG2vijFCr8b7T4r2Zr9gsGtETwtBLmKBrXg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Thomas Abraham <ta.omasab@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 07/02/14 04:45, Thomas Abraham wrote:
> On Thu, Feb 6, 2014 at 11:46 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> > This series reworks suspend/resume handling of Samsung clock drivers
>> > to cover more SoC specific aspects that are beyond simple register
>> > save and restore. The goal is to have all the suspend/resume code
>> > that touches the clock controller in single place, which is the
>> > clock driver.
>> >
>> > On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
>> > Arndale boards (except suspend/resume, which is broken because of
>> > unrelated reasons):
>> >
>> > Tested-by: Tomasz Figa <t.figa@samsung.com>
>> >
>> > Tomasz Figa (9):
>> >   clk: exynos4: Remove remnants of non-DT support
>> >   clk: samsung: Provide common helpers for register save/restore
>> >   clk: samsung: exynos4: Move suspend/resume handling to SoC driver
>> >   clk: samsung: exynos5250: Move suspend/resume handling to SoC driver
>> >   clk: samsung: exynos5420: Move suspend/resume handling to SoC driver
>> >   clk: samsung: s3c64xx: Move suspend/resume handling to SoC driver
>> >   clk: samsung: Drop old suspend/resume code
>> >   clk: samsung: exynos4: Add remaining suspend/resume handling
>> >   ARM: EXYNOS: pm: Drop legacy Exynos4 clock suspend/resume code
>> >
>> >  arch/arm/mach-exynos/pm.c            | 148 +-----------------------------
>> >  drivers/clk/samsung/clk-exynos4.c    | 172 +++++++++++++++++++++++++++++++----
>> >  drivers/clk/samsung/clk-exynos5250.c |  49 +++++++++-
>> >  drivers/clk/samsung/clk-exynos5420.c |  49 +++++++++-
>> >  drivers/clk/samsung/clk-exynos5440.c |   2 +-
>> >  drivers/clk/samsung/clk-s3c64xx.c    |  79 +++++++++++++---
>> >  drivers/clk/samsung/clk.c            |  71 ++++++---------
>> >  drivers/clk/samsung/clk.h            |  14 ++-
>> >  8 files changed, 348 insertions(+), 236 deletions(-)
>
> Nice series!
> Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>

Yes, that's a nice cleanup.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
