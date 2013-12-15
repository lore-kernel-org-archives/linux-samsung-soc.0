From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/7] Samsung irq for v3.14
Date: Mon, 16 Dec 2013 05:22:36 +0900
Message-ID: <52AE0F8C.3040408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:35567 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab3LOUWo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 15:22:44 -0500
Received: by mail-pa0-f50.google.com with SMTP id kl14so2065632pab.37
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 12:22:43 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-irq

for you to fetch changes up to 9403ac88220d79f8822e22c875ad1ebd7ffbea6f:

   irqchip: exynos-combiner: remove hard-coded irq_base value 
(2013-12-02 07:15:51 +0900)

----------------------------------------------------------------
Samsung irq update for v3.14
- use linear irq domain for exynos-combiner

----------------------------------------------------------------
Chander Kashyap (1):
       irqchip: exynos-combiner: remove hard-coded irq_base value

  drivers/irqchip/exynos-combiner.c | 15 +++------------
  1 file changed, 3 insertions(+), 12 deletions(-)
