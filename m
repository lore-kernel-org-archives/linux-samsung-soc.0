From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: dp: Fix panel and bridge lookup logic
Date: Mon, 08 Feb 2016 13:38:11 +0100
Message-ID: <56B88C33.8060808@samsung.com>
References: <1454080171-23769-1-git-send-email-javier@osg.samsung.com>
 <56B88418.7090106@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47047 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbcBHMiQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Feb 2016 07:38:16 -0500
In-reply-to: <56B88418.7090106@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Hi Javier,

On 2016-02-08 13:03, Javier Martinez Canillas wrote:
> Hello Inki,
>
> On 01/29/2016 12:09 PM, Javier Martinez Canillas wrote:
>> Commit a9fa852886fd ("drm/exynos: dp: add of_graph dt binding support
>> for panel") made the Exynos DP DT binding more consistent since the OF
>> graph could be used to lookup either a panel or a bridge device node.
>>
>> Before that commit, a panel would be looked up using a phandle and a
>> bridge using the OF graph which made the DT binding not consistent.
>>
>> But the patch broke the later case since not finding a panel dev node
>> would cause the driver's to do a probe deferral instead of attempting
>> to lookup a bridge device node associated with the remote endpoint.
>>
>> So instead of returning a -EPROBE_DEFER if a panel is not found, check
>> if there's a bridge and only do a probe deferral if both aren't found.
>>
>> Fixes: a9fa852886fd ("drm/exynos: dp: add of_graph dt binding support 
>> for panel")
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>
> Any comments about this patch? It is needed to have display working on
> machines with a bridge chip again so it should be pushed to -rc ASAP.

Please check v4.5-rc3, this patch is already merged there.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
