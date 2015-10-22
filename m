From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] dt-bindings: Consolidate Exynos SoC bindings under
 Samsung directory
Date: Thu, 22 Oct 2015 09:26:40 +0900
Message-ID: <56282D40.2050504@samsung.com>
References: <1445391051-3727-1-git-send-email-k.kozlowski@samsung.com>
 <CAL_JsqLhbqJOhQrGwg3CZ2Th+wgf3oMR6-2oNNZ98yHNjxsx_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14219 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844AbbJVA0p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 20:26:45 -0400
In-reply-to: <CAL_JsqLhbqJOhQrGwg3CZ2Th+wgf3oMR6-2oNNZ98yHNjxsx_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

On 22.10.2015 09:22, Rob Herring wrote:
> On Tue, Oct 20, 2015 at 8:30 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> Exynos SoC Device Tree bindings are spread over arm/exynos/ and
>> arm/samsung/ directories. There is no need for that separation and it
>> actually confuses. Put everything under arm/samsung/.
> 
> Thanks for the clean-up.
> 
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> ---
>>  .../devicetree/bindings/arm/{exynos => samsung}/power_domain.txt          | 0
>>  Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt    | 0
>>  Documentation/devicetree/bindings/arm/{exynos => samsung}/smp-sysram.txt  | 0
>>  3 files changed, 0 insertions(+), 0 deletions(-)
>>  rename Documentation/devicetree/bindings/arm/{exynos => samsung}/power_domain.txt (100%)
> 
> I'd rather see this with other power domain bindings. So
> bindings/power/pd-samsung.txt I guess.

OK

> 
>>  rename Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt (100%)
>>  rename Documentation/devicetree/bindings/arm/{exynos => samsung}/smp-sysram.txt (100%)
> 
> Probably need to move misc/sram.txt to bindings/sram/ and put both there.

Right, that make sense. I'll send v2 moving pd-samsung and smp-sysram to
these locations.

Best regards,
Krzysztof
