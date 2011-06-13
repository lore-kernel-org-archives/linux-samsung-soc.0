From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: EXYNOS4: Add PCM audio support for WM8994
Date: Mon, 13 Jun 2011 16:48:22 +0900
Message-ID: <000101cc299e$47d84870$d788d950$%kim@samsung.com>
References: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
 <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
 <003a01cc24dd$f5f2e390$e1d8aab0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18156 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145Ab1FMHst (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 03:48:49 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMP00646XN2FKD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:48:28 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMP00FKOXOR0K@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:48:27 +0900 (KST)
In-reply-to: <003a01cc24dd$f5f2e390$e1d8aab0$%szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi :)

> I've just noticed that there is a problem with this patch on
> kgene/for-next branch. It causes compilation break:
> 
> arch/arm/mach-exynos4/cpu.c:106: error: 'S5P_VA_AUDSS' undeclared here
(not in
> a
> function)
> make[1]: *** [arch/arm/mach-exynos4/cpu.o] Error 1
> make: *** [arch/arm/mach-exynos4] Error 2
> make: *** Waiting for unfinished jobs....
> 
> It looks that some definitions are still missing there.
> 
Oops, Marek, thanks for your pointing out :)

I applied Naveen's patch for this.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
