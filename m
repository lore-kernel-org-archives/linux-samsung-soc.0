From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 00/10] ARM: dts: exynos: Fix invalid GIC interrupt
 flags
Date: Thu, 3 Nov 2016 23:21:47 +0200
Message-ID: <20161103212147.GA15161@kozik-lap>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Alban Browaeys <alban.browaeys@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 16, 2016 at 09:42:41PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Marek (internally), Geert and Alban reported errors like:
> 	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)
> The patchset fixes this issue.
> 
> Tested on:
> 1. Exynos4412: Odroid U3,
> 2. Exynos5410: Odroid XU,
> 3. Exynos5422: Odroid XU3.
> 
> Other platforms not tested so testing would be highly appreciated.

Applied entire patchset for v4.10. Let it boil for some time in
linux-next.

Best regards,
Krzysztof
