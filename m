From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5] [WATCHDOG] s3c2410_wdt - Avoid freeing memory,
	if memory region could not be allocated
Date: Thu, 20 May 2010 19:32:40 +0900
Message-ID: <011201caf807$c8dee1f0$5a9ca5d0$%kim@samsung.com>
References: <1274340092-10706-1-git-send-email-kgene.kim@samsung.com>
 <1274340092-10706-3-git-send-email-kgene.kim@samsung.com>
 <4BF50825.2060403@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:46049 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754079Ab0ETKco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 06:32:44 -0400
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2P001IURYJ4P@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 19:32:43 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2P005GLRYIL1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 19:32:43 +0900 (KST)
In-reply-to: <4BF50825.2060403@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Banajit Goswami' <banajit.g@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
> Kukjin Kim wrote:
> 
> > From: Banajit Goswami <banajit.g@samsung.com>
> 
> > In case the WDT device memory allocation fails, this patch modifies the
> 
>     This is not memory allocation.

Ok, will fix it.

> 
> > driver such that, it does not try to free the memory on exit.
> 
> > Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c |    3 +--
> >  1 files changed, 1 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c
b/drivers/watchdog/s3c2410_wdt.c
> > index e4cebef..d421258 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -426,8 +426,7 @@ static int __devinit s3c2410wdt_probe(struct
> platform_device *pdev)
> >  	wdt_mem = request_mem_region(res->start, size, pdev->name);
> >  	if (wdt_mem == NULL) {
> >  		dev_err(dev, "failed to get memory region\n");
> > -		ret = -ENOENT;
> > -		goto err_req;
> > +		return -ENOMEM;
> 
>     It should be EBUSY actually...

Ok, will fix it.

> 
> 
> WBR, Sergei


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
