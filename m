From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/3] pinctrl: exynos: add support for Samsung's
 Exynos5250
Date: Thu, 07 Mar 2013 09:11:44 +0900
Message-ID: <014101ce1ac8$5a4e8600$0eeb9200$%kim@samsung.com>
References: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56865 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755242Ab3CGALq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 19:11:46 -0500
In-reply-to: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, t.figa@samsung.com, patches@linaro.org

Thomas Abraham wrote:
> 
> Changes since v1:
> - Change the compatible string from "samsung,pinctrl-exynos5250" to
>   "samsung,exynos5250-pinctrl".
> - Rebased to v3.9-rc1
> 

Thomas, this stuff is already in my tree for v3.10, and above changes
included in there. Do you want to replace with this patches?

- Kukjin

> This patch series add pinctrl driver support for Samsung's Exynos5250 SoC.
> The first patch adds the required Exynos5250 SoC specific data which is
> used by the Samsung pinctrl driver to setup the pinctrl/pinmux/eint
> controllers. The second and third patches skips the wakeup interrupt and
> gpiolib registration if the pinctrl support is enabled for Exynos5250.
> 
> Thomas Abraham (3):
>   pinctrl: exynos: add exynos5250 SoC specific data
>   gpio: samsung: skip gpiolib registration if pinctrl support is enabled
> for exynos5250
>   arm: exynos: skip wakeup interrupt registration for exynos5250 if
> pinctrl is enabled
> 
>  arch/arm/mach-exynos/common.c     |    1 +
>  drivers/gpio/gpio-samsung.c       |    1 +
>  drivers/pinctrl/pinctrl-exynos.c  |  108
> +++++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-samsung.c |    2 +
>  drivers/pinctrl/pinctrl-samsung.h |    1 +
>  5 files changed, 113 insertions(+), 0 deletions(-)
