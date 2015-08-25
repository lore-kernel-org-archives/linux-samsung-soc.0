From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/7] phy: exynos-usb2: add vbus regulator support
Date: Tue, 25 Aug 2015 15:12:13 +0900
Message-ID: <55DC073D.8050909@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
 <1440160723-6636-2-git-send-email-m.szyprowski@samsung.com>
 <55D71D3E.3010807@ti.com> <55DC0173.9030702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62520 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752039AbbHYGMV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 02:12:21 -0400
In-reply-to: <55DC0173.9030702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Kamil Debski <k.debski@samsung.com>

On 25.08.2015 14:47, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-08-21 14:44, Kishon Vijay Abraham I wrote:
>> On Friday 21 August 2015 06:08 PM, Marek Szyprowski wrote:
>>> Exynos USB2 PHY has separate power supply, which is usually provided by
>>> VBUS regulator. This patch adds support for it. VBUS regulator is
>>> optional, to keep compatibility with boards, which have VBUS provided
>>> from some always-on power source.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   .../devicetree/bindings/phy/samsung-phy.txt        |  3 +++
>>>   drivers/phy/phy-samsung-usb2.c                     | 25
>>> ++++++++++++++++++++--
>>>   drivers/phy/phy-samsung-usb2.h                     |  2 ++
>>>   3 files changed, 28 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>>> b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>>> index 60c6f2a633e0..0289d3b07853 100644
>>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>>> @@ -44,6 +44,9 @@ Required properties:
>>>       - the "ref" clock is used to get the rate of the clock provided
>>> to the
>>>         PHY module
>>>   +Optional properties:
>>> +- vbus-supply: power-supply phandle for vbus power source
>> how about using phy-supply?
> 
> I wanted to make it a bit more descriptive (vbus-supply is rather self
> explaining name)
> and keep it in line with Exynos usb3-drd phy, which already supports
> vbus-supply.
> If you think that this is a bad idea, a will use phy-supply then.

This is actually supply for VBUS, not for the phy. Using phy-supply
would work fine and reduce the size of code... but would be rather a
hacky-use of phy and it could be misleading.

I don't have strong feeling about this, both ideas have its advantages.
If I had to choose than I would like to use vbus-supply because of its
correctness with real-world (this is a VBUS after all).

Best regards,
Krzysztof
