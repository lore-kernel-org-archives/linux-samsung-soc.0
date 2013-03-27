From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] [media] s5p-mfc: Change MFC clock reference w.r.t Common Clock
 Framework
Date: Tue, 26 Mar 2013 19:01:02 -0700
Message-ID: <20130327020102.4014.2171@quantum>
References: <1364275251-31394-1-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:34383 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753655Ab3C0CBI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 22:01:08 -0400
Received: by mail-da0-f43.google.com with SMTP id u36so3947271dak.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2013 19:01:08 -0700 (PDT)
In-Reply-To: <1364275251-31394-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

Quoting Prasanna Kumar (2013-03-25 22:20:51)
> From: Prasanna Kumar <prasanna.ps@samsung.com>
> 
> According to Common Clock framework , modified the method of getting
> clock for MFC Block.
> 
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc_pm.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
> index 6aa38a5..b8ac8f6 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
> @@ -50,7 +50,7 @@ int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
>                 goto err_p_ip_clk;
>         }
>  
> -       pm->clock = clk_get(&dev->plat_dev->dev, dev->variant->mclk_name);
> +       pm->clock = clk_get_parent(pm->clock_gate);

Ok, I'll bite.  Why make this change?  Was there an issue using
clkdev/clk_get to get the clock you needed?

Regards,
Mike

>         if (IS_ERR(pm->clock)) {
>                 mfc_err("Failed to get MFC clock\n");
>                 ret = PTR_ERR(pm->clock);
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
