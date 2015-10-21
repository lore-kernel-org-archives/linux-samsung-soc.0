From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Wed, 21 Oct 2015 09:08:53 +0900
Message-ID: <5626D795.5090500@samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21547 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751457AbbJUAJC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 20:09:02 -0400
In-reply-to: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 20.10.2015 18:24, Alim Akhtar wrote:
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

Entire patchset tested on Odroid XU3-Lite and Trats2 boards:

Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
