From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/4] ARM: dts: exynos: specify snps,dwmac in compatible
 string for gmac
Date: Wed, 23 Nov 2016 19:19:22 +0200
Message-ID: <20161123171922.GA4408@kozik-lap>
References: <1479911091-19812-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479911091-19812-1-git-send-email-niklass@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Niklas Cassel <niklass@axis.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Nov 23, 2016 at 03:24:51PM +0100, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@axis.com>
> 
> devicetree binding for stmmac states:
> - compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac"
> 	For backwards compatibility: "st,spear600-gmac" is also supported.
> 
> No functional change intended.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Thanks, applied.

Best regards,
Krzysztof
