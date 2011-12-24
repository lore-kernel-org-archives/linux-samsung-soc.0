From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Pull Requeset: Exynos4 Register Address Update for Devfreq Drivers.
Date: Sat, 24 Dec 2011 10:58:58 +0900
Message-ID: <088b01ccc1df$994d0090$cbe701b0$%kim@samsung.com>
References: <CAJ0PZbQ1=+BTs0Emi78kfOWD5d90+ND5Jc_SJ9T4BcGMXyny9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37117 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754673Ab1LXB7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 20:59:01 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO00EP3QUA5060@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:58:59 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO0073TQU9PO70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 10:58:59 +0900 (KST)
In-reply-to: <CAJ0PZbQ1=+BTs0Emi78kfOWD5d90+ND5Jc_SJ9T4BcGMXyny9A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>

MyungJoo Ham wrote:
> 
> Hello,
> 
Hi,

> Please pull the patches for Exynos4 SoCs that support devfreq device
> drivers for Exynos4210/4212/4412.
> 
> The patches are:
> ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
> ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus devfreq
> driver
> ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.
> 
> Gitweb: http://git.infradead.org/users/kmpark/linux-
> samsung/shortlog/refs/heads/devfreq-for-samsung
> Git Repository: git://git.infradead.org/users/kmpark/linux-samsung
> Branch: devfreq-for-samsung
> 
> The following changes since commit
> 390f998509bf049019df0b078c0a6606e0d57fb4:
> 
> Merge: e34d6b4 6f6c2aa
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Dec 18 14:28:31 2011 -0800
> 
>   Merge git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi-rc-fixes-
> 2.6
> (2011-12-18 14:28:31 -0800)
> 
> are available in the git repository at:
> 
>   git://git.infradead.org/users/kmpark/linux-samsung.git devfreq-for-
> samsung
> 
> MyungJoo Ham (3):
>       ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
>       ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus
> devfreq driver
>       ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.
> 
>  arch/arm/mach-exynos/cpu.c                     |    7 +++-
>  arch/arm/mach-exynos/include/mach/map.h        |    1 +
>  arch/arm/mach-exynos/include/mach/regs-clock.h |   42
> ++++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-nuri.c               |   11 ++++--
>  4 files changed, 57 insertions(+), 4 deletions(-)
> 
> 
As I commented, looks ok to me and will apply patches not pull and since I
didn't get your answer to ask 'topic branch is required for this', I didn't
yet.

As a note, if there is no reason to create based on not -rc, just use -rc.

Merry Christmas.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
