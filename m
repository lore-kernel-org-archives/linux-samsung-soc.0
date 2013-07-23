From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3] watchdog: s3c2410_wdt: remove the global variables
Date: Tue, 23 Jul 2013 13:19:48 +0200
Message-ID: <3101567.pnRdvXvbY0@amdc1227>
References: <1374569985-13576-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44291 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756129Ab3GWLTy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 07:19:54 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQD00MSNZGKBY30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 12:19:52 +0100 (BST)
In-reply-to: <1374569985-13576-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, sachin.kamat@linaro.org

Hi,

On Tuesday 23 of July 2013 14:29:45 Leela Krishna Amudala wrote:
> This patch removes the global variables in the driver file and
> group them into a structure.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  Note: This patch is rebased on kgene's for-next branch and tested on
> SMDK5420.
> 
>  Changes since V2:
> 	- Addressed comments given by Tomasz Figa <t.figa@samsung.com>
> 	  https://patchwork.kernel.org/patch/2831032/
> 	- Renamed structure name from s3c2410_watchdog to s3c2410_wdt.
> 
>  Changes since V1:
> 	- changed the patch subject.
> 	- indentation correction in s3c2410_watchdog structure.
> 
>  drivers/watchdog/s3c2410_wdt.c |  225
> +++++++++++++++++++++++----------------- 1 file changed, 131
> insertions(+), 94 deletions(-)

Looks good to me, thanks.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
