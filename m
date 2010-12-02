From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM :S5P64X0 :add clock support for rtc
Date: Thu, 02 Dec 2010 16:31:58 +0900
Message-ID: <00ac01cb91f3$0411ffc0$0c35ff40$%kim@samsung.com>
References: <1291187936-21332-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45831 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756308Ab0LBHcG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 02:32:06 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCS00G0NI9GU2E0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:32:04 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCS00B8OI9FXM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:32:04 +0900 (KST)
In-reply-to: <1291187936-21332-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Atul Dahiya' <atul.dahiya@samsung.com>

Sangbeom Kim wrote:
> 
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> This patch adds rtc clock for S5P6450.
> 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-
> s5p64x0/clock-s5p6450.c
> index 7dbf3c9..8ba2b3c 100644
> --- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
> +++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
> @@ -231,6 +231,12 @@ static struct clk init_clocks_disable[] = {
>  		.enable		= s5p64x0_pclk_ctrl,
>  		.ctrlbit	= (1 << 5),
>  	}, {
> +		.name		= "rtc",
> +		.id		= -1,
> +		.parent		= &clk_pclk_low.clk,
> +		.enable		= s5p64x0_pclk_ctrl,
> +		.ctrlbit	= (1 << 6),
> +	}, {
>  		.name		= "adc",
>  		.id		= -1,
>  		.parent		= &clk_pclk_low.clk,
> --

Looks ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
