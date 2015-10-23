From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: Consolidate SRAM bindings from all
 vendors
Date: Sat, 24 Oct 2015 05:05:20 +0900
Message-ID: <562A9300.5060105@kernel.org>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com> <562A8ED8.6060904@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33479 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751392AbbJWUFj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Oct 2015 16:05:39 -0400
In-Reply-To: <562A8ED8.6060904@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, sudeep.holla@arm.com

On 10/24/15 04:47, Kukjin Kim wrote:
> On 10/23/15 10:39, Krzysztof Kozlowski wrote:
>> SRAM bindings for various SoCs, using the mmio-sram genalloc
>> API, are spread over different places - per SoC vendor. Since all of
>> these are quite similar (they depend on mmio-sram) move them to a common
>> place.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Kukjin Kim <kgene@kernel.org>

Acked-by: Kukjin Kim <kgene@kernel.org>

>> Suggested-by: Rob Herring <robh+dt@kernel.org>
>>
> Applied with Heiko and Maxime's ack.
> 
+ Sudeep

Oops, I can't because of ..bindings/arm/arm,scpi.txt, this series should
be handled with "DT binding for ARM System Control and Power
Interface(SCPI) protocol"

- Kukjin
