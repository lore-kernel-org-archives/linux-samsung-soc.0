From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/4] arm64: dts: exynos: DeviceTree ARM64 for v4.9
Date: Wed, 14 Sep 2016 16:52:07 +0200
Message-ID: <2355200.e1COboIX4U@wuerfel>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com> <1472548739-20050-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:64013 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756249AbcINOwr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 10:52:47 -0400
In-Reply-To: <1472548739-20050-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Tuesday, August 30, 2016 11:18:58 AM CEST Krzysztof Kozlowski wrote:
> This is an old one. It was ready for v4.8 but then Marc Zynger posted
> some conflicting change so I postponed it. Marc's patch didn't get in,
> so there is no reason to wait.
> 
> No conflict expected yet, but if you apply Marc's "arm64: dts: Fix
> broken architected timer interrupt trigger" then proper resolution would be:
> 
> arch/arm64/boot/dts/exynos/exynos7.dtsi:
> 
> +                       interrupts = <GIC_PPI 13
> +                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 14
> +                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 11
> +                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 10
> +                                       (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> 
> 
> Best regards,
> Krzysztof
> 
> The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:
> 
>   Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.9
> 
> for you to fetch changes up to 36d1c9cd07cd6a065f1dde3cbbfe3a9867d693a4:
> 
>   arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags (2016-08-10 11:09:46 +0200)
> 

Pulled into next/dt64, thanks!

	Arnd
