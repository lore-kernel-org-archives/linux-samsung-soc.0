From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 0/9] Samsung clock PM consolidation part 1
Date: Wed, 5 Feb 2014 10:15:11 +0530
Message-ID: <CAPdUM4OHCEgy4Y8An9j8t3sQ6RjzMdSEdOnqrZNuAwrWGZN7Nw@mail.gmail.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:32771 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668AbaBEEpM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Feb 2014 23:45:12 -0500
Received: by mail-wg0-f47.google.com with SMTP id m15so13450987wgh.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2014 20:45:11 -0800 (PST)
In-Reply-To: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Tomasz,

Are you planning to respin this series? It is not applying on mike's for-next.

Regards,
Rahul Sharma.


On 16 October 2013 16:38, Tomasz Figa <t.figa@samsung.com> wrote:
> This series reworks suspend/resume handling of Samsung clock drivers
> to cover more SoC specific aspects that are beyond simple register
> save and restore. The goal is to have all the suspend/resume code
> that touches the clock controller in single place, which is the
> clock driver.
>
> On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
> Arndale boards (except suspend/resume, which is broken because of
> unrelated reasons):
>
> Tested-by: Tomasz Figa <t.figa@samsung.com>
>
> Tomasz Figa (9):
>   clk: exynos4: Remove remnants of non-DT support
>   clk: samsung: Provide common helpers for register save/restore
>   clk: samsung: exynos4: Move suspend/resume handling to SoC driver
>   clk: samsung: exynos5250: Move suspend/resume handling to SoC driver
>   clk: samsung: exynos5420: Move suspend/resume handling to SoC driver
>   clk: samsung: s3c64xx: Move suspend/resume handling to SoC driver
>   clk: samsung: Drop old suspend/resume code
>   clk: samsung: exynos4: Add remaining suspend/resume handling
>   ARM: EXYNOS: pm: Drop legacy Exynos4 clock suspend/resume code
>
>  arch/arm/mach-exynos/pm.c            | 125 +-------------------------
>  drivers/clk/samsung/clk-exynos4.c    | 170 ++++++++++++++++++++++++++++++-----
>  drivers/clk/samsung/clk-exynos5250.c |  49 ++++++++--
>  drivers/clk/samsung/clk-exynos5420.c |  49 ++++++++--
>  drivers/clk/samsung/clk-exynos5440.c |   2 +-
>  drivers/clk/samsung/clk-s3c64xx.c    |  79 +++++++++++++---
>  drivers/clk/samsung/clk.c            |  71 ++++++---------
>  drivers/clk/samsung/clk.h            |  14 ++-
>  8 files changed, 346 insertions(+), 213 deletions(-)
>
> --
> 1.8.3.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
