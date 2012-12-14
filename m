From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/3] pinctrl: exynos: add support for Samsung's Exynos5250
Date: Fri, 14 Dec 2012 12:51:27 +0100
Message-ID: <2775095.1QDAgbYSYJ@amdc1227>
References: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14785 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309Ab2LNLvf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 06:51:35 -0500
In-reply-to: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Hi Thomas,

On Thursday 13 of December 2012 17:24:01 Thomas Abraham wrote:
> This patch series adds pinctrl driver support for Samsung's Exynos5250
> SoC. The first patch adds the required Exynos5250 SoC specific data
> which is used by the Samsung pinctrl driver to setup the
> pinctrl/pinmux/eint controllers. The second and third patches skips the
> wakeup interrupt and gpiolib registration if the pinctrl support is
> enabled for Exynos5250.
> 
> Thomas Abraham (3):
>   pinctrl: exynos: add exynos5250 SoC specific data
>   gpio: samsung: skip gpiolib registration if pinctrl support is enabled
> for exynos5250 arm: exynos: skip wakeup interrupt registration for
> exynos5250 if pinctrl is enabled
> 
>  arch/arm/mach-exynos/common.c     |    1 +
>  drivers/gpio/gpio-samsung.c       |    1 +
>  drivers/pinctrl/pinctrl-exynos.c  |  108
> +++++++++++++++++++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c
> |    2 +
>  drivers/pinctrl/pinctrl-samsung.h |    1 +
>  5 files changed, 113 insertions(+), 0 deletions(-)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Looks good. For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
