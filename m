From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V4 0/4] exynos dwmmc device tree node cleanup
Date: Tue, 03 Sep 2013 10:11:20 +0200
Message-ID: <1530001.y8QaeTojjb@flatron>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:54186 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574Ab3ICILZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 04:11:25 -0400
In-Reply-To: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Hi Yuvaraj,

On Tuesday 03 of September 2013 11:34:20 Yuvaraj Kumar C D wrote:
> changes from V3:
> 	1.Added two new patch in the series
> 		[1] ARM: dts: Move fifo-depth property from board dts
>  		[2] ARM: dts: rename mmc dts node for exynos5 series
> changes from V2:
> 	1.remove from exynos5.dtsi and add in exynos5250.dtsi
> 	  in single patch.Suggested by Tomasz Figa.
> 	2.Separate patch for changing status property of dwmmc node
> 	  in smdk5250 and arndale board dts file.
> 
> V1 Patches:
> 1.[PATCH 1/2] ARM: dts: remove dwmmc nodes from exynos5 common dts file.
> http://www.spinics.net/lists/linux-samsung-soc/msg21602.html
> 2.[PATCH 2/2] ARM: dts: Add dwmmc nodes in SOC specific dts file
> 	http://www.spinics.net/lists/linux-samsung-soc/msg21603.html
> 
> Yuvaraj Kumar C D (4):
>   ARM: dts: Move dwmmc nodes from exynos5.dtsi to exynos5250.dtsi
>   ARM: dts: exynos: change status property of dwmmc nodes
>   ARM: dts: Move fifo-depth property from board dts
>   ARM: dts: rename mmc dts node for exynos5 series
> 
>  arch/arm/boot/dts/cros5250-common.dtsi    |    8 +++----
>  arch/arm/boot/dts/exynos5.dtsi            |   21 -----------------
>  arch/arm/boot/dts/exynos5250-arndale.dts  |   16 ++++---------
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 ++++---------
>  arch/arm/boot/dts/exynos5250-snow.dts     |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi         |   36
> ++++++++++++++++++++++------- 6 files changed, 41 insertions(+), 58
> deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
