From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: dt: Explicitly mark Samsung Exynos SoC
 bindings as unstable
Date: Tue, 20 Dec 2016 21:36:29 -0600
Message-ID: <20161221033629.xny3xnwhvkgcdlv7@rob-hp-laptop>
References: <1481897676-13578-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34974 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752700AbcLUDge (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 22:36:34 -0500
Content-Disposition: inline
In-Reply-To: <1481897676-13578-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Fri, Dec 16, 2016 at 03:14:36PM +0100, Marek Szyprowski wrote:
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

I'd like this to be more explicit about which bindings in particular are 
not considered stable (or which ones are). "exynos" covers lots of 
things.

I'll still complain if commit messages don't say explicitly that the 
commit breaks compatibility and why that is okay.

Rob
