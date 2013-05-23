From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [rtc-linux] [PATCH] rtc: max8998: Check for pdata presence
 before dereferencing
Date: Thu, 23 May 2013 16:55:04 -0700
Message-ID: <20130523165504.364bebf5f999e4a12d51e176@linux-foundation.org>
References: <1368630968-30460-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51063 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756891Ab3EWXzK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 May 2013 19:55:10 -0400
In-Reply-To: <1368630968-30460-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, jy0922.shim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

On Wed, 15 May 2013 17:16:08 +0200 Tomasz Figa <t.figa@samsung.com> wrote:

> Currently the driver can crash with a NULL pointer dereference if no pdata
> is provided, despite of successful registration of MFD part. This patch
> fixes the problem by adding a NULL check before dereferencing the pdata
> pointer.
> 
> ...
>
> --- a/drivers/rtc/rtc-max8998.c
> +++ b/drivers/rtc/rtc-max8998.c
> @@ -285,7 +285,7 @@ static int max8998_rtc_probe(struct platform_device *pdev)
>  			info->irq, ret);
>  
>  	dev_info(&pdev->dev, "RTC CHIP NAME: %s\n", pdev->id_entry->name);
> -	if (pdata->rtc_delay) {
> +	if (pdata && pdata->rtc_delay) {
>  		info->lp3974_bug_workaround = true;
>  		dev_warn(&pdev->dev, "LP3974 with RTC REGERR option."
>  				" RTC updates will be extremely slow.\n");

Looking at your description I'm unable to determine which kernel
versions we should fix.  This is because the changelog didn't describe
the circumstances under which the bug triggers.

It's pretty simple: when fixing a bug, include a full description of
the bug!  As if you were sending a bug report, not a patch.
