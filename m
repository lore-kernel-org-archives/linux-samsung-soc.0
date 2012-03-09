From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 0/4] ARM: Exynos4: Add irq domain and device tree support
 for wakeup interrupts
Date: Fri, 09 Mar 2012 08:32:56 -0800
Message-ID: <4F5A30B8.6060801@samsung.com>
References: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43699 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757566Ab2CIQdB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:33:01 -0500
Received: by yhmm54 with SMTP id m54so937584yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:33:01 -0800 (PST)
In-Reply-To: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On 02/22/12 04:14, Thomas Abraham wrote:
> Changes since v2:
> - Reworked irq domain support based on v5 of the irq_domain generalization
>    patches.
>
> Changes since v1: (only patch 4/4 has changes)
> - Fixes based on Rob's comments:
>    a. Fixed the function prototype of exynos4_init_irq_eint(void)
>    b. Included interrupt-parent as an optional property for wakeup interrupt
>        controller node.
>
> Samsung Exynos4 includes 32 external wakeup interrupt sources. The first 16
> of these interrupts are connected to GIC SPI[31:16]. The last 16 of these
> interrupts are grouped together into one interrupt and connected to GIC
> SPI[32].
>
> This patchset adds irq domain and device tree support for these interrupts.
> Since there are users of fixed linux irq numbers of the external wakeup
> interrupts, the legacy mapping is used for the irq domain.
>
> This patchset is based on
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git [for-next]
>
> with all irq_domain (v5) patches merged from
> http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]
>
> This patchset should be applied after applying the following patch.
> [PATCH] ARM: Exynos: Add irq domain and device tree support for interrupt combiner

Looks ok to me this series, but I lost above patch in my mail box.
Thomas, could you please send updated it so that I can apply this series?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>
> Thomas Abraham (4):
>    ARM: Exynos4: Simplify EINT number to linux irq number translation
>    ARM: Exynos4: Add irq_domain support for gpio wakeup interrupts
>    ARM: Exynos4: Remove arch_initcall for wakeup interrupt initialization
>    ARM: Exynos4: Add device tree support for gpio wakeup interrupt controller
>
>   .../bindings/arm/samsung/wakeup-eint.txt           |   37 +++++
>   arch/arm/mach-exynos/common.c                      |  148 ++++++++++++--------
>   arch/arm/mach-exynos/include/mach/regs-gpio.h      |    4 +-
>   3 files changed, 131 insertions(+), 58 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
