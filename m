From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Tue, 20 Oct 2015 16:59:32 +0200
Message-ID: <562656D4.1040403@fivetechno.de>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:50735 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751285AbbJTO7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 10:59:45 -0400
In-Reply-To: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Am 20.10.2015 um 11:24 schrieb Alim Akhtar:
> Now we have a nice way to reboot/poweroff system using a generic
> syscon regmap based drivers, this series moves exynos SoCs to
> make use of the same.
> 
> Changes since v1:
> * Added a comment about the register information
> * Droped defconfig changes as disscussed
> * Collected various Reviewed-by, Tested-by and Acked-by tags
> * Added SYSCON-{RESET, POWEROFF} to select from Kconfig
> 
> Alim Akhtar (6):
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
>   ARM: exynos: select POWER_RESET_SYSCON and
>     POWER_RESET_SYSCON_POWEROFF
>   ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs
> 
>  arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
>  arch/arm/mach-exynos/Kconfig      |    3 +++
>  arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
>  6 files changed, 59 insertions(+), 43 deletions(-)
> 

Hi Alim,

I have installed your patch set above with git am on top of 
4.3.0-rc6-00108-gce1fad2 torvalds/linux of today 
with make exynos_defconfig on Odroid U3.

"halt -p" worked (power 0.0W).
"reboot" got stuck at 0.5W.


Without your patch set reboot worked.  


Thanks,
-- 
Markus Reichl
