From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: add exynos4210 specific extensions for
 samsung pinctrl driver
Date: Tue, 21 Aug 2012 14:02:18 +0200
Message-ID: <CACRpkdYiJOkHrjZ22_0onRHc0ApmBLj+tXPa4SrPo2h0d=fJHA@mail.gmail.com>
References: <1345060656-32201-1-git-send-email-thomas.abraham@linaro.org>
	<1345060656-32201-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:35791 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756572Ab2HUMCT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Aug 2012 08:02:19 -0400
Received: by vcbfk26 with SMTP id fk26so6012921vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 05:02:18 -0700 (PDT)
In-Reply-To: <1345060656-32201-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On Wed, Aug 15, 2012 at 9:57 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Add information about the Exynos4210 pin banks and driver data which is
> used by the Samsung pinctrl driver. In addition to this, the support for
> external gpio and wakeup interrupt support is included and hooked up with
> the Samsung pinctrl driver.

OK...

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> +config PINCTRL_EXYNOS4
> +       bool "Pinctrl driver data for Exynos4 SoC"
> +       depends on ARCH_EXYNOS4 && OF

Since you depend on PINCTRL_SAMSUNG which depends
on OF you don't need to depend on OF here.

> +       depends on PINCTRL_SAMSUNG
> +       select PINMUX
> +       select PINCONF

So as noted in the main driver, let PINCTRL_SAMSUNG
select PINMUX and PINCONF and you need only select
PINCTRL_SAMSUNG here.

> diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
(...)
> +#include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irq.h>
> +#include <linux/of_irq.h>

Do you need these includes? Didn't you put them
all in "pinctrl-samsung.h"?

Overall this looks good and straight-forward, but I cannot figure
out how the samsung_pinctrl_soc_data is passed to the main
driver, it seems to be through some DT node but I cannot figure
this out. Can you explain this?

Yours,
Linus Walleij
