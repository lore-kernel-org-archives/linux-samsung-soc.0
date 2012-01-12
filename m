From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 0/4] ARM: Exynos4: Add irq domain and device tree
 support for wakeup interrupts
Date: Thu, 12 Jan 2012 13:25:09 +0530
Message-ID: <CAJuYYwTcVFAT2uUV6sLYQgaphNLLYd8+AMFjNEie-nvxJeFX2Q@mail.gmail.com>
References: <1323586301-24537-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:37548 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752685Ab2ALHzK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jan 2012 02:55:10 -0500
Received: by vcbfk14 with SMTP id fk14so1159925vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jan 2012 23:55:10 -0800 (PST)
In-Reply-To: <1323586301-24537-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On 11 December 2011 12:21, Thomas Abraham <thomas.abraham@linaro.org> w=
rote:
> Changes since v1: (only patch 4/4 has changes)
> - Fixes based on Rob's comments:
> =A0a. Fixed the function prototype of exynos4_init_irq_eint(void)
> =A0b. Included interrupt-parent as an optional property for wakeup in=
terrupt
> =A0 =A0 =A0controller node.
>
> Samsung Exynos4 includes 32 external wakeup interrupt sources. This p=
atchset
> adds irq domain and device tree support for these interrupts.
>
> This patchset is based on the following tree.
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t =A0for-next
>
> This patchset should be applied after applying the following patch.
> [PATCH] ARM: Exynos: Add irq domain and device tree support for inter=
rupt combiner
>
> This patchset depends on the following patch from Jamie Iles.
> [PATCH] irqdomain: export irq_domain._simple_op.s for !CONFIG_OF
>
> Thomas Abraham (4):
> =A0arm: exynos4: simplify EINT number to linux irq number translation
> =A0arm: exynos4: add irq_domain support for wakeup interrupts
> =A0arm: exynos4: remove arch_initcall for wakeup interrupt source ini=
tialization
> =A0arm: exynos4: add device tree support for external wakeup interrup=
t controller
>
> =A0.../bindings/arm/samsung/wakeup-eint.txt =A0 =A0 =A0 =A0 =A0 | =A0=
 26 +++++
> =A0arch/arm/mach-exynos/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A06 +-
> =A0arch/arm/mach-exynos/include/mach/regs-gpio.h =A0 =A0 =A0| =A0 =A0=
4 +-
> =A0arch/arm/mach-exynos/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 98 ++++++++++----------
> =A0arch/arm/plat-samsung/include/plat/exynos4.h =A0 =A0 =A0 | =A0 =A0=
4 +
> =A05 files changed, 86 insertions(+), 52 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/samsung/w=
akeup-eint.txt

Hi,

This patchset adds dt and irq-domain support for exynos4 wakeup (eint)
interrupts. If there any comments on this patchset, please let me
know.

Thanks,
Thomas.
