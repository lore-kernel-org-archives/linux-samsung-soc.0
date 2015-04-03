From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] Samsung arm64 DT updates for v4.1
Date: Fri, 3 Apr 2015 15:02:14 -0700
Message-ID: <20150403220214.GW23023@localhost>
References: <551C3617.5040306@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:35444 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752626AbbDCWCQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 18:02:16 -0400
Received: by patj18 with SMTP id j18so128115683pat.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 15:02:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551C3617.5040306@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thu, Apr 02, 2015 at 03:16:55AM +0900, Kukjin Kim wrote:
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-64
> 
> for you to fetch changes up to 423c716151e254e42650ad78b30c2cd782c6f654:
> 
>   arm64: dts: Add thermal-zones dt node for exynos5433 (2015-03-27
> 02:13:43 +0900)
> 
> ----------------------------------------------------------------
> Samsung arm64 DT updates for v4.1
> 
> - add new SoC for arm64 based exynos5433 SoC
>   : exynos5433 - Octa cores for big.LITTLE architecture
>   (Quad Cortex-A57 big and Quad Cortex-A53 LITTLE cores)
> 
>   : added thermal-zones, TMU sensor and I2S dt nodes
>   : added ADMA, RTC, ADC, PMU, SPI/PDMA and MSHC dt nodes
>   : added pinctrl, HS-I2C, Serial and basic system dt nodes
> 
> ----------------------------------------------------------------
> Chanwoo Choi (6):
>       arm64: dts: Add dts files for 64-bit Exynos5433 SoC
>       arm64: dts: Add SPI/PDMA dt node for exynos5433
>       arm64: dts: Add PMU dt node for exynos5433
>       arm64: dts: Add RTC and ADC dt node for exynos5433
>       arm64: dts: Add TMU sensor dt node for exynos5433
>       arm64: dts: Add thermal-zones dt node for exynos5433
> 
> Inha Song (2):
>       arm64: dts: Add ADMA dt node for exynos5433
>       arm64: dts: Add I2S dt node for exynos5433
> 
> Jaehoon Chung (1):
>       arm64: dts: Add MSHC dt node for exynos5433
> 
>  .../devicetree/bindings/arm/samsung/pmu.txt        |   1 +
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 698 +++++++++++++++
>  .../dts/exynos/exynos5433-tmu-sensor-conf.dtsi     |  22 +
>  arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     | 231 +++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 931
> +++++++++++++++++++++
>  5 files changed, 1883 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
>  create mode 100644
> arch/arm64/boot/dts/exynos/exynos5433-tmu-sensor-conf.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433.dtsi

How do you even build these dts files? How did you test this branch before you
sent it to us?

Not merged.


-Olof
