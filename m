From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] exynos cpufreq fix for v3.4
Date: Thu, 05 Apr 2012 08:26:04 -0700
Message-ID: <4F7DB98C.9090707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:39423 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab2DEP0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 11:26:09 -0400
Received: by gghe5 with SMTP id e5so746512ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 08:26:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Dave Jones <davej@redhat.com>

Hi Arnd, Olof,

Please pull fix exposure of exynos cpufreq. Now, exynos4x12-cpufreq and 
exynos5250-cpufreq can be selected on non-exynos stuff and it means can 
happen build error.
I got the ack from Dave and he agreed to send this to Linus via samsung 
tree. So please pull this and send to upstream.

If any problem, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit dd775ae2549217d3ae09363e3edb305d0fa19928:

   Linux 3.4-rc1 (2012-03-31 16:24:09 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.4-cpufreq-exynos-fixes

Kukjin Kim (1):
       EXYNOS: fix dependency for EXYNOS_CPUFREQ

  drivers/cpufreq/Kconfig.arm |   10 +++-------
  1 files changed, 3 insertions(+), 7 deletions(-)
