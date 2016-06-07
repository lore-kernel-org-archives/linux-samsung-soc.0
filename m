From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/2] ARM: dts: exynos: Fix port nodes names for Snow and
 Peach Pit DTS
Date: Tue, 07 Jun 2016 08:16:11 +0200
Message-ID: <575666AB.8080304@samsung.com>
References: <1465244684-23612-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62246 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112AbcFGGQQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 02:16:16 -0400
In-reply-to: <1465244684-23612-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

On 06/06/2016 10:24 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> This small series fixes the lookup for the lvds-to-eDP bridge found in
> the Exynos5250 Snow and Exynos5420 Peach Pit Chromebooks. The problem
> was introduced by the commits that fixed the recent DTC warnings and
> it was that the OF graph logic expects the nodes to always be called
> 'port'.
> 
> So the correct fix for the DTC warnings is to add a '#address-cells',
> '#size-cells' and 'reg' properties when there is more than one port.
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (2):
>   ARM: dts: exynos: Fix port nodes names for Exynos5250 Snow board
>   ARM: dts: exynos: Fix port nodes names for Exynos5420 Peach Pit board
> 
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 13 ++++++++++---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts    | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)

Thanks for fixes. Applied both for v4.7.

Best regards,
Krzysztof
