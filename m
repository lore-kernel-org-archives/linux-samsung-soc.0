From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 06/10] ARM: dts: exynos: Fix invalid GIC interrupt flags
 in exynos5
Date: Sun, 18 Sep 2016 11:17:04 -0400
Message-ID: <c64744b1-eab5-350b-7f87-86c159abffb6@osg.samsung.com>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
 <1474054971-16831-7-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:50603
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932796AbcIRPRV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Sep 2016 11:17:21 -0400
In-Reply-To: <1474054971-16831-7-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Alban Browaeys <alban.browaeys@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>

Hello Krzysztof,

On 09/16/2016 03:42 PM, Krzysztof Kozlowski wrote:
> Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts and
> generates an error:
> 	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)
> 
> The GIC requires shared interrupts to be edge rising or level high.
> Platform declares support for both.  Choose level high everywhere.
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Alban Browaeys <alban.browaeys@gmail.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

I tested this patch on an Exynos5800 Peach Pi Chromebook and
an Exynos5422 Odroid XU4 board and no regressions were found.

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
