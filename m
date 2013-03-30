From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 00/21] Various fixes and extensions to Exynos4 clock driver
Date: Sat, 30 Mar 2013 12:30:37 +0100
Message-ID: <1496108.NDegb7PXrt@flatron>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com> <CAJuYYwQap4pZ6qTgBPGeSWbMFm-ZhqLfv7wBMVYjK1v0YHr_kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62464 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754315Ab3C3Lal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Mar 2013 07:30:41 -0400
Received: by mail-ee0-f46.google.com with SMTP id e49so497474eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2013 04:30:40 -0700 (PDT)
In-Reply-To: <CAJuYYwQap4pZ6qTgBPGeSWbMFm-ZhqLfv7wBMVYjK1v0YHr_kQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

On Saturday 30 of March 2013 15:33:00 Thomas Abraham wrote:
> Hi Tomasz,
> 
> On 27 March 2013 16:32, Tomasz Figa <t.figa@samsung.com> wrote:
> > This series is a collection of various fixes and extensions to Exynos4
> > clock driver, which improve coverage of clocks present on Exynos4 SoCs
> > and fix problems discovered during our internal work and testing.
> 
> Nice series. Thanks for the improvements and fixes. Looking at the
> second patch in this series, I crossed checked again with the
> Exynos4412 user manual that I have. Your modifications are different
> from what the manual has listed. I suspect, you have a newer copy of
> the manual.

Right. I have checked revisions 0.0, 0.1 and 1.1 of the manual and indeed 
there are differences in clock layout between 0.1 and 1.1. My patches are 
based on revision 1.1.

> For this series:
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

Thanks.

Best regards,
Tomasz

> Thanks,
> Thomas.
> 
> > Andrzej Hajda (1):
> >   clk: samsung: exynos4: Add missing CMU_TOP and ISP clocks
> > 
> > Lukasz Majewski (1):
> >   clk: samsung: exynos4: Export clocks used by exynos cpufreq drivers
> > 
> > Sylwester Nawrocki (2):
> >   clk: samsung: exynos4: Correct sclk_mfc clock definition
> >   clk: samsung: exynos4: Add camera related clock definitions
> > 
> > Tomasz Figa (17):
> >   clk: samsung: exynos4: Use mout_mpll_user_* on Exynos4x12
> >   clk: samsung: exynos4: Add missing mout_mipihsi clock
> >   clk: samsung: exynos4: Add missing sclk_audio0 clock
> >   clk: samsung: exynos4: Export sclk_pcm0
> >   clk: samsung: exynos4: Move dac and mixer to Exynos4210-specific
> >   
> >     clocks
> >   
> >   clk: samsung: pll: Remove unimplemented ops
> >   clk: samsung: exynos4: Export mout_core clock of Exynos4210
> >   clk: samsung: exynos4: Add G3D clocks
> >   clk: samsung: exynos4: Add missing mout_sata on Exynos4210
> >   clk: samsung: exynos4: Define {E,V}PLL registers
> >   clk: samsung: exynos4: Use SRC_MASK_PERIL{0,1} definitions
> >   clk: samsung: exynos4: Remove SoC-specific registers from save list
> >   clk: samsung: exynos4: Add E4210 prefix to LCD1 clock registers
> >   clk: samsung: exynos4: Add E4210 prefix to GATE_IP_PERIR register
> >   clk: samsung: exynos4: Remove E4X12 prefix from SRC_DMC register
> >   clk: samsung: exynos4: Add missing registers to suspend save list
> >   clk: samsung: exynos4: Add support for SoC-specific register save
> >   list
> >  
> >  .../devicetree/bindings/clock/exynos4-clock.txt    |  61 ++-
> >  drivers/clk/samsung/clk-exynos4.c                  | 491
> >  +++++++++++++++------ drivers/clk/samsung/clk-exynos5250.c          
> >      |   3 +-
> >  drivers/clk/samsung/clk-exynos5440.c               |   2 +-
> >  drivers/clk/samsung/clk-pll.c                      |  80 ----
> >  drivers/clk/samsung/clk.c                          |   9 +-
> >  drivers/clk/samsung/clk.h                          |   3 +-
> >  7 files changed, 437 insertions(+), 212 deletions(-)
> > 
> > --
> > 1.8.1.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
