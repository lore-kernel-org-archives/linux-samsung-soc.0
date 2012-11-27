From: Mike Turquette <mturquette@ti.com>
Subject: Re: RE: [PATCH v4 00/12] clk: exynos4: migrate to common clock framework
Date: Tue, 27 Nov 2012 09:31:02 -0800
Message-ID: <20121127173102.21126.27914@nucleus>
References: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
 <20121126193116.21126.66261@nucleus>
 <15d501cdcc3a$3b5b6fb0$b2124f10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:55629 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932117Ab2K0Rb2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 12:31:28 -0500
In-Reply-To: <15d501cdcc3a$3b5b6fb0$b2124f10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Quoting Kukjin Kim (2012-11-26 16:57:53)
> Mike Turquette wrote:
> > 
> > Quoting Thomas Abraham (2012-11-24 13:17:53)
> > > Changes since v3:
> > > - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
> > >
> > 
> > Hi Thomas,
> > 
> Hi Mike,
> 
> > 3.7-rc7 is out and I do not wish to take any large changes this close to
> > the merge window opening up.  I will review these patches and give any
> > feedback now on the common clk bits, but merging in the
> > drivers/clk/samsung parts would have to wait until after clk-next is
> > rebased onto 3.8-rc.
> > 
> I agree. Would be better if this could be provided early 3.8-rc.
> 
> > Which tree do you want to merge this through?  Samsung or clk-next?
> > Will you split the patches or take it all once you have gathered ACKs?
> > 
> Mike, if you're ok, I'd like to take this series in Samsung tree because this changes are very important and touches many Samsung stuff.
> 

Sounds good to me.

Regards,
Mike

> Of course, I can create topic branch for your clk-next if you want.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> > Thanks,
> > Mike
> > 
> > > This patch series migrates the Samsung Exynos4 SoC clock code to adopt
> > the
> > > common clock framework. The use of Samsung specific clock structures has
> > > been removed and all board support code has been updated. imx-style of
> > > clock registration and lookup has been adopted for device tree based
> > > exynos4 platforms.
> > >
> > > This patch series is based on the for-next branch of Samsung
> > maintainer's
> > > tree with all patches merged from clk-next branch of Mike's tree. This
> > > series has been tested on Exynos4210 based Origen board and Exynos4412
> > > based smdk board.
> > >
> > > Thomas Abraham (12):
> > >   clk: samsung: add common clock framework helper functions for Samsung
> > platforms
> > >   clk: samsung: add pll clock registration helper functions
> > >   clk: exynos4: register clocks using common clock framework
> > >   ARM: Exynos: Rework timer initialization sequence
> > >   ARM: Exynos4: Migrate clock support to common clock framework
> > >   ARM: dts: add exynos4 clock controller nodes
> > >   ARM: dts: add xxti and xusbxti fixed rate clock nodes for exynos4
> > based platforms
> > >   ARM: Exynos4: allow legacy board support to specify xxti and xusbxti
> > clock speed
> > >   ARM: dts: add clock provider information for all controllers in
> > Exynos4 SoC
> > >   ARM: Exynos4: remove auxdata table from machine file
> > >   ARM: Exynos: use fin_pll clock as the tick clock source for mct
> > >   ARM: Exynos: add support for mct clock setup
> > >
> > >  .../devicetree/bindings/clock/exynos4-clock.txt    |  215 +++
> > >  arch/arm/boot/dts/exynos4.dtsi                     |   48 +
> > >  arch/arm/boot/dts/exynos4210-origen.dts            |   12 +
> > >  arch/arm/boot/dts/exynos4210-smdkv310.dts          |   12 +
> > >  arch/arm/boot/dts/exynos4210.dtsi                  |    6 +
> > >  arch/arm/boot/dts/exynos4412-smdk4412.dts          |   12 +
> > >  arch/arm/boot/dts/exynos4x12.dtsi                  |    6 +
> > >  arch/arm/mach-exynos/Kconfig                       |    1 +
> > >  arch/arm/mach-exynos/Makefile                      |    3 -
> > >  arch/arm/mach-exynos/clock-exynos4.c               | 1602 -----------------
> > ---
> > >  arch/arm/mach-exynos/clock-exynos4.h               |   35 -
> > >  arch/arm/mach-exynos/clock-exynos4210.c            |  188 ---
> > >  arch/arm/mach-exynos/clock-exynos4212.c            |  192 ---
> > >  arch/arm/mach-exynos/common.c                      |   57 +-
> > >  arch/arm/mach-exynos/common.h                      |   21 +-
> > >  arch/arm/mach-exynos/mach-armlex4210.c             |    3 +-
> > >  arch/arm/mach-exynos/mach-exynos4-dt.c             |   71 +-
> > >  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
> > >  arch/arm/mach-exynos/mach-nuri.c                   |    5 +-
> > >  arch/arm/mach-exynos/mach-origen.c                 |    5 +-
> > >  arch/arm/mach-exynos/mach-smdk4x12.c               |    5 +-
> > >  arch/arm/mach-exynos/mach-smdkv310.c               |    7 +-
> > >  arch/arm/mach-exynos/mach-universal_c210.c         |    3 +-
> > >  arch/arm/mach-exynos/mct.c                         |   32 +-
> > >  arch/arm/plat-samsung/Kconfig                      |    4 +-
> > >  drivers/clk/Makefile                               |    1 +
> > >  drivers/clk/samsung/Makefile                       |    6 +
> > >  drivers/clk/samsung/clk-exynos4.c                  |  655 ++++++++
> > >  drivers/clk/samsung/clk-pll.c                      |  400 +++++
> > >  drivers/clk/samsung/clk-pll.h                      |   38 +
> > >  drivers/clk/samsung/clk.c                          |  180 +++
> > >  drivers/clk/samsung/clk.h                          |  216 +++
> > >  32 files changed, 1905 insertions(+), 2138 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/exynos4-
> > clock.txt
> > >  delete mode 100644 arch/arm/mach-exynos/clock-exynos4.c
> > >  delete mode 100644 arch/arm/mach-exynos/clock-exynos4.h
> > >  delete mode 100644 arch/arm/mach-exynos/clock-exynos4210.c
> > >  delete mode 100644 arch/arm/mach-exynos/clock-exynos4212.c
> > >  create mode 100644 drivers/clk/samsung/Makefile
> > >  create mode 100644 drivers/clk/samsung/clk-exynos4.c
> > >  create mode 100644 drivers/clk/samsung/clk-pll.c
> > >  create mode 100644 drivers/clk/samsung/clk-pll.h
> > >  create mode 100644 drivers/clk/samsung/clk.c
> > >  create mode 100644 drivers/clk/samsung/clk.h
> > >
> > > --
> > > 1.7.4.4
