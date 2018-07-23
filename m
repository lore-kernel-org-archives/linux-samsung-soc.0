From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: exynos: configure max77686 IRQ pin on midas
Date: Mon, 23 Jul 2018 19:13:11 +0200
Message-ID: <20180723171311.mowgm3j3ikdhnj36@kozik-lap>
References: <20180721125128.31498-1-simon@lineageos.org>
 <20180721125128.31498-5-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721125128.31498-5-simon@lineageos.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 21, 2018 at 10:50:52PM +1000, Simon Shields wrote:
> This pin is externally pulled up, so we need to disable the
> SoC's internal pull-down.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-midas.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
