From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/4] Samsung pinctrl-2 for v3.7
Date: Fri, 21 Sep 2012 15:22:18 +0900
Message-ID: <505C079A.8020801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53605 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752189Ab2IUGW2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:22:28 -0400
Received: by pbbrr4 with SMTP id rr4so1911825pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 23:22:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

Hi Arnd, Olof

This is for fix typo and correct fucntion for Samsung pinctrl and since 
this has a dependency with previous pinctrl branch I created this based 
on that.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 011527b45f8e3092e1f3192e5aea94187a6ca269:

   ARM: EXYNOS: Enable pinctrl driver support for EXYNOS4 device tree 
enabled platform (2012-09-07 06:14:26 +0900)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pinctrl-samsung-2

Tomasz Figa (7):
       pinctrl: exynos: Set pin function to EINT in irq_set_type of GPIO 
EINTa
       pinctrl: exynos: Fix typos in gpio/wkup _irq_mask
       pinctrl: exynos: Handle only unmasked wakeup interrupts
       pinctrl: exynos: Mark exynos_irq_demux_eint as inline
       pinctrl: exynos: Correct the detection of wakeup-eint node
       pinctrl: samsung: Uninline samsung_pinctrl_get_soc_data
       pinctrl: exynos: Fix wakeup IRQ domain registration check

  drivers/pinctrl/pinctrl-exynos.c  |   41 
+++++++++++++++++++++++++++----------
  drivers/pinctrl/pinctrl-exynos.h  |    1 +
  drivers/pinctrl/pinctrl-samsung.c |    2 +-
  3 files changed, 32 insertions(+), 12 deletions(-)
