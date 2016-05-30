From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove unneded always-on for regulators
 on Peach boards
Date: Mon, 30 May 2016 09:58:02 +0200
Message-ID: <574BF28A.5000202@samsung.com>
References: <1463694753-7259-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17557 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753827AbcE3H6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2016 03:58:08 -0400
In-reply-to: <1463694753-7259-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

On 05/19/2016 11:52 PM, Javier Martinez Canillas wrote:
> The regulator always-on property should only be used for regulators
> that either can't be disabled or the drivers for the client devices
> are not enabling the regulator and so being disabled due to unused.
> 
> There are some max77802 regulators in the Peach Pit and Pi boards
> that are always-on but shouldn't since they are enabled by drivers:
> 
> BUCK5 is max77802 inl1 supply
> BUCK7 is max77802 inl{2,10} supply
> BUCK9 is max77802 inl{3,4,5,7} supply
> BUCK10 is mmc1 vqmmc supply
> LDO9 is adc vdd supply
> 
> This patch removes the always-on property for these regulators.
> 
> Some regulators should remain always-on even when they are used as
> input supplies, because these regulators are also used by other
> components that are not described in the DT, for example:
> 
> LDO10 is hdmi vdd_osc supply but it's also used as input supply for
> the Exynos5420 temperature sensor.
> 
> LDO8 is hdmi vdd and vdd_pll supply but it's also used as supply for
> the Exynos5420 Display port.
> 
> BUCK2 and BUCK6 are the vdd supplies for the EAGLE and KFC clusters.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 -----
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 5 -----
>  2 files changed, 10 deletions(-)

Thanks, applied.

Best regards,
Krzysztof
