From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 09/10] Samsung exynos_defconfig for v3.11
Date: Wed, 19 Jun 2013 05:00:59 +0900
Message-ID: <51C0BC7B.908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:61702 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932861Ab3FRUBD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 16:01:03 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so4244228pbc.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 13:01:03 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>

The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:

   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-defconfig-1

for you to fetch changes up to 85964af2cd7950c875048e3089c0bf7e2a89ed5b:

   ARM: exynos_defconfig: Enable GPIO buttons and RTC drivers 
(2013-06-19 00:35:14 +0900)

----------------------------------------------------------------
update exynos_defconfig
- enable GPIO buttons and RTC drivers

----------------------------------------------------------------
Tushar Behera (1):
       ARM: exynos_defconfig: Enable GPIO buttons and RTC drivers

  arch/arm/configs/exynos_defconfig | 3 +++
  1 file changed, 3 insertions(+)
