From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] of: reserved_mem: restore old behavior when no region is
 defined
Date: Wed, 08 Jun 2016 09:35:05 +0200
Message-ID: <5757CAA9.6000001@samsung.com>
References: <20160607143425.GE1165@e106497-lin.cambridge.arm.com>
 <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28082 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbcFHHf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:35:27 -0400
In-reply-to: <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kamil Debski <k.debski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

On 06/08/2016 08:51 AM, Marek Szyprowski wrote:
> Change return value back to -ENODEV when no region is defined for given
> device. This restores old behavior of this function, as some drivers rely
> on such error code.
> 
> Reported-by: Liviu Dudau <liviu.dudau@arm.com>
> Fixes: 59ce4039727ef40 ("of: reserved_mem: add support for using more than
>        one region for given device")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I think this needs to be added to the media tree, where the original
patch it fixes was applied.

-- 
Thanks,
Sylwester
