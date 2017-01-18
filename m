From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: exynos: Remove unneeded unit names in
 Exynos5433 nodes
Date: Wed, 18 Jan 2017 18:27:33 +0200
Message-ID: <20170118162733.rfnskad7iltojsda@kozik-lap>
References: <1484754613-2425-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34915 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753080AbdARQ1k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 11:27:40 -0500
Content-Disposition: inline
In-Reply-To: <1484754613-2425-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

On Wed, Jan 18, 2017 at 12:50:13PM -0300, Javier Martinez Canillas wrote:
> The "samsung,exynos5433-mipi-video-phy" and "samsung,exynos5250-dwusb3"
> DT bindings don't specify a reg property for these nodes, so having a
> unit name leads to the following DTC warnings:
> 
> Node /soc/video-phy@105c0710 has a unit name, but no reg property
> Node /soc/usb@15400000 has a unit name, but no reg property
> Node /soc/usb@15a00000 has a unit name, but no reg property
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v3:
>   - Use proper device node names, suggested by Krzysztof.
> 
> Changes in v2:
>   - Fix subject line since I forgot the "exynos" prefix.
> 
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied.

Best regards,
Krzysztof
