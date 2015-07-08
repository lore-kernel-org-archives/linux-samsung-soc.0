From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] ARM: dts: Extend exynos5250-pinctrl nodes using labels
 instead of paths
Date: Thu, 09 Jul 2015 08:53:49 +0900
Message-ID: <559DB80D.20702@samsung.com>
References: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
 <1436333790-18219-3-git-send-email-javier@osg.samsung.com>
 <559CDF66.6080609@samsung.com> <559D2E39.6060602@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17692 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbbGHXxv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jul 2015 19:53:51 -0400
In-reply-to: <559D2E39.6060602@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 08.07.2015 23:05, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 07/08/2015 01:29 AM, Krzysztof Kozlowski wrote:
>> On 08.07.2015 14:36, Javier Martinez Canillas wrote:
>>> A previously defined Device Tree node, can be extended either by defining
>>> a node using the same full path or by creating a label for the node and
>>> referencing to it.
>>>
>>> Using full paths is more error prone since if there was a typo error, a
>>> new node will be created instead of extending the node as it was desired.
>>> This will lead to run-time errors that could be hard to detect.
>>>
>>> A misstyped label on the other hand, will cause a dtc compile error which
>>
>> s/misstyped/mistyped/
>>
> 
> sigh, it's so ironic that I mistyped that.
> 
> Do you want me to re-post the whole series with the typo fixed or you /
> Kukjin would fix in both patches when applying?

I'll fix it when applying to my tree. As for Kukjin, it depends whether
he will pick it up from LKML or from me.

Best regards,
Krzysztof
