From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 1/7] drm/exynos: rename zpos to index
Date: Mon, 28 Dec 2015 13:34:40 +0100
Message-ID: <56812C60.2070209@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-2-git-send-email-m.szyprowski@samsung.com>
 <567BA9B1.5020607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18390 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751719AbbL1Meo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Dec 2015 07:34:44 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0200HN6IXTCC70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Dec 2015 12:34:41 +0000 (GMT)
In-reply-to: <567BA9B1.5020607@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Hello,

On 2015-12-24 09:15, Inki Dae wrote:
> Seems this patch could be more cleaned up.
>
> Each ctx object of each crtc driver has its own plane config object which includes already zpos value.
> So I think we wouldn't need to keep zpos of the plane config and index of the plane object.
> How about removing index from exynos plane structure and using zpos of exynos plane config structure instead?
>
> Below patch can be applied on top of your patch,

If you want I can move 'index' entry to config object, but the initial 
zpos value
should also be there. Please note that index is not always equal to the 
initial zpos
and having initial zpos configurable is also needed. There were already 
concerns if
mixer's dedicated video plane should be below or above the primary gfx 
plane in the
default configuration.

 > (...)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
