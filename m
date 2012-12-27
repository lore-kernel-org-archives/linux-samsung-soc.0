From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH 2/2] i2c: s3c2410: free gpios in suspend function
Date: Thu, 27 Dec 2012 10:08:39 +0530
Message-ID: <CAG17yqQheF8G+TdgSm8rHwixjUnGFXUADFAjeg-z5N1jLBgAYA@mail.gmail.com>
References: <1356581384-23063-1-git-send-email-inderpal.singh@linaro.org>
	<1356581384-23063-2-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:57119 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524Ab2L0Eik (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 23:38:40 -0500
Received: by mail-vc0-f173.google.com with SMTP id f13so9569410vcb.32
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 20:38:39 -0800 (PST)
In-Reply-To: <1356581384-23063-2-git-send-email-inderpal.singh@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, thomas.abraham@linaro.org, patches@linaro.org

On 27 December 2012 09:39, Inderpal Singh <inderpal.singh@linaro.org> wrote:
> While resuming the gpios are being requested again, hence we need
> to free the gpios before going to suspend otherwise it gives
> "gpio request failed" errors while resuming.
>
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index f1d1f1e..55c1762 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1172,6 +1172,7 @@ static int s3c24xx_i2c_suspend_noirq(struct device *dev)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
>
> +       s3c24xx_i2c_dt_gpio_free(i2c);
>         i2c->suspended = 1;
>
>         return 0;
> --
> 1.7.9.5
>

Please ignore this patch as this has been sent already at

http://dics.voicecontrol.ro/process_mails/arata_discutia/174658/%5BPATCH%5D_i2c:_s3c2410:_Add_fix_for_i2c_suspend_resume.html

Sorry for the noise !!!
