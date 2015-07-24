From: Michael Turquette <mturquette@baylibre.com>
Subject: RE: [PATCH v6 0/3] cpufreq: Use cpufreq-dt driver for Exynos3250
Date: Thu, 23 Jul 2015 17:30:05 -0700
Message-ID: <20150724003005.642.21781@quantum>
References: <1435797761-3339-1-git-send-email-cw00.choi@samsung.com>
 <4464631.oZyVO4Z0Ov@amdc1976> <093101d0b8c3$4b5d3ec0$e217bc40$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33338 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794AbbGXAaJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jul 2015 20:30:09 -0400
Received: by pdbnt7 with SMTP id nt7so4260057pdb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2015 17:30:09 -0700 (PDT)
In-Reply-To: <093101d0b8c3$4b5d3ec0$e217bc40$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, thomas.ab@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Quoting Kukjin Kim (2015-07-07 07:43:31)
> Bartlomiej Zolnierkiewicz wrote:
> > 
> > Hi,
> >
> Hi,
> 
> > On Thursday, July 02, 2015 09:42:38 AM Chanwoo Choi wrote:
> > > This patchset use cpufreq-dt driver to support Exynos3250 cpufreq and tested it
> > > on Exynos3250-based Rinato board.
> > >
> > > Depends on:
> > > - next-20150701 tag (master branch) of linux-next kernel tree
> > > - This patch-set is based on Exynos5250 patch-set[1] because two patch-set
> > >   modify the 'arch/arm/mach-exynos/exynos.c' to add the compatible string.
> > >   [1] https://lkml.org/lkml/2015/6/29/361
> > >   : [PATCH v2 0/4] cpufreq: use generic cpufreq drivers for Exynos5250 platform
> > >
> > > Changes from v5:
> > > (https://lkml.org/lkml/2015/7/1/324)
> > > - Reorder the cpu dt node in exynos3250-rinato/monk.dts alpabetically.
> > > - Add reviewed-by tag of Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > >
> > > Changes from v4:
> > > (https://lkml.org/lkml/2014/10/20/215)
> > > - Rebased on latest linux-next git repository.
> > > - Remove unnecessary divider clock flag from divider of DIV_CPU0/DIV_CPU1 register
> > >
> > > Changes from v3:
> > > - This patchset is based on 3.18-rc1 with new patchset[3] of Thomas Abraham
> > >   [3] [PATCH v11 0/6] cpufreq: use generic cpufreq drivers for exynos platforms
> > >   - http://www.spinics.net/lists/arm-kernel/msg370412.html
> > >
> > > Changes from v2:
> > > - Rebased on new patchset of Thomas Abraham
> > >   and for-next branch of samsunc-clk.git of Tomasz Figa
> > >
> > > Changes from v1:
> > > - Rebased on new patchset[1] by Thomas Abraham
> > >   [1] [PATCH v10 0/6] cpufreq: use generic cpufreq drivers for exynos platforms
> > >   - http://www.spinics.net/lists/arm-kernel/msg364790.html
> > > - Modify clk-cpu.c to support Exynos3250
> > > - Drop documentation patch on previous patchset[2]
> > >   [2] http://www.spinics.net/lists/cpufreq/msg10265.html
> > > - Add only operating-points for Exynos3250 without armclk-divider-table
> > >
> > > Chanwoo Choi (3):
> > >   clk: samsung: exynos3250: Add cpu clock configuration data and instaniate cpu clock
> > >   ARM: dts: Add CPU OPP and regulator supply property for Exynos3250
> > >   ARM: exynos: Add exynos3250 compatible to use generic cpufreq driver
> > >
> > >  arch/arm/boot/dts/exynos3250-monk.dts   |  4 ++++
> > >  arch/arm/boot/dts/exynos3250-rinato.dts |  4 ++++
> > >  arch/arm/boot/dts/exynos3250.dtsi       | 15 +++++++++++++++
> > >  arch/arm/mach-exynos/exynos.c           |  1 +
> > >  drivers/clk/samsung/clk-exynos3250.c    | 32 ++++++++++++++++++++++++++++++--
> > >  include/dt-bindings/clock/exynos3250.h  |  1 +
> > >  6 files changed, 55 insertions(+), 2 deletions(-)
> > 
> > Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > 
> > Thank you for working on this.
> > 
> +1 Thanks.
> 
> Mike and Sylwester, if you're OK on this series, I'd like to pick up in Samsung
> tree together. And if you want, I could provide topic branch for clk tree.

Kukjin,

A topic branch would be great.

Thanks,
Mike

> 
> Thanks,
> Kukjin
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
