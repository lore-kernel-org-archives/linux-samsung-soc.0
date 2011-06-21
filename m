From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 15:47:04 +0400
Message-ID: <4E0084B8.1040201@ru.mvista.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com> <1308639827-2121-3-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:62258 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751234Ab1FULsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:48:24 -0400
In-Reply-To: <1308639827-2121-3-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: p.paneri@samsung.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, tmarri@apm.com, naushad@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com

Hello.

On 21-06-2011 11:03, p.paneri@samsung.com wrote:

> From: Praveen Paneri<p.paneri@samsung.com>

> Adding dwc driver name in existing platform device
> to probe DWC OTG driver.
> Introduced otg_set_platdata function to pass platform data
> Added selectable config option to add DWC OTG driver for different
> machines.

> Signed-off-by: Praveen Paneri<p.paneri@samsung.com>
[...]

> diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-samsung/dev-usb-hsotg.c
> index 33a844a..7e6228b 100644
> --- a/arch/arm/plat-samsung/dev-usb-hsotg.c
> +++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
[...]
> @@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[] = {
>   static u64 s3c_hsotg_dmamask = DMA_BIT_MASK(32);
>
>   struct platform_device s3c_device_usb_hsotg = {
> +#ifdef CONFIG_S3C_DEV_USB_HSOTG
>   	.name		= "s3c-hsotg",
> +#endif
> +#ifdef CONFIG_S3C_DEV_DWC_OTG
> +	.name		= "dwc_otg",
> +#endif

    I'd done it as:

+#if defined(CONFIG_S3C_DEV_USB_HSOTG)
   	.name		= "s3c-hsotg",
+#elif defined(CONFIG_S3C_DEV_DWC_OTG)
+	.name		= "dwc_otg",
+#endif

WBR, Sergei
