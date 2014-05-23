From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Fri, 23 May 2014 09:43:01 +0200
Message-ID: <537EFC05.6090708@samsung.com>
References: <1400811591-10132-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38997 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbaEWHnL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 03:43:11 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6000MAHO3ULM60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 May 2014 08:43:06 +0100 (BST)
In-reply-to: <1400811591-10132-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, thierry.reding@gmail.com, sachin.kamat@linaro.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,


On 05/23/2014 04:19 AM, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Fimd probe is accessing fimd Registers without enabling the fimd
> gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
> during kernel boottime, the system hangs during boottime.
> 
> This issue got surfaced when verifying with sysmmu enabled. Probe of
> fimd Sysmmu enables the master clock before accessing sysmmu regs and
> then disables. Later fimd probe tries to read the register without
> enabling the clock which is wrong and hangs the system.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
> v4:
> 	1) Added clk_disable for prev clock when clk_enable fails.
> v3:
> 	1) Added checks for clk_enable.
> v2:
> 	Rebase.
> 
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bd30d0c..30ccd67 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -898,16 +898,32 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct fimd_context *ctx = fimd_manager.ctx;
>  	struct drm_device *drm_dev = data;
> -	int win;
> +	int win, ret;
>  
>  	fimd_mgr_initialize(&fimd_manager, drm_dev);
>  	exynos_drm_crtc_create(&fimd_manager);
>  	if (ctx->display)
>  		exynos_drm_create_enc_conn(drm_dev, ctx->display);
>  
> +	ret = clk_prepare_enable(ctx->bus_clk);
> +	if (ret) {
> +		dev_err(dev, "bus clock enable failed.\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ctx->lcd_clk);
> +	if (ret) {
> +		dev_err(dev, "lcd clock enable failed.\n");
> +		clk_disable_unprepare(ctx->bus_clk);
> +		return ret;
> +	}
> +
>  	for (win = 0; win < WINDOWS_NR; win++)
>  		fimd_clear_win(ctx, win);
>  
> +	clk_disable_unprepare(ctx->lcd_clk);
> +	clk_disable_unprepare(ctx->bus_clk);
> +
>  	return 0;

If you want to access fimd registers I guess pm_runtime_get_sync should
be called as well, to wake up display pm domain.


Regards
Andrzej


>  
>  }
> 
