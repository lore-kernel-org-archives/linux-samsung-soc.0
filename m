From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: atomic check only enabled crtc states
Date: Fri, 27 Nov 2015 10:00:14 -0300
Message-ID: <565853DE.602@osg.samsung.com>
References: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
 <1448607451-13784-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33387 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788AbbK0NA1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Nov 2015 08:00:27 -0500
In-Reply-To: <1448607451-13784-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gustavo@padovan.org, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hello Andrzej,

On 11/27/2015 03:57 AM, Andrzej Hajda wrote:
> Since atomic check is called also for disabled crtcs it should skip
> mode checking as it can be uninitialized. The patch fixes it.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> Hi Javier,
> 
> Could you check with this patch.
>

The patch fixes the issue I reported. The display mode is correctly set
with and without a HDMI monitor plugged. So on an Exynos5800 Peach Pi:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
