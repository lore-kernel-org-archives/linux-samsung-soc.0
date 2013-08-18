From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 0/2] Samsung pull-request for v3.12
Date: Mon, 19 Aug 2013 07:34:51 +0900
Message-ID: <15ff01ce9c63$276aa940$763ffbc0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47582 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755140Ab3HRWex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 18:34:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRR00E8O0239Q20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Aug 2013 07:34:51 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org

Hi Arnd and Olof,

Here is Samsung cleanup and Exynos DT stuff for v3.12.

They include non-dt cleanup and unused codes, and add exynos4412-trats2
board and update Arndale board, exynos5420 and exynos4 series.

Just note, I'm holding on defconfig update branch because of concern for
exynos5440_defconfig and I'm waiting for Mike's clk update for s3c64xx
common clk and addressing comments for several DT patches.

If any problems, please let me know.

Thanks,
Kukjin
