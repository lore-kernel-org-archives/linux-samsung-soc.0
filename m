From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/7] Samsung gpio for v3.7
Date: Thu, 20 Sep 2012 08:18:37 +0900
Message-ID: <099901cd96bd$1929fd60$4b7df820$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23284 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864Ab2ISXSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:18:39 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM006PVE327MB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:18:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM008C7E31LY90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:18:38 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Linus Walleij' <linus.walleij@linaro.org>

Hi Arnd, Olof

This is for supporting DT gpio for Samsung S3C24XX.

Since there are many changes for gpio-samsung in my tree, this has been
included in my tree with Linus' agreement.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:

  Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/gpio-samsung

Heiko Stuebner (1):
      gpio: samsung: add devicetree init for s3c24xx arches

 .../devicetree/bindings/gpio/gpio-samsung.txt      |   43 +++++++++++++
 drivers/gpio/gpio-samsung.c                        |   63
++++++++++++++++++++
 2 files changed, 106 insertions(+), 0 deletions(-)
