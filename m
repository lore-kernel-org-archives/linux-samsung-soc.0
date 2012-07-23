From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Mon, 23 Jul 2012 17:34:19 +0900
Message-ID: <500D0C8B.3080007@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20023 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754035Ab2GWIeJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jul 2012 04:34:09 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7L00A1ZUGS4390@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 17:34:07 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7L00KTCUGVP090@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 17:34:07 +0900 (KST)
In-reply-to: <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com, joshi@samsung.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, olofj@google.com

On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
> This patch adds the bus clock for FIMD and changes
> the device name for lcd clock

Please refer below patch for exynos4.

http://lists.linaro.org/pipermail/linaro-dev/2011-December/008872.html

> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>   arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 774533c..f001876 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -634,6 +634,11 @@ static struct clk exynos5_init_clocks_off[] = {
>   		.enable		= exynos5_clk_ip_disp1_ctrl,
>   		.ctrlbit	= (1 << 3),
>   	}, {
> +		.name           = "fimd",
> +		.devname        = "exynos5-fb",
> +		.enable         = exynos5_clk_ip_disp1_ctrl,
> +		.ctrlbit        = (1 << 0),
> +	}, {
>   		.name		= "iis",
>   		.devname	= "samsung-i2s.1",
>   		.enable		= exynos5_clk_ip_peric_ctrl,
> @@ -1132,7 +1137,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
>   	}, {
>   		.clk	= {
>   			.name		= "sclk_fimd",
> -			.devname	= "s3cfb.1",
> +			.devname	= "exynos5-fb",
>   			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
>   			.ctrlbit	= (1 << 0),
>   		},
