From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 1/7] ARM: S5PC110: update framebuffer setup information
 for Goni
Date: Tue, 28 Sep 2010 16:07:29 +0900
Message-ID: <005801cb5edb$d46579e0$7d306da0$%kim@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
 <1284987337-15365-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45100 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752712Ab0I1HHR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 03:07:17 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G00H7C3S4E8C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:07:16 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G008LD3S4ZO@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:07:16 +0900 (KST)
In-reply-to: <1284987337-15365-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Change the default upper_margin and vsync_len to get rid of repeated last
> line on the display.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index d9fe739..4bd5582 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -91,10 +91,10 @@ static struct s3c_fb_pd_win goni_fb_win0 = {
>  		.pixclock = 1000000000000ULL /
> ((16+16+2+480)*(28+3+2+800)*55),
>  		.left_margin	= 16,
>  		.right_margin	= 16,
> -		.upper_margin	= 3,
> +		.upper_margin	= 2,
>  		.lower_margin	= 28,
>  		.hsync_len	= 2,
> -		.vsync_len	= 2,
> +		.vsync_len	= 1,
>  		.xres		= 480,
>  		.yres		= 800,
>  		.refresh	= 55,
> --

This is better than your previous patch to me.

Will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
