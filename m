From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Consolidate SRAM bindings from all vendors
Date: Thu, 22 Oct 2015 08:51:02 -0500
Message-ID: <CAL_Jsq+S6cCSo_rqsr36uGBo4dE8M9wqFdn=eV3XeHgjqS0pkA@mail.gmail.com>
References: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
 <20151022090529.GV10947@lukather> <5628AA23.5070608@samsung.com> <20151022133447.GZ10947@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59044 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757682AbbJVNvZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Oct 2015 09:51:25 -0400
In-Reply-To: <20151022133447.GZ10947@lukather>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>

On Thu, Oct 22, 2015 at 8:34 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Oct 22, 2015 at 06:19:31PM +0900, Krzysztof Kozlowski wrote:
>> On 22.10.2015 18:05, Maxime Ripard wrote:
>> > Hi,
>> >
>> > On Thu, Oct 22, 2015 at 10:25:28AM +0900, Krzysztof Kozlowski wrote:
>> >> SRAM bindings for various SoCs, using the mmio-sram genalloc
>> >> API, are spread over different places - per SoC vendor. Since all of
>> >> these are quite similar (they depend on mmio-sram) move them to a common
>> >> place.
>> >>
>> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> >> Cc: Heiko Stuebner <heiko@sntech.de>
>> >> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> >> Cc: Chen-Yu Tsai <wens@csie.org>
>> >> Cc: Kukjin Kim <kgene@kernel.org>
>> >> Suggested-by: Rob Herring <robh+dt@kernel.org>
>> >>
>> >> ---
>> >>
>> >> Changes since v1:
>> >> 1. New patch. Extended suggestion from Rob.
>> >> ---
>> >>  .../bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt}    | 0
>> >>  .../bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt}    | 0
>> >>  .../bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt}         | 0
>> >>  Documentation/devicetree/bindings/{misc => sram}/sram.txt                 | 0
>> >>  .../devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt}       | 0
>> >>  5 files changed, 0 insertions(+), 0 deletions(-)
>> >>  rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt} (100%)
>> >>  rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt} (100%)
>> >>  rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt} (100%)
>> >>  rename Documentation/devicetree/bindings/{misc => sram}/sram.txt (100%)
>> >>  rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt} (100%)
>> >
>> > I'm not sure about that one. The SRAM bindins we have for sunxi is for
>> > an SRAM controller, that maps the SRAM either to the CPU or to the
>> > devices.
>> >
>> > It's not really related to the other users, and wouldn't it be
>> > confusing to have a driver in drivers/soc, and a Documentation in
>> > another sub-directory?
>>
>> I guess the only relation to other users is the "mmio-sram". In the same
>> time this is still similar to e.g. Samsung's sram bindings (where the
>> memory is mapped to CPU only).
>>
>> Being located in drivers/soc is not an issue here - code for other
>> vendors may be moved there as well in the future.
>>
>> Of course I do not insist. Actually Rob's comment was only about moving
>> sram.txt and Samsung's sram to common place.

I certainly appreciate your finding other instances.

>> Anyway I will be sending v3 of these because while looking more
>> carefully I found hard-coded paths to bindings/misc/sram.txt. I'll fix
>> it in next version.
>
> I didn't really have the context. If Rob feels like we should do that,
> then go ahead.

I'm trying to group by binding type rather than arch or vendor for
common bindings. I think bindings/sram is fine to host both ctrlr and
memory range bindings.

Rob
