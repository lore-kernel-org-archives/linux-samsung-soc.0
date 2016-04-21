From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: add exynos5420-fimd compatible
Date: Thu, 21 Apr 2016 12:06:38 +0200
Message-ID: <5718A62E.6020906@samsung.com>
References: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
 <1455283900-6913-3-git-send-email-chanho61.park@samsung.com>
 <56C12287.8050900@samsung.com> <56C14D18.1040508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47026 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbcDUKGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 06:06:44 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5Z001FTAR45310@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2016 11:06:40 +0100 (BST)
In-reply-to: <56C14D18.1040508@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Chanho Park <chanho61.park@samsung.com>

On 02/15/2016 04:59 AM, Krzysztof Kozlowski wrote:
> On 15.02.2016 09:57, Krzysztof Kozlowski wrote:
>> On 12.02.2016 22:31, Chanho Park wrote:
>>> This patch changes the compatible of exynos5420 fimd
>>> to "exynos5420-fimd". To support mic bypass from display
>>> path, the new compatible is introduced for exynos5420.
>>>
>>> Cc: Inki Dae <inki.dae@samsung.com>
>>> Cc: Kukjin Kim <kgene@kernel.org>
>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/exynos5420.dtsi | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>
>> Looks okay to me and also looks independent from patch #1. I will apply
>> it for late v4.6 if patch #1 got accepted by Inki.
>>
>> Anyway, for reference:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Stupid me, of course it cannot go independently through my tree. Please
> feel free to take it through drm-exynos with my reviewed-by tag.

Inki did not pick it up, so applied now for late v4.7.

Best regards,
Krzysztof
