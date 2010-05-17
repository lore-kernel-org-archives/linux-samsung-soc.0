From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] Add support for Samsung Aquila board (S5PC110 based)
Date: Mon, 17 May 2010 08:53:08 +0200
Message-ID: <1274079195-18105-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58573 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab0EQGxW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 02:53:22 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2J00B4GXSUVW@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 07:53:18 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2J00BUCXST2X@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 07:53:18 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Hello,

This patch series add basic support for Samsung Aquila board. The board
is based on Samsung S5PC110 SoC. This patch series also add platform
device helpers for i2c, fb and hsmmc drivers.

The patches are prepared with assumption that my previous patch series
'Common plat-s5p fixes' has been already applied, as well as the patch
'ARM: S5PV210: Add S5PV210 GPIO support.'

Changes since v1:
- removed custom gpiolib implementation in favour of the GPIOlib patch
  provided by Pannaga Bhushan,
- adjusted hsmmc setup code for 'sclk_mmc' clock names

This patch series includes:

[PATCH 1/7] ARM: S5PV210: add support for software reset
[PATCH 2/7] ARM: S5PV210: add Aquila board
[PATCH 3/7] ARM: Samsung: move common framebuffer regs to common platform directory
[PATCH 4/7] ARM: S5PV210: add framebuffer platform helpers for s5pv210 based machines
[PATCH 5/7] ARM: S5PV210: add support for s3c-fb driver on Aquila machine
[PATCH 6/7] ARM: S5PV210: add common I2C device helpers
[PATCH 7/7] ARM: S5PV210: add common HSMMC device helpers
