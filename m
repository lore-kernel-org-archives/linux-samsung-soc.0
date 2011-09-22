From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [RESEND PATCH 2/2] s5p-tv: Add PM_RUNTIME dependency
Date: Thu, 22 Sep 2011 12:05:21 +0200
Message-ID: <005c01cc790f$24110fb0$6c332f10$%szyprowski@samsung.com>
References: <1316670891-1672-1-git-send-email-hatim.rv@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42808 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab1IVKFd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 06:05:33 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRX00BW95D7BE@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 11:05:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRX005HO5D7P3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 11:05:31 +0100 (BST)
In-reply-to: <1316670891-1672-1-git-send-email-hatim.rv@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Hatim Ali' <hatim.rv@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, banajit.g@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello,

On Thursday, September 22, 2011 7:55 AM Hatim Ali wrote:

> The TVOUT driver requires PM_RUNTIME support for proper clock
> enabling.
> 
> Signed-off-by: Hatim Ali <hatim.rv@samsung.com>

I will take this patch to our v4l fixes branch. Thanks for your contribution.

> ---
>  drivers/media/video/s5p-tv/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/media/video/s5p-tv/Kconfig b/drivers/media/video/s5p-tv/Kconfig
> index 9c37dee..f2a0977 100644
> --- a/drivers/media/video/s5p-tv/Kconfig
> +++ b/drivers/media/video/s5p-tv/Kconfig
> @@ -8,7 +8,7 @@
> 
>  config VIDEO_SAMSUNG_S5P_TV
>  	bool "Samsung TV driver for S5P platform (experimental)"
> -	depends on PLAT_S5P
> +	depends on PLAT_S5P && PM_RUNTIME
>  	depends on EXPERIMENTAL
>  	default n
>  	---help---

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
