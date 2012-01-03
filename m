From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4 0/5] ARM: exynos: Add l2 retention mode cpuidle state
Date: Tue, 03 Jan 2012 22:22:09 +0900
Message-ID: <014a01ccca1a$b25495b0$16fdc110$%kim@samsung.com>
References: <1323083172-14096-1-git-send-email-amit.kachhap@linaro.org>
 <CADGdYn7ZU5xiDvOLMR4wVHEWtF-2p86jNZFCOXMV6PrZXuLWbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38451 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752759Ab2ACNWM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 08:22:12 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX800AVY54YU6K0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 22:22:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX80066F54XF230@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 22:22:11 +0900 (KST)
In-reply-to: <CADGdYn7ZU5xiDvOLMR4wVHEWtF-2p86jNZFCOXMV6PrZXuLWbQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'amit kachhap' <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, linaro-dev@lists.linaro.org

amit kachhap wrote:
> 
> Hi Mr kim,
> 
> All the comments have been addressed for the Exynos cpu idle patchset.
> The updated patchset was posted about one month back and there have
> been no further comments on the patchset since then.
> 
> As this patchset seems to be stable now, do you think these these
> patches can merged in this 3.3 merge window? Kindly let me know your
> opinion.
> 

This conflicts with local common.[ch] working for ARM restart. Please wait
until after the merge window for this patches.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
