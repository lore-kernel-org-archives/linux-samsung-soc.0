From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] rtc: max8998: Check for pdata presence before dereferencing
Date: Mon, 20 May 2013 22:05:33 +0200
Message-ID: <5315595.u903qx3Wqg@flatron>
References: <1368630968-30460-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:37863 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756835Ab3ETUFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 16:05:37 -0400
Received: by mail-ee0-f53.google.com with SMTP id c1so3837375eek.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 13:05:36 -0700 (PDT)
In-Reply-To: <1368630968-30460-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, rtc-linux@googlegroups.com, jy0922.shim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Hi Alessandro,

On Wednesday 15 of May 2013 17:16:08 Tomasz Figa wrote:
> Currently the driver can crash with a NULL pointer dereference if no
> pdata is provided, despite of successful registration of MFD part. This
> patch fixes the problem by adding a NULL check before dereferencing the
> pdata pointer.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/rtc/rtc-max8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
> index 48b6612..d5af7ba 100644
> --- a/drivers/rtc/rtc-max8998.c
> +++ b/drivers/rtc/rtc-max8998.c
> @@ -285,7 +285,7 @@ static int max8998_rtc_probe(struct platform_device
> *pdev) info->irq, ret);
> 
>  	dev_info(&pdev->dev, "RTC CHIP NAME: %s\n", pdev->id_entry->name);
> -	if (pdata->rtc_delay) {
> +	if (pdata && pdata->rtc_delay) {
>  		info->lp3974_bug_workaround = true;
>  		dev_warn(&pdev->dev, "LP3974 with RTC REGERR option."
>  				" RTC updates will be extremely slow.\n");

Since this is a fix, could you apply this patch to your fixes branch for 
3.10-rc2, please?

Best regards,
Tomasz
