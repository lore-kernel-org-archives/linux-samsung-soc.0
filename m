From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 5/5] arm: samsung: delete frame buffer header files from
 platform
Date: Wed, 01 Aug 2012 11:04:12 +0900
Message-ID: <02ee01cd6f89$f218b2c0$d64a1840$%kim@samsung.com>
References: <1343737385-23337-1-git-send-email-l.krishna@samsung.com>
 <1343737385-23337-6-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59300 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752961Ab2HACEO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 22:04:14 -0400
In-reply-to: <1343737385-23337-6-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, inki.dae@samsung.com, joshi@samsung.com, jg1.han@samsung.com, m.szyprowski@samsung.com

Leela Krishna Amudala wrote:
> 
> The FIMD register headers are moved to include/video/
> hence, deleting these files from platform side
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |  159 ---------
>  arch/arm/plat-samsung/include/plat/regs-fb.h    |  403
-------------------
> ----
>  2 files changed, 0 insertions(+), 562 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb.h
> 
No. This should be squashed into first patch on this series. See below.

 arch/arm/plat-samsung/include/plat/regs-fb-v4.h    |  159
--------------------
 .../plat/regs-fb.h => include/video/samsung_fimd.h |  145
++++++++++++++++--
 2 files changed, 134 insertions(+), 170 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
 rename arch/arm/plat-samsung/include/plat/regs-fb.h =>
include/video/samsung_fimd.h (74%)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
