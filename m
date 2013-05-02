From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 8/9] s3c2410fb: Remove redundant platform_set_drvdata()
Date: Thu, 02 May 2013 14:31:43 +0900
Message-ID: <000001ce46f6$54f27cc0$fed77640$@samsung.com>
References: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
 <1367006543-5458-9-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44474 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077Ab3EBFbu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 May 2013 01:31:50 -0400
In-reply-to: <1367006543-5458-9-git-send-email-sylvester.nawrocki@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, kgene.kim@samsung.com, FlorianSchandinat@gmx.de
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Saturday, April 27, 2013 5:02 AM, Sylwester Nawrocki wrote:
> driver_data field is being cleared by the driver core since
> commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> device-core: Ensure drvdata = NULL when no driver is bound
> hence there is no need to do it in the driver's remove() callback.
> 
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  drivers/video/s3c2410fb.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/video/s3c2410fb.c b/drivers/video/s3c2410fb.c
> index 11f98ca..0439ed0 100644
> --- a/drivers/video/s3c2410fb.c
> +++ b/drivers/video/s3c2410fb.c
> @@ -1013,7 +1013,6 @@ static int s3c2410fb_remove(struct platform_device *pdev)
>  	irq = platform_get_irq(pdev, 0);
>  	free_irq(irq, info);
> 
> -	platform_set_drvdata(pdev, NULL);
>  	framebuffer_release(fbinfo);

Hi Sylwester,

How about eliminating platform_set_drvdata(pdev, NULL)
in s3c24xxfb_probe() as well as s3c2410fb_remove()?

@@ -1005,7 +1005,6 @@ release_regs:
 release_mem:
        release_mem_region(res->start, size);
 dealloc_fb:
-       platform_set_drvdata(pdev, NULL);
        framebuffer_release(fbinfo);
        return ret;
 }

Best regards,
Jingoo Han

> 
>  	return 0;
> --
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
