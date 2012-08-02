From: "Jiandong Zheng" <jdzheng@broadcom.com>
Subject: Re: [PATCH] mtd: use %*ph[CN] to dump small buffers
Date: Thu, 2 Aug 2012 10:03:45 -0700
Message-ID: <501AB2F1.6060101@broadcom.com>
References: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:2998 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754416Ab2HBRD6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Aug 2012 13:03:58 -0400
In-Reply-To: <1343912807-29355-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 8/2/2012 6:06 AM, Andy Shevchenko wrote:
> There is new format specified that helps to dump small buffers. It makes the
> code simplier and nicer.
>
> Signed-off-by: Andy Shevchenko<andriy.shevchenko@linux.intel.com>
> Cc: David Woodhouse<dwmw2@infradead.org>
> Cc: Jiandong Zheng<jdzheng@broadcom.com>
> Cc: Ben Dooks<ben-linux@fluff.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---

>   drivers/mtd/nand/bcm_umi_bch.c    |   17 ++++-------------
>
Acked-by: Jiandong Zheng <jdzheng@broadcom.com>
