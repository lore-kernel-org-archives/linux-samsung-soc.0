From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-spi for v3.6
Date: Fri, 20 Jul 2012 07:39:56 +0900
Message-ID: <195001cd65ff$6c3a5340$44aef9c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47027 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab2GSWj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 18:39:58 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7F00EXQIYAR300@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:39:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7F00JKLIYKW330@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:39:56 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Hi Arnd, Olof

Please pull devel-spi for samsung stuff for v3.6 from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-samsung-spi

You may think that 'since this is including only samsung spi stuff, so this should be sent to
upstream via spi tree', yeah right. But in this time, would be helpful to us if they could be sent
via arm-soc, samsung tree for avoiding useless conflicts. Because samsung-dt-spi branch touches the
same driver and it is already in arm-soc tree.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit f9ed561ebd71f7a9a3238507ef9082862e2cbc9a:

  Merge branch 'next/dt-samsung' into next/devel-samsung-spi (2012-07-19 14:20:32 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-samsung-spi

Mark Brown (4):
      spi/s3c64xx: Fix handling of errors in gpio_request()
      spi/s3c64xx: Put the /CS GPIO into output mode
      spi/s3c64xx: Convert to devm_request_and_ioremap()
      spi/s3c64xx: Expand S3C64XX_SPI_{DE,}ACT macros at call sites

 drivers/spi/spi-s3c64xx.c |   42 ++++++++++++------------------------------
 1 files changed, 12 insertions(+), 30 deletions(-)
