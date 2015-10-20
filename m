From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 04/10] dt-bindings: video: add PCLK clock entry to exynos5433-decon
Date: Tue, 20 Oct 2015 21:48:22 +0900
Message-ID: <CAJKOXPfWCysCNkuNgLauiEJKgsknntwZk6qyOQc8mhh9aQdG7g@mail.gmail.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
	<1445332961-25419-5-git-send-email-a.hajda@samsung.com>
	<5626327E.3050002@samsung.com>
	<56263691.1080804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:36010 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbbJTMsX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 08:48:23 -0400
In-Reply-To: <56263691.1080804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

2015-10-20 21:41 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> On 10/20/2015 02:24 PM, Krzysztof Kozlowski wrote:
>> W dniu 20.10.2015 o 18:22, Andrzej Hajda pisze:
>>> DECON IP requires this clock to access configuration registers.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> index 377afbf..3dff78b 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> @@ -16,7 +16,7 @@ Required properties:
>>>  - clocks: must include clock specifiers corresponding to entries in the
>>>        clock-names property.
>>>  - clock-names: list of clock names sorted in the same order as the clocks
>>> -           property. Must contain "aclk_decon", "aclk_smmu_decon0x",
>>> +           property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
>> I assume that old DTB wouldn't work at all, so there is no point in
>> maintaining ABI compatibility?
>
> Yes, Exynos 5433 has not yet landed in mainline.

No, no. I was asking if something using these compatibles would work
previously or not? The driver provided a compatible, an ABI. Now you
require additional field for the same compatible, so the ABI changes.

Best regards,
Krzysztof
