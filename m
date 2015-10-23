From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: Consolidate SRAM bindings from all vendors
Date: Fri, 23 Oct 2015 12:49:29 +0200
Message-ID: <1694120.gDU4knuKKT@diego>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34540 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752167AbbJWKtt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Oct 2015 06:49:49 -0400
In-Reply-To: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Am Freitag, 23. Oktober 2015, 10:39:19 schrieb Krzysztof Kozlowski:
> SRAM bindings for various SoCs, using the mmio-sram genalloc
> API, are spread over different places - per SoC vendor. Since all of
> these are quite similar (they depend on mmio-sram) move them to a common
> place.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Update paths to sram.txt.
> 
> Changes since v1:
> 1. New patch. Extended suggestion from Rob.
> ---

> .../bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt} 
> .../bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt} 

for the Rockchip parts
Acked-by: Heiko Stuebner <heiko@sntech.de>
