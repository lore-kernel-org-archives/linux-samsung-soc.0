From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 06/10] 2nd pinctrl-exynos for v3.10
Date: Tue, 09 Apr 2013 03:19:04 +0900
Message-ID: <51630A18.6010801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:42213 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935495Ab3DHSTW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 14:19:22 -0400
Received: by mail-da0-f47.google.com with SMTP id s35so2713547dak.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 11:19:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 97916777d6904e24b86eac77da58ef7cb09d539d:

   ARM: EXYNOS: skip wakeup interrupt registration for exynos5250 if 
pinctrl is enabled (2013-03-05 20:59:12 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/pinctrl-exynos-for-v3.10

for you to fetch changes up to 790af0a51bdcbf504814be2673f96facfdd74981:

   pinctrl: exynos5440: add gpio interrupt support (2013-04-08 23:55:41 
+0900)

----------------------------------------------------------------
add support gpio interrupt for exynos5440

----------------------------------------------------------------
Thomas Abraham (2):
       pinctrl: exynos5440: fix probe failure due to missing pin-list in 
config nodes
       pinctrl: exynos5440: add gpio interrupt support

  drivers/pinctrl/pinctrl-exynos5440.c | 151 
++++++++++++++++++++++++++++++++++-
  1 file changed, 148 insertions(+), 3 deletions(-)

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
