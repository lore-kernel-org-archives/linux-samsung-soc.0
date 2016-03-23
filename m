From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Wed, 23 Mar 2016 16:37:25 -0300
Message-ID: <56F2F075.9090000@osg.samsung.com>
References: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
 <56F2EF41.2000701@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56735 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755713AbcCWThf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 15:37:35 -0400
In-Reply-To: <56F2EF41.2000701@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello Tobias,

Thanks for the feedback.

On 03/23/2016 04:32 PM, Tobias Jakobi wrote:
> Hello Javier,
> 
> I think the G2D and probably also the GSC v4l drivers should be left
> off, since they use the same resources as their DRM counterparts.
>

I left out the drivers/media/platform/s5p-tv/ drivers because I noticed that
the Exynos DRM HDMI driver had an explicit depends on !VIDEO_SAMSUNG_S5P_TV
but missed that DRM_EXYNOS_{G2D, GSC} had similar checks for the s5p drivers.

I'll leave those as well, thanks a lot for pointing out!

> With best wishes,
> Tobias
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
