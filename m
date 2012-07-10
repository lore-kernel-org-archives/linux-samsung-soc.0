From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-dma ops for v3.6
Date: Tue, 10 Jul 2012 11:13:00 +0900
Message-ID: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52468 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844Ab2GJCNC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jul 2012 22:13:02 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6X00DMYA5MDJI0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 11:13:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6X00E5GA5OJZ80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 11:13:00 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, boojin.kim@samsung.com, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, w.sang@pengutronix.de

Hi Arnd, Olof,

Here is updating DMA common operation for Samsung SoCs.

Since some DMA client driver such as spi needs to change the configuration
after dma_request() so this branch adds dma_config() can configure DMA
transmit option which is included in dma_request() after that.

Note, according to the changes, needs to update spi and ASoC drivers for
Samsung SoCs and only got the ack from Mark Brown not Grant Likely and as I
know, he is busy for moving. But I think, the spi change has no problem and
it is simple.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 485802a6c524e62b5924849dd727ddbb1497cc71:

  Linux 3.5-rc3 (2012-06-16 17:25:17 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-dma-ops

Boojin Kim (3):
      ARM: SAMSUNG: Add config() function in DMA common operations
      spi/s3c64xx: Add the use of DMA config operation
      ASoC: follow the updated samsung DMA common operations

Sachin Kamat (1):
      ARM: SAMSUNG: Fix compiler warning in dma-ops.c file

 arch/arm/plat-samsung/dma-ops.c              |   76
++++++++++++++------------
 arch/arm/plat-samsung/include/plat/dma-ops.h |   20 ++++---
 arch/arm/plat-samsung/s3c-dma-ops.c          |   39 ++++++++------
 drivers/spi/spi-s3c64xx.c                    |   33 +++++++-----
 sound/soc/samsung/dma.c                      |   18 ++++---
 5 files changed, 105 insertions(+), 81 deletions(-)
