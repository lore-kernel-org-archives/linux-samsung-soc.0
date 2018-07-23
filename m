From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos: add max77693 pinctrl config for
 midas
Date: Mon, 23 Jul 2018 19:12:32 +0200
Message-ID: <20180723171232.xtko4ek2jxxquuwu@kozik-lap>
References: <20180721125128.31498-1-simon@lineageos.org>
 <20180721125128.31498-2-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721125128.31498-2-simon@lineageos.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 21, 2018 at 10:50:49PM +1000, Simon Shields wrote:
> Currently, we assume that the bootloader has correctly configured
> the interrupt pin for max77693. This might not actually be the case -
> so it's better to configure it explicitly.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-midas.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
