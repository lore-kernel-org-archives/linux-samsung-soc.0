From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Merge plat/regs-nand.h into s3c2410.c
Date: Thu, 02 Jan 2014 14:14:41 +0900
Message-ID: <002701cf0779$8af6c8a0$a0e459e0$%han@samsung.com>
References: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50858 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708AbaABFOo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 00:14:44 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYR0019MD8ILLA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Jan 2014 14:14:42 +0900 (KST)
In-reply-to: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Brian Norris' <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, January 02, 2014 1:57 PM, Sachin Kamat wrote:
> 
> plat/regs-nand.h is used only by S3C2410 nand driver. Since there
> are no other users, merge this file into the driver code to remove
> platform dependency.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
> The earlier version of this patch was titled
> "mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd".
> Please ignore that.
> ---
> 
>  arch/arm/plat-samsung/include/plat/regs-nand.h |  123 ------------------------
>  drivers/mtd/nand/s3c2410.c                     |  104 +++++++++++++++++++-
>  2 files changed, 103 insertions(+), 124 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-nand.h
