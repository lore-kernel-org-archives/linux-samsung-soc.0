From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] samsung devel-rtc for v3.4
Date: Sun, 12 Feb 2012 03:09:34 +0900
Message-ID: <4F36AEDE.6060506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:47447 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536Ab2BKSJj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 13:09:39 -0500
Received: by pbcun15 with SMTP id un15so3356014pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2012 10:09:39 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

Hi Arnd, Olof again :)

Please pull samsung rtc developing which has been missed to upstream.
I rebased it Olof said and there is no conflicts with
arm-soc/depends/rmk/for-armsoc.

If any problem, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 62aa2b537c6f5957afd98e29f96897419ed5ebab:

   Linux 3.3-rc2 (2012-01-31 13:31:54 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-next/devel-samsung-rtc

Heiko Stuebner (4):
       ARM: SAMSUNG: cleanup of rtc register definitions
       rtc-s3c: make room for more variants in devicetree block
       rtc-s3c: add variants for S3C2443 and S3C2416
       ARM: S3C2443/S3C2416: add s3c_rtc_setname and rename rtc devices

  arch/arm/mach-s3c2416/s3c2416.c               |    2 +
  arch/arm/mach-s3c2443/s3c2443.c               |    2 +
  arch/arm/plat-samsung/include/plat/regs-rtc.h |   81 
+++++++++++++------------
  arch/arm/plat-samsung/include/plat/rtc-core.h |   27 ++++++++
  drivers/rtc/rtc-s3c.c                         |   71 
++++++++++++++++++----
  5 files changed, 131 insertions(+), 52 deletions(-)
  create mode 100644 arch/arm/plat-samsung/include/plat/rtc-core.h
