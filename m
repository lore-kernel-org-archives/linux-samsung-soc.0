From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 0/2] Add pinctrl support to Exynos5420
Date: Wed, 19 Jun 2013 11:31:48 +0200
Message-ID: <1968809.6v0D5cHJqj@amdc1227>
References: <1371625929-12906-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:15098 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933830Ab3FSJb7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 05:31:59 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOM006EYVT9E0A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 10:31:57 +0100 (BST)
In-reply-to: <1371625929-12906-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

Hi Leela,

On Wednesday 19 of June 2013 12:42:07 Leela Krishna Amudala wrote:
> This patchset adds the pinctrl support to Exynos5420.
> This series is rebased and tested on for-next branch of kgene tree.
> 
> Changes since V2:
> 	- As Tomasz figa suggested, changed the sd0_bus4, sd1_bus4 and sd2_bus4
> 	  nodes in pinctrl file so that gpio pins don't overlap between groups.
> 	- GPIO interrupt register offsets are added for exynos5420_pin_ctrl
> structure - Changed the gpio pin count from 8 to 7 for gpz
> 	- Added Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 	- Removed the patch "gpio: samsung: skip gpiolib registration if pinctrl
> support is enabled for exynos5420" from the series.
> 
> Changes since V1:
> 	- As gpy7 bank supports interrupts, it is defined using EINTG macro
> 
> Leela Krishna Amudala (2):
>   ARM: dts: add pinctrl support to Exynos5420
>   pinctrl: exynos: add exynos5420 SoC specific data
> 
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |  680
> ++++++++++++++++++++ arch/arm/boot/dts/exynos5420.dtsi                  |  
> 45 ++
>  drivers/pinctrl/pinctrl-exynos.c                   |  118 ++++
>  drivers/pinctrl/pinctrl-samsung.c                  |    2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |    1 +
>  6 files changed, 847 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5420-pinctrl.dtsi

Looks good. Thanks.

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
