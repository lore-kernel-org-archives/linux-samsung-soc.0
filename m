From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: Fix broken architected timer interrupt trigger
Date: Fri, 02 Sep 2016 18:20:00 +0200
Message-ID: <19742803.nMPmp3hcfz@wuerfel>
References: <1470045256-9032-1-git-send-email-marc.zyngier@arm.com> <1470045256-9032-3-git-send-email-marc.zyngier@arm.com> <CAK7LNARVw+mDhHT2+WjDtHpBvsxauUQpRCJeNLrQxrj0Oo=hrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:57087 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752007AbcIBQVs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 12:21:48 -0400
In-Reply-To: <CAK7LNARVw+mDhHT2+WjDtHpBvsxauUQpRCJeNLrQxrj0Oo=hrQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Marc Zyngier <marc.zyngier@arm.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Hou Zhiqiang <B48286@freescale.com>, Mark Rutland <marc.rutland@arm.com>, Liu Gang <Gang.Liu@nxp.com>, Mingkai Hu <Mingkai.Hu@freescale.com>, Florian Fainelli <f.fainelli@gmail.com>, arm@kernel.org, Kevin Hilman <khilman@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ray Jui <rjui@broadcom.com>

On Monday, August 1, 2016 7:00:50 PM CEST Masahiro Yamada wrote:
> > Acked-by: Duc Dang <dhdang@apm.com>
> > Acked-by: Carlo Caione <carlo@endlessm.com>
> > Acked-by: Michal Simek <michal.simek@xilinx.com>
> > Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> > ---
> >  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi    | 8 ++++----
> >  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi          | 8 ++++----
> >  arch/arm64/boot/dts/apm/apm-storm.dtsi               | 8 ++++----
> >  arch/arm64/boot/dts/broadcom/ns2.dtsi                | 8 ++++----
> >  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi         | 8 ++++----
> >  arch/arm64/boot/dts/exynos/exynos7.dtsi              | 8 ++++----
> >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       | 8 ++++----
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi       | 8 ++++----
> >  arch/arm64/boot/dts/marvell/armada-ap806.dtsi        | 8 ++++----
> >  arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 8 ++++----
> 
> 
> For uniphier-ph1-ld20.dtsi,
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> 

Applied to the fixes branch for 4.8, thanks

	Arnd
