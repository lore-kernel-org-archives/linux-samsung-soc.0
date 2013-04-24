From: Olof Johansson <olof@lixom.net>
Subject: Exynos regressions w.r.t. config and debuggability due to multiplatform
Date: Tue, 23 Apr 2013 20:34:32 -0700
Message-ID: <CAOesGMgRsa-AvbEZCc1=_ovaZMaG0S-CDok2MDp_zu5yderAYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:52598 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757473Ab3DXDed (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 23:34:33 -0400
Received: by mail-wi0-f173.google.com with SMTP id c10so6893864wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 20:34:32 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Arnd,

I think we should hold off on multiplatform for exynos until it works
better, i.e. 3.11.

First, the defconfig we have in our out-of-tree build system now
builds a broken kernel since it doesn't set ARCH_EXYNOS_SINGLE. As a
result, exynos gets turned off. It's quite awkward to switch between
pre- and post-multiplatform configs, which makes bisecting and other
error finding hard. I'm sure this will hit other downstream users too.

What's even more frustrating is that I can't turn on DEBUG_LL, since
serial drivers depend on PLAT_SAMSUNG, and that is no longer set.

Seems like we'll have a really broken 3.10 if we merge what we have
now. More bake time is definitely needed. :(


-Olof
