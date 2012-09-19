From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: S3C24XX: Add WIZnet W5300E01-ARM board support
Date: Thu, 20 Sep 2012 08:38:38 +0900
Message-ID: <09a301cd96bf$e48b5970$ada20c50$%kim@samsung.com>
References: <1346653236-19728-1-git-send-email-kth3321@gmail.com>
 <1346905640.2573.14.camel@taehun-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52927 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752818Ab2ISXij convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:38:39 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM00C3MF0A9PG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:38:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00L4HF0E93C0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:38:38 +0900 (KST)
In-reply-to: <1346905640.2573.14.camel@taehun-desktop>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Taehun Kim' <kth3321@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sylvester.nawrocki@gmail.com

Taehun Kim wrote:
> 
> - The gpio routines are changed to use the gpio_request() functions from
>   comments of Vasily and Sylwester.
> - The mistake of adding a character by my email client automatically is
> fixed.
> 
> Please review this patch and apply it if do not have any problems.
> 

Taehun,

Above area is for adding comments like 'This patch adds WIZnet W5300E01 board' because it will be remained in its git log and nobody want to see your old request in there. If any comments which are not related to changes just put it after '---' around your sign. It doesn't hurt your patch.

And you need to update this against on for-next of my tree because some S3C2410 gpio APIs have been gone.(See the Sylwester's comments) Please re-send this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> Signed-off-by: Taehun Kim <kth3321@gmail.com>
> ---
>  arch/arm/mach-s3c24xx/Kconfig         |    5 +
>  arch/arm/mach-s3c24xx/Makefile        |    1 +
>  arch/arm/mach-s3c24xx/mach-w5300e01.c |  193
> +++++++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 arch/arm/mach-s3c24xx/mach-w5300e01.c
>  
[snip]
