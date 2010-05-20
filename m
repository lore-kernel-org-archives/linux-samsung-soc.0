From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 2/5] [WATCHDOG] s3c2410_wdt - Avoid freeing memory,	if
 memory region could not be allocated
Date: Thu, 20 May 2010 14:00:05 +0400
Message-ID: <4BF50825.2060403@ru.mvista.com>
References: <1274340092-10706-1-git-send-email-kgene.kim@samsung.com> <1274340092-10706-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51468 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985Ab0ETKAz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 06:00:55 -0400
Received: by wyg36 with SMTP id 36so1156963wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 May 2010 03:00:53 -0700 (PDT)
In-Reply-To: <1274340092-10706-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Banajit Goswami <banajit.g@samsung.com>, ben-linux@fluff.org

Hello.

Kukjin Kim wrote:

> From: Banajit Goswami <banajit.g@samsung.com>

> In case the WDT device memory allocation fails, this patch modifies the

    This is not memory allocation.

> driver such that, it does not try to free the memory on exit.

> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index e4cebef..d421258 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -426,8 +426,7 @@ static int __devinit s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt_mem = request_mem_region(res->start, size, pdev->name);
>  	if (wdt_mem == NULL) {
>  		dev_err(dev, "failed to get memory region\n");
> -		ret = -ENOENT;
> -		goto err_req;
> +		return -ENOMEM;

    It should be EBUSY actually...


WBR, Sergei
