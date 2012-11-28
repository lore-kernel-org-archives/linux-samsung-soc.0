From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 7/7] Samsung boards-2 for v3.8
Date: Wed, 28 Nov 2012 09:16:22 +0900
Message-ID: <50B557D6.3050109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60067 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab2K1AQ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:16:28 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so9281234pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:16:28 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

This is for Samsung board updates just for s3c64xx

This is based on next/board-samsung branch is already included in 
arm-soc tree.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung-2

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 5a7eb8e4fedc03b5c511a61986bff6f6d31c693f:

   ARM: S3C64XX: Add missing device selects for Cragganmore (2012-11-20 
20:13:58 +0900)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung-2

Mark Brown (2):
       ARM: S3C64XX: Add registration of WM2200 Bells device on Cragganmore
       ARM: S3C64XX: Add dummy supplies for Glenfarclas LDOs

  arch/arm/mach-s3c64xx/mach-crag6410.c |   20 ++++++++++++++++++--
  1 files changed, 18 insertions(+), 2 deletions(-)
