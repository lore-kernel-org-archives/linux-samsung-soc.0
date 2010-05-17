From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 12/15] ARM: SMDKC100: fix frame buffer definitions
Date: Mon, 17 May 2010 22:36:19 +0900
Message-ID: <004c01caf5c5$f0eae9d0$d2c0bd70$%kim@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
 <1273817946-29404-13-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49155 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755303Ab0EQNgX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:36:23 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K00MPSGGLPO@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:36:21 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K00E4GGGLPY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:36:21 +0900 (KST)
In-reply-to: <1273817946-29404-13-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Fix incorrectly defined pixel clock value for the default framebuffer
> window.

It is better that separate this patch from c100 clean up patch set.
As you know, this patch is unrelated to that.

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pc100/mach-smdkc100.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-
> s5pc100/mach-smdkc100.c
> index 9155564..7df8ed0 100644
> --- a/arch/arm/mach-s5pc100/mach-smdkc100.c
> +++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
> @@ -118,8 +118,7 @@ static struct platform_device smdkc100_lcd_powerdev = {
>  static struct s3c_fb_pd_win smdkc100_fb_win0 = {
>  	/* this is to ensure we use win0 */
>  	.win_mode	= {
> -		.refresh	= 70,
> -		.pixclock	= (8+13+3+800)*(7+5+1+480),
> +		.pixclock = 1000000000000ULL / ((8+13+3+800)*(7+5+1+480)*80),

As I've commented, how about moving to related LCD driver than hard coding
here.

>  		.left_margin	= 8,
>  		.right_margin	= 13,
>  		.upper_margin	= 7,
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
