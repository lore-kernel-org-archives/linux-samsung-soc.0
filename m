From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 04/10] Samsung S3C24XX DT-2 for v3.11
Date: Wed, 19 Jun 2013 05:00:16 +0900
Message-ID: <51C0BC50.3080405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:36474 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908Ab3FRUAV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 16:00:21 -0400
Received: by mail-pb0-f43.google.com with SMTP id md12so4260051pbc.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 13:00:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

The following changes since commit 35aca36450e6c3fb3b3fe9ea60a7c4689a219a87:

   ARM: dts: add devicetree support for s3c2416-smdk2416 (2013-05-21 
01:06:12 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/s3c24xx-dt-2

for you to fetch changes up to 52c76e44f1b8e63474b9ef5455f657c13e983e95:

   ARM: S3C24XX: update uart addresses in s3c2416-dt auxdata (2013-06-19 
02:40:18 +0900)

----------------------------------------------------------------
based on tags/s3c24xx-dt-1
- update uart addresses in s3c2416-dt auxdata due to removing 
S3C2410_PA_UARTX

----------------------------------------------------------------
Heiko Stuebner (1):
       ARM: S3C24XX: update uart addresses in s3c2416-dt auxdata

  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
