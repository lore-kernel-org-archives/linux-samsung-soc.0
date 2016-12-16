From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] Documentation: dt: Explicitly mark Samsung Exynos SoC
 bindings as unstable
Date: Fri, 16 Dec 2016 15:27:13 +0100
Message-ID: <2984700.McujOSQ7LH@amdc3058>
References: <CGME20161216141453epcas1p28d5ebc9d62f5a704bb9bc64ca68abcdf@epcas1p2.samsung.com>
 <1481897676-13578-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33079 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756770AbcLPO1T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 09:27:19 -0500
In-reply-to: <1481897676-13578-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>


Hi,

On Friday, December 16, 2016 03:14:36 PM Marek Szyprowski wrote:
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
> bindings and allow to make cleanup of the existing code and device tree
> files, lets mark Samsung Exynos SoC platform bindings as unstable. This
> means that bindings can may change at any time and users should use the
> dtb file compiled from the same kernel source tree as the kernel image.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

This change is long overdue..

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> ---
>  Documentation/devicetree/bindings/arm/samsung/exynos.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos.txt b/Documentation/devicetree/bindings/arm/samsung/exynos.txt
> new file mode 100644
> index 000000000000..0c606f4c6e85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos.txt
> @@ -0,0 +1,12 @@
> +Samsung Exynos SoC Family Device Tree Bindings
> +---------------------------------------------------------------
> +
> +Work in progress statement:
> +
> +Device tree files and bindings applying to Samsung Exynos SoCs and boards are
> +considered "unstable". Any Samsung Exynos device tree binding may change at any
> +time. Be sure to use a device tree binary and a kernel image generated from the
> +same source tree.
> +
> +Please refer to Documentation/devicetree/bindings/ABI.txt for a definition of a
> +stable binding/ABI.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
