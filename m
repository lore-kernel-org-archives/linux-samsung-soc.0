From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 2/7] ARM: S5PC110: fb setup for Goni - remove pixel clock
Date: Tue, 28 Sep 2010 16:08:44 +0900
Message-ID: <005901cb5edb$ffd2e090$ff78a1b0$%kim@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
 <1284987337-15365-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24459 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752712Ab0I1HIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 03:08:30 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G00FAV3U5ECB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:08:29 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G0021Q3U4ZC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 16:08:29 +0900 (KST)
In-reply-to: <1284987337-15365-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Since commit 67a38950f0917aecfe1a3e46720d8bbb0020 there is no need
> to set pixel clock for the s3c-fb driver's window information.
> The correct pixel clock value can be automatically calculated from
> the other screen parameters. This patch removes the redundant pixel clock
> parameter.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 4bd5582..b0ae208 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -88,7 +88,6 @@ static struct s3c2410_uartcfg goni_uartcfgs[] __initdata
= {
>  /* Frame Buffer */
>  static struct s3c_fb_pd_win goni_fb_win0 = {
>  	.win_mode = {
> -		.pixclock = 1000000000000ULL /
> ((16+16+2+480)*(28+3+2+800)*55),
>  		.left_margin	= 16,
>  		.right_margin	= 16,
>  		.upper_margin	= 2,
> --

Ok..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
