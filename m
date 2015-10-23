From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: Consolidate SRAM bindings from all vendors
Date: Fri, 23 Oct 2015 16:33:11 -0500
Message-ID: <CAL_JsqKPd2vRZO-Y3aZKmS=RpKsg5+9+UHSQbb3yObB_VM0Dcw@mail.gmail.com>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
 <562A8ED8.6060904@kernel.org> <562A9300.5060105@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562A9300.5060105@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 23, 2015 at 3:05 PM, Kukjin Kim <kgene@kernel.org> wrote:
> On 10/24/15 04:47, Kukjin Kim wrote:
>> On 10/23/15 10:39, Krzysztof Kozlowski wrote:
>>> SRAM bindings for various SoCs, using the mmio-sram genalloc
>>> API, are spread over different places - per SoC vendor. Since all of
>>> these are quite similar (they depend on mmio-sram) move them to a common
>>> place.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Cc: Heiko Stuebner <heiko@sntech.de>
>>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>>> Cc: Chen-Yu Tsai <wens@csie.org>
>>> Cc: Kukjin Kim <kgene@kernel.org>
>
> Acked-by: Kukjin Kim <kgene@kernel.org>
>
>>> Suggested-by: Rob Herring <robh+dt@kernel.org>
>>>
>> Applied with Heiko and Maxime's ack.
>>
> + Sudeep
>
> Oops, I can't because of ..bindings/arm/arm,scpi.txt, this series should
> be handled with "DT binding for ARM System Control and Power
> Interface(SCPI) protocol"

I'll take it after the merge window.

Rob
