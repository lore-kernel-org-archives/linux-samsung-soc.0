From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5PV210: Aquila: add support for MAX8998 PMIC
Date: Wed, 14 Jul 2010 18:42:26 +0900
Message-ID: <001001cb2338$de209890$9a61c9b0$%kim@samsung.com>
References: <1279095416-24871-1-git-send-email-m.szyprowski@samsung.com>
 <1279095416-24871-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63723 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753512Ab0GNJmR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 05:42:17 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5J00JNMKAGB800@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 18:42:16 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5J00792KAG9L@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 18:42:16 +0900 (KST)
In-reply-to: <1279095416-24871-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> This patch adds required platform definitions for MAX8998 PMIC driver.
Power
> regulators for LDO and BUCK outputs has been defined as well as a simple
> gpio-keys button for power key (to enable wakeup functionality with
> external interrupt).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
Ok..will apply :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
