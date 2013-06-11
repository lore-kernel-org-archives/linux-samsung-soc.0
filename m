From: Kukjin Kim <kgene.kim@samsung.com>
Subject: About LPAE supporting on EXYNOS5440
Date: Tue, 11 Jun 2013 17:33:33 +0900
Message-ID: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52524 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525Ab3FKIdp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 04:33:45 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO700FURZRL84A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 17:33:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>

Hi all,

The exynos5440 can support LPAE and referece boards, SSDK5440 and SD5v1 have
over 8GiB memory.

Current exynos_defconfig selects every EXYNOS SoCs including exynos5440 it
means supporting LPAE will be selected for other EXYNOS SoCs.

I'm wondering if seleting LPAE causes some problem for multiplatform. Can we
support LPAE enabled and disabled platform together with single zImage?

Thanks,
Kukjin
