From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix warning 's3c_pm_show_resume_irqs'
 defined	but not used
Date: Sat, 02 Apr 2011 11:23:39 +0900
Message-ID: <023601cbf0dd$00e7c8e0$02b75aa0$%kim@samsung.com>
References: <4cabb531.cf7d0e0a.19d7.08b2@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51870 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091Ab1DBCY2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2011 22:24:28 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ0009C66NQMI80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Apr 2011 11:23:50 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ000B1J6NQEM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Apr 2011 11:23:50 +0900 (KST)
In-reply-to: <4cabb531.cf7d0e0a.19d7.08b2@mx.google.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Maurus Cuelenaere' <mcuelenaere@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Maurus Cuelenaere wrote:
> 
> s3c_pm_show_resume_irqs() is used by some s3c_pm_arch_show_resume_irqs()
> implementations, which get included through mach/pm-core.h. Add
> __maybe_unused
> to silence warnings when it isn't used (e.g. on S3C64XX platforms).
> 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  arch/arm/plat-samsung/pm.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 27cfca5..ad6dd63 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -214,8 +214,9 @@ void s3c_pm_do_restore_core(struct sleep_save *ptr,
int
> count)
>   *
>   * print any IRQs asserted at resume time (ie, we woke from)
>  */
> -static void s3c_pm_show_resume_irqs(int start, unsigned long which,
> -				    unsigned long mask)
> +static void __maybe_unused s3c_pm_show_resume_irqs(int start,
> +						   unsigned long which,
> +						   unsigned long mask)
>  {
>  	int i;
> 
> --

Missed for a long time :(

Abhilash, thanks for your reminder.

Ok, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
