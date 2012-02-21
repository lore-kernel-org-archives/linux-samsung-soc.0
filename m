From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V6 0/5] ARM: exynos4210: Add l2 retention mode cpuidle state
Date: Tue, 21 Feb 2012 20:11:48 +0900
Message-ID: <00b101ccf089$9af75cf0$d0e616d0$%kim@samsung.com>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19842 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755132Ab2BULLv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 06:11:51 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00G6XPRHHWP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:11:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ00AS0PRO4P00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:11:49 +0900 (KST)
In-reply-to: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.kachhap@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, patches@linaro.org, jc.lee@samsung.com, rob.lee@linaro.org

Amit Daniel Kachhap wrote:
> 
> Changes since V5:
> *Rebased the patchset against kernel 3.3-rc4
> *Added correct flag for exynos4210 evt1 based board
> *Removed CONFIG_OF from l2 cache configuration as suggested by
>  Olof Johansson <olof@lixom.net>
> 
> Changes since V4:
> *Rebased the patchset against for-next of samsung kernel tree.
> *Added Tushar suggestion of putting a check if L2 cache dt node not found.
> *Added Inder suggestion of removing the BUG_ON check in cpuidle driver.
> 
> Changes since V3:
> *Implemented Russell feedback and moved sleep magic 4byte memory before
> s3c_cpu_resume to data section.
> 
> Changes since V2:
> *Implemented the suggestion of MyungJoo Ham and used INFORM0/1
> registers for resume for some board versions.
> *Added back save/restore through CPU PM notifiers as suggested by
> Lorenzo Pieralisi. This is useful to restore vfp state.
> *some patch modularization (s5p/exynos) and proper commit logs.
> 
> Changes since V1:
> *rebased the whole patch against 3.2-rc1 tree
> *removed GIC save/restore in AFTR cpuidle state as it is external
> to cpu powerdomain
> *Added L2 setup code through device tree
> *Removed only l2 save/restore registers in sleep
> 
> This Patch series adds support for AFTR mode cpuidle state based on
> patch (http://www.spinics.net/lists/arm-kernel/msg132243.html) earlier
> submitted by Jaecheol Lee <jc.lee@samsung.com>.
> 
> This patch uses CPU PM notifiers , common l2 save/restore and
> new cpu_suspend/resume interfaces and is based on the tip of
> master branch of kernel.org tree(v3.3-rc4)
> 
> Amit Daniel Kachhap (5):
>   ARM: exynos: Add support AFTR mode on EXYNOS4210
>   ARM: s5p: add L2 early resume code
>   ARM: exynos: save L2 settings during bootup
>   ARM: exynos: remove useless code to save/restore L2
>   ARM: exynos: Enable l2 configuration through device tree
> 
>  arch/arm/mach-exynos/common.c           |   53 +++++++++---
>  arch/arm/mach-exynos/cpuidle.c          |  147
> ++++++++++++++++++++++++++++++-
>  arch/arm/mach-exynos/include/mach/pmu.h |    2 +
>  arch/arm/mach-exynos/pm.c               |   15 ---
>  arch/arm/plat-s5p/sleep.S               |   44 ++++++++--
>  5 files changed, 225 insertions(+), 36 deletions(-)

Cc'ed Jaecheol Lee and Rob Lee.

OK, looks ok to me and I got the report this works fine on SMDKV310 from
Jaecheol Lee.

I will apply this whole series for v3.4, but I'm not sure how conflicts will
happen with common cpuidle. Let me check it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
