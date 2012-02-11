From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] samsung dt fixes-3 for v3.3
Date: Sun, 12 Feb 2012 03:02:15 +0900
Message-ID: <4F36AD27.5000503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:56268 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752131Ab2BKSCV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 13:02:21 -0500
Received: by daed14 with SMTP id d14so3248655dae.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2012 10:02:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof,

Please pull samsung fixes-3 for v3.3.
There are regarding exynos dt fixes.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit d65b4e98d7ea3038b767b70fe8be959b2913f16d:

   Linux 3.3-rc3 (2012-02-08 19:21:53 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
  v3.3-samsung-fixes-3

Karol Lewandowski (1):
       ARM: EXYNOS: Bring exynos4-dt up to date

Thomas Abraham (1):
       ARM: EXYNOS: Add cpu-offset property in gic device tree node

  arch/arm/boot/dts/exynos4210.dtsi      |    1 +
  arch/arm/mach-exynos/mach-exynos4-dt.c |    8 ++++++--
  2 files changed, 7 insertions(+), 2 deletions(-)
