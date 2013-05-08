From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] usb: gadget: s3c2410_udc: fix error return code in
 s3c2410_udc_probe()
Date: Wed, 08 May 2013 10:41:37 +0900
Message-ID: <001a01ce4b8d$2e22fd40$8a68f7c0$@samsung.com>
References: <CAPgLHd9zzFi6dCBH0V=eeqVtd=UstiqM8fDcDsMCfujAfEDHTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40688 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751643Ab3EHBlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 21:41:39 -0400
In-reply-to: <CAPgLHd9zzFi6dCBH0V=eeqVtd=UstiqM8fDcDsMCfujAfEDHTg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wei Yongjun' <weiyj.lk@gmail.com>, 'Felipe Balbi' <balbi@ti.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ben Dooks <ben-linux@fluff.org>, yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Tuesday, May 07, 2013 8:48 PM, Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code in the gpio_to_irq() error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han


> ---
>  drivers/usb/gadget/s3c2410_udc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/s3c2410_udc.c b/drivers/usb/gadget/s3c2410_udc.c
> index d0e75e1..c974776 100644
> --- a/drivers/usb/gadget/s3c2410_udc.c
> +++ b/drivers/usb/gadget/s3c2410_udc.c
> @@ -1851,6 +1851,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
>  		irq = gpio_to_irq(udc_info->vbus_pin);
>  		if (irq < 0) {
>  			dev_err(dev, "no irq for gpio vbus pin\n");
> +			retval = irq;
>  			goto err_gpio_claim;
>  		}
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
