From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 09/10] 2nd timer-samsung for v3.10
Date: Tue, 09 Apr 2013 03:19:52 +0900
Message-ID: <51630A48.1060401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f179.google.com ([209.85.210.179]:41635 "EHLO
	mail-ia0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935491Ab3DHSUD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 14:20:03 -0400
Received: by mail-ia0-f179.google.com with SMTP id x24so5479064iak.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 11:19:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit ad38bdd15d5b97dcb1ffc46ea77c237e30312fbb:

   ARM: SAMSUNG: Remove unused plat-samsung/time.c (2013-03-05 20:19:54 
+0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/timer-samsung-for-v3.10

for you to fetch changes up to 536504309c3c2da5a755263c7179ffe1b2e5b3dd:

   ARM: SAMSUNG: change GENERIC_GPIO to ARCH_REQUIRE_GPIOLIB (2013-04-04 
09:36:24 +0900)

----------------------------------------------------------------
including fix for GENERIC_GPIO based on previous pull-request for 
timer-samsung

----------------------------------------------------------------
Kukjin Kim (1):
       ARM: SAMSUNG: change GENERIC_GPIO to ARCH_REQUIRE_GPIOLIB

  arch/arm/Kconfig | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
