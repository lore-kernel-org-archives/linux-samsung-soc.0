From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-2 for v3.5
Date: Thu, 17 May 2012 15:52:13 +0900
Message-ID: <0b1601cd33f9$96d66a40$c4833ec0$%kim@samsung.com>
References: <092f01cd332c$00df3c60$029db520$%kim@samsung.com>
 <201205162013.37031.arnd@arndb.de>
 <CAK9yfHyw81CM6OWvwFCG0jqQLULviUhUrz5bA2gM3h+W25rwfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60720 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759674Ab2EQGwL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 02:52:11 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4500GTPN2YPIM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:52:10 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4500GPCN2XHW60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:52:10 +0900 (KST)
In-reply-to: <CAK9yfHyw81CM6OWvwFCG0jqQLULviUhUrz5bA2gM3h+W25rwfQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Sachin Kamat wrote:
> 
> Hi Arnd,
> 
> Thomas has posted a patch [1] (available on Grant's tree) to fix this
> problem.
> 
> [1] http://git.secretlab.ca/?p=linux-
> 2.6.git;a=commitdiff;h=766644d2df254934d656a0a0628b636212c24f9e;hp=0034102
> 808e0dbbf3a2394b82b1bb40b5778de9e
> 
> 
Yeah, I know that. But in this case, the Arnd's patch looks better to me and
this helps to avoid build error in current arm-soc. I think, we can cleanup
#ifdef CONFIG_OF in mach-exynos/ when we move on supporting DT for all of
EXYNOS next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
