From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/7] ARM: dts: exynos: Add missing unit name to memory
 nodes in Exynos3 DTS
Date: Thu, 1 Sep 2016 18:31:52 +0200
Message-ID: <20160901163152.GF12564@kozik-lap>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
 <1472720817-20362-6-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472720817-20362-6-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 01, 2016 at 11:06:54AM +0200, Javier Martinez Canillas wrote:
> This patch fixes the following DTC warnings:
> 
> "Node /memory has a reg or ranges property, but no unit name"
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 2 +-
>  arch/arm/boot/dts/exynos3250-monk.dts    | 2 +-
>  arch/arm/boot/dts/exynos3250-rinato.dts  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)



Thanks, applied.

Best regards,
Krzysztof
