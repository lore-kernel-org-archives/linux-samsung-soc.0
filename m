From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESPIN 1/6] dt-bindings: EXYNOS: Add exynos-srom device tree
 binding
Date: Mon, 04 Apr 2016 12:35:07 +0900
Message-ID: <5701E0EB.4020807@samsung.com>
References: <1456389222-12738-1-git-send-email-pankaj.dubey@samsung.com>
 <1456389222-12738-2-git-send-email-pankaj.dubey@samsung.com>
 <20160302175319.GA11155@rob-hp-laptop> <56DA63A6.80703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24867 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022AbcDDDfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 23:35:17 -0400
In-reply-to: <56DA63A6.80703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>, Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, thomas.ab@samsung.com, olof@lixom.net, p.fedin@samsung.com, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On 05.03.2016 13:42, pankaj.dubey wrote:
> Hi,
> 
> On Wednesday 02 March 2016 11:23 PM, Rob Herring wrote:
>> On Thu, Feb 25, 2016 at 02:03:37PM +0530, Pankaj Dubey wrote:
>>> This patch adds exynos-srom binding information for SROM Controller
>>> driver on Exynos SoCs.
>>>
>>> CC: Rob Herring <robh+dt@kernel.org>
>>> CC: Mark Rutland <mark.rutland@arm.com>
>>> CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
>>> CC: devicetree@vger.kernel.org
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Signed-off-by: Kukjin Kim <kgene@kernel.org>
>>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> ---
>>>  .../devicetree/bindings/memory-controllers/exynos-srom.txt   | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
>>> new file mode 100644
>>> index 0000000..33886d5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
>>> @@ -0,0 +1,12 @@
>>> +SAMSUNG Exynos SoCs SROM Controller driver.
>>> +
>>> +Required properties:
>>> +- compatible : Should contain "samsung,exynos-srom".
>>
>> There should be SoC specific compatible strings in addition to this.
>>
> 
> I do not understood need to additional need to SoC specific compatible,
> as of now all SoCs having SROM can work with exynos specific common
> compatible. Will you see any issues in this?

Dear Rob, Pankaj,

I would like to proceed with this patchset. I guess your comment here
was about to change the compatible from generic exynos-like to a model
specific. How about this:
- compatible : Should contain "samsung,exynos4210-srom".

Is this okay?

(the oldest chip mentioning SROM controller as separate block is Exynos4210)


Best regards,
Krzysztof
