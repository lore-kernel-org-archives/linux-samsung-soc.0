From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix smsc9215 irq polarity configuration of
 SMDKV310
Date: Fri, 25 Mar 2011 17:35:30 +0900
Message-ID: <000401cbeac7$9e6e95b0$db4bc110$%kim@samsung.com>
References: <1300169878-4793-1-git-send-email-jtp.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29586 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933688Ab1CYIio (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 04:38:44 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIL00HKGUJFBH20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:39 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIL00C4QUJD6X@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:39 +0900 (KST)
In-reply-to: <1300169878-4793-1-git-send-email-jtp.park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jeongtae Park' <jtp.park@samsung.com>, linux-samsung-soc@vger.kernel.org

Jeongtae Park wrote:
> 
> This patch fixes smsc9215 irq ploarity configuration of SMDKV310.
> We can change type of EINT(5) as HIGH, but it's better to change
> IRQ output of smsc9215 as an active low because smsc's IRQ line
> has been pull-up.
> 
> Signed-off-by: Jeongtae Park <jtp.park@samsung.com>

Ok, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
