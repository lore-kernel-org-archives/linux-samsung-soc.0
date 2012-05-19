From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung board-2 for v3.5
Date: Sun, 20 May 2012 07:43:01 +0900
Message-ID: <4FB821F5.1070308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:34466 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754872Ab2ESWnG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 18:43:06 -0400
Received: by pbbrp8 with SMTP id rp8so5384518pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 15:43:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof,

Please pull 2nd Samsung board stuff from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung-2

It includes updating of Cragganmore board(S3C64XX).

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 36be50515fe2aef61533b516fa2576a2c7fe7664:

   Linux 3.4-rc7 (2012-05-12 18:37:47 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung-2

Mark Brown (2):
       ARM: S3C64XX: Initial hookup for Bells module on Cragganmore
       ARM: S3C64XX: Hook up carrier class modules on Cragganmore

  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    9 ++++++++-
  arch/arm/mach-s3c64xx/mach-crag6410.c        |    1 +
  2 files changed, 9 insertions(+), 1 deletions(-)
