From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup-2 for v3.5
Date: Sun, 20 May 2012 07:26:50 +0900
Message-ID: <4FB81E2A.1050806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49355 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755905Ab2ESW04 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 18:26:56 -0400
Received: by dady13 with SMTP id y13so5249821dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 15:26:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Please pull Samsung cleanup-2 for v3.5 from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-samsung-2

It is including cleanup of s3c64xx-cpuidle to use new api and has no 
dependency with other branches.

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
next/cleanup-samsung-2

Daniel Lezcano (2):
       ARM: S3C64XX: declare the states with the new api on cpuidle
       ARM: S3C64XX: use timekeeping wrapper on cpuidle

  arch/arm/mach-s3c64xx/cpuidle.c |   45 
+++++++++++++--------------------------
  1 files changed, 15 insertions(+), 30 deletions(-)
