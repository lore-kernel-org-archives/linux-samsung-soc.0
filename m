From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Explicitly mark Samsung Exynos SoC
 as unstable
Date: Mon, 17 Sep 2018 17:57:49 +0200
Message-ID: <20180917155749.i6jx7k4vo32y56kd@kozik-lap>
References: <20180830180205.18121-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830180205.18121-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 30, 2018 at 08:02:05PM +0200, Krzysztof Kozlowski wrote:
> Samsung Exynos SoCs and boards related bindings evolved since the initial
> introduction, but initially the bindings were minimal and a bit incomplete
> (they never described all the hardware modules available in the SoCs).
> Since then some significant (not fully compatible) changes have been
> already committed a few times (like gpio replaced by pinctrl, display ddc,
> mfc reserved memory, some core clocks added to various hardware modules,
> added more required nodes).
> 
> On the other side there are no boards which have device tree embedded in
> the bootloader. Device tree blob is always compiled from the kernel tree
> and updated together with the kernel image.
> 
> Thus to avoid further adding a bunch of workarounds for old/missing
> bindings, make development of new platforms easier and allow to make
> cleanup of the existing code and device tree files, lets mark some
> Samsung Exynos SoC platform bindings as unstable. This means that
> bindings can may change at any time and users should use the dtb file
> compiled from the same kernel source tree as the kernel image.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> [krzk: Explicitly list unstable bindings instead of marking entire
> Exynos]
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 

Applied.

Best regards,
Krzysztof
