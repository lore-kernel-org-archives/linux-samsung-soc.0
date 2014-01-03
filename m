From: Tushar Behera <tushar.behera@linaro.org>
Subject: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Fri, 3 Jan 2014 17:19:10 +0530
Message-ID: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:38408 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751116AbaACLtL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 06:49:11 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so15636723obb.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 03:49:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

We are getting boot-time system hang on Exynos4210-based Origen board
if the kernel (right now testing v3.13-rc6) is built using
exynos_defconfig, disabling SMP support and enabling CPU_IDLE support.
The boot log can be found here[1].

Git bisect points to following commit.

commit 87107d89052bcec1fe91b309631de4ed294a5171
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Jun 19 01:36:52 2013 +0900

    ARM: EXYNOS: Remove legacy L2X0 initialization

    Since Exynos is now supporting only DT-based boot, the old L2X0
    initialization code is not needed anymore, so exynos4_l2x0_cache_init()
    can be greatly simplified.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Tomasz Figa <t.figa@samsung.com>
    Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
    Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Reverting the changes, the kernel boots up.

Any idea what else we might be missing?

[1] http://pastebin.com/0mP6ML4y
-- 
Tushar Behera
