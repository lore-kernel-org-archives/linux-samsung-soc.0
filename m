From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung-fixes-2 for v3.11
Date: Tue, 06 Aug 2013 02:38:18 +0900
Message-ID: <51FFE30A.5040800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:38008 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127Ab3HERiX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 13:38:23 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so3654400pbc.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2013 10:38:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 5ae90d8e467e625e447000cb4335c4db973b1095:

   Linux 3.11-rc3 (2013-07-28 20:53:33 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-2

for you to fetch changes up to 35f8550c8f27968af94ba5235cc611e3b6d86981:

   ARM: SAMSUNG: fix to support for missing cpu specific map_io 
(2013-07-30 13:30:57 +0900)

----------------------------------------------------------------
Fix to boot kernel on exynos5440 which has no specific map_io(). Current 
kernel
cannot support no CPU specific map_io() for Samsung SoCs.

----------------------------------------------------------------
Kukjin Kim (1):
       ARM: SAMSUNG: fix to support for missing cpu specific map_io

  arch/arm/plat-samsung/init.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
