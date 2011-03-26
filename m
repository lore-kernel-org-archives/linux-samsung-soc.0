From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add PWM backlight support on Samsung SMDKC210
Date: Sat, 26 Mar 2011 09:09:51 +0900
Message-ID: <000001cbeb4a$24611300$6d233900$%kim@samsung.com>
References: <1300679136-16693-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57664 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933262Ab1CZAKA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 20:10:00 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIN007RM1SMDM50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Mar 2011 09:09:58 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIN00D2U1SLTF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Mar 2011 09:09:58 +0900 (KST)
In-reply-to: <1300679136-16693-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> This patch adds support for LCD backlight control using PWM timer
> for Samsung's SMDKC210 board.
> 

(snip)

> +static int smdkv310_backlight_init(struct device *dev)

smdkc210_backlight_init ?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
