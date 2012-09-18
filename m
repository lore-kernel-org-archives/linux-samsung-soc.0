From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-3 for v3.6
Date: Tue, 18 Sep 2012 22:54:34 +0930
Message-ID: <50587612.4030304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34389 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756790Ab2IRNYl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 09:24:41 -0400
Received: by obbuo13 with SMTP id uo13so10390700obb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Sep 2012 06:24:41 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

This is re-sending Samsung fixes-3 I talked to Olof before.

The branch is including two commits are using spin_lock_{irqsave, 
irqrestore} in clk_set_parent() and clk_set_rate() to avoid spinlock 
recursion/locking.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:

   Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
v3.6-samsung-fixes-3

Mandeep Singh Baines (1):
       ARM: SAMSUNG: use spin_lock_irqsave() in clk_set_parent

Tushar Behera (1):
       ARM: SAMSUNG: Use spin_lock_{irqsave,irqrestore} in clk_set_rate

  arch/arm/plat-samsung/clock.c |   10 ++++++----
  1 files changed, 6 insertions(+), 4 deletions(-)
