From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: SAMSUNG: Convert s3c_irqext_wake() to new irq_
 interrupt methods
Date: Wed, 01 Dec 2010 20:28:22 +0900
Message-ID: <002f01cb914a$de3e3fa0$9ababee0$%kim@samsung.com>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42689 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308Ab0LAL25 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 06:28:57 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCQ00JDVYJNN340@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:28:35 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCQ00IO9YJM2Q@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 20:28:35 +0900 (KST)
In-reply-to: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> Kernel 2.6.37 adds new interrupt methods which take a struct irq_data
> rather than an irq number. Begin converting Samsung platforms over to
> these methods by converting s3c_irqext_wake() with a simple textual
> substitution.

And...as you know, need to convert s3c_irq_wake() to new irq_ interrupt
method also.
Ok...I will do it or will check Lennert Buytenhek's patch for it :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
