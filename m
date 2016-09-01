From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: exynos: Add missing unit name to memory
 nodes in Exynos4 DTS
Date: Thu, 1 Sep 2016 18:31:34 +0200
Message-ID: <20160901163134.GE12564@kozik-lap>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
 <1472720817-20362-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472720817-20362-7-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 01, 2016 at 11:06:55AM +0200, Javier Martinez Canillas wrote:
> This patch fixes the following DTC warnings:
> 
> "Node /memory has a reg or ranges property, but no unit name"
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/exynos4210-origen.dts         | 2 +-
>  arch/arm/boot/dts/exynos4210-smdkv310.dts       | 2 +-
>  arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidu3.dts       | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidx2.dts       | 2 +-
>  arch/arm/boot/dts/exynos4412-origen.dts         | 2 +-
>  arch/arm/boot/dts/exynos4412-smdk4412.dts       | 2 +-
>  arch/arm/boot/dts/exynos4412-tiny4412.dts       | 2 +-
>  arch/arm/boot/dts/exynos4412-trats2.dts         | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)



Thanks, applied.

Best regards,
Krzysztof
