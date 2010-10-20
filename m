From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: S5PV310: Add support S5PV310/S5PC210 CPUFREQ
Date: Wed, 20 Oct 2010 15:48:27 +0900
Message-ID: <05b301cb7022$ce47ebd0$6ad7c370$%kim@samsung.com>
References: <1284777916-23257-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49676 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758249Ab0JTGsq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 02:48:46 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAK0061ZTK7E930@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Oct 2010 15:48:07 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAK00MZSTK7HR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Oct 2010 15:48:07 +0900 (KST)
In-reply-to: <1284777916-23257-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Kukjin Kim wrote:
> 
> This patch adds support CPUFREQ driver for S5PV310 and S5PC210.
> 
> NOTE: This patch dependes on following.
> - ARM: S5PV310: Fix clkset_moutcore_list
> - ARM: S5PV210: Add DMC map_desc table for supporting DMC access
> 
> [PATCH 1/4] ARM: S5PV310: Update CMU registers for CPUFREQ
> [PATCH 2/4] ARM: S5PV310: Add DMC registers and map_desc
> [PATCH 3/4] ARM: S5PV310: Add support CPUFREQ
> [PATCH 4/4] ARM: S5PV310: Update Kconfig and Makefile for supporting
CPUFREQ
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi,

Basically, this CPUFREQ functionality has no problem, however, now
ARCH_S5PV310 uses ARM private timer(localtimer) as event tick on each CPU
core.
It means that we need some handling on localtimer or anywhere about ARM
clock changing by CPUFREQ driver...now it is not implemented..so I will drop
this patches for -next...I think we can do it at 37-rc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
