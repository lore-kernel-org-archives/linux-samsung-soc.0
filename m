From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH v2 0/3] Support Samsung Exynos OHCI device and driver
Date: Tue, 06 Dec 2011 15:30:08 +0900
Message-ID: <001101ccb3e0$7fe48270$7fad8750$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22709 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932822Ab1LFGaK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Dec 2011 01:30:10 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Hello.

This patch series adds USB OHCI device and initial driver for Samsung
Exynos SoCs and is based from linux-samsung for-next branch.
I have tested on SMDKV310 board using EXYNOS4.

Thanks.

Jingoo Han (3) :
       ARM: EXYNOS: Add USB OHCI device
	   ARM: EXYNOS: Add USB OHCI support to SMDKV310 board
	   USB: Add Samsung Exynos OHCI diver

Changes since v1:
	- Replace ohci-s5p with ohci-exynos
	- Check phy control
