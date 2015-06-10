From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: remove SoC checking code
Date: Wed, 10 Jun 2015 11:14:45 +0900
Message-ID: <20150610111445.4d63c49d@hwh-ubuntu>
References: <1433758542-9843-1-git-send-email-a.hajda@samsung.com>
 <1433758542-9843-4-git-send-email-a.hajda@samsung.com>
 <20150609194652.GB22853@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52214 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbbFJCOs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jun 2015 22:14:48 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPP00W34I8M12B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Jun 2015 11:14:46 +0900 (KST)
In-reply-to: <20150609194652.GB22853@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

On Tue, 09 Jun 2015 16:46:52 -0300
Gustavo Padovan <gustavo@padovan.org> wrote:

> Hi Andrzej,
> 
> 2015-06-08 Andrzej Hajda <a.hajda@samsung.com>:
> 
> > SoC checking code is not necessary anymore, as exynos_drm_match_add
> > and exynos_drm_platform_probe already properly handles situation
> > when there are no Exynos DRM components.
> > 
> > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 27
> > +-------------------------- 1 file changed, 1 insertion(+), 26
> > deletions(-)
> 
> This series looks goods to me and works fine on my snow machine:
> 
> Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> 	Gustavo

It looks good to me.

Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
