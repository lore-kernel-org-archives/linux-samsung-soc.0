From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: S3C64xx: cpuidle cleanups
Date: Thu, 17 May 2012 15:57:45 +0900
Message-ID: <0b2001cd33fa$5cd05490$1670fdb0$%kim@samsung.com>
References: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24149 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757955Ab2EQG5o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 02:57:44 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4500BRJNB1OHN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:57:42 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4500H0VNC54R40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:57:41 +0900 (KST)
In-reply-to: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com
Cc: linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

Daniel Lezcano wrote:
> 
> These couple of patches use the new cpuidle core api to refactor
> some part of the code. The first one declares the states directly
> in the driver declaration and the second one use the timekeeping
> flag to let the cpuidle core to compute the idle time.
> 
Basically, looks ok to me.

> I don't have this board, I was not able to test these patches.
> 
Mark, could you please check this patches on your board?
Now, my smdk6410 has some problem to test this :(

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Daniel Lezcano (2):
>   ARM: s3c64xx: cpuidle - declare the states with the new api
>   ARM: s3c64xx: cpuidle - use timekeeping wrapper
> 
>  arch/arm/mach-s3c64xx/cpuidle.c |   45
+++++++++++++----------------------
> ----
>  1 files changed, 15 insertions(+), 30 deletions(-)
> 
> --
> 1.7.5.4
