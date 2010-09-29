From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: S5P: Add support for gpio interrupts
Date: Wed, 29 Sep 2010 15:49:19 +0900
Message-ID: <014101cb5fa2$7701f9f0$6505edd0$%kim@samsung.com>
References: <1283764347-460-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35104 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155Ab0I2GtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 02:49:20 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9H00H9DXLX1P30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 15:49:09 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9H00KVOXLWL1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 15:49:09 +0900 (KST)
In-reply-to: <1283764347-460-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, jy0922.shim@samsung.com

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi :-)

> This patch series adds support for gpio interrupts on Samsung S5P SoC
> series (S5PC100 and S5PC110/S5PV210). It is based on the previous
> version created by Joonyoung Shim (which is available from the
> "[PATCH v2 0/4] ARM: S5P: Support gpio interrupts" thread:
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/1662 ).
> 
> This version has been redesigned to assign irq numbers dynamically to
> reduce resource waste. Such idea has proposed by Ben Dooks some time ago
> (see "[PATCH] ARM: S5P: Dynamicly numbered GPIO interrupt support"
> thread: http://comments.gmane.org/gmane.linux.kernel.samsung-soc/1198 ).
> 
> The last patch in this series is an example how to use the dynamically
> registered gpio interrupt. The QT602240 touch screen device on Goni
> machine requires it.
> 
> The patch series has been rebased onto latest kgene/for-next kernel
> tree.
> 
> The complete list of patches:
> 
> [PATCH 1/6] ARM: Samsung: Add common s5p gpio interrupt support
> [PATCH 2/6] ARM: S5PC110: add support for gpio interrupts
> [PATCH 3/6] ARM: S5PC100: Use generic S5P gpio interrupts interface
> [PATCH 4/6] ARM: S5PC100: Move external interrupt defines
> [PATCH 5/6] ARM: Samsung: Add common samsung_gpiolib_to_irq function
> [PATCH 6/6] ARM: S5PC110: GONI: Add support for QT602240 TS driver
> 
Ok...initial reading your 2nd to 5th patches, looks ok to me...will apply.
Others, will check/review soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
