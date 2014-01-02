From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
Date: Thu, 2 Jan 2014 10:32:11 +0530
Message-ID: <CAK9yfHy9qi6NOtyW333e9WoSo4DFfz6C6uu-6cvUUm4JAyAAEw@mail.gmail.com>
References: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:52900 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728AbaABFCM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 00:02:12 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so14302734oag.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jan 2014 21:02:12 -0800 (PST)
In-Reply-To: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Brian Norris <computersforpeace@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 31 December 2013 10:41, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> plat/regs-nand.h is used only by s3c2410 nand driver.
> Move this file to the drivers folder to remove platform
> dependency.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Please ignore this patch. Sent an updated version.


-- 
With warm regards,
Sachin
