From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Tue, 22 Jun 2010 16:16:21 +0300
Message-ID: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:58405 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748Ab0FVNQh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 09:16:37 -0400
Received: by fxm10 with SMTP id 10so2407265fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 06:16:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vasily Khoruzhick <anarsoul@gmail.com>, Darius Augulis <augulis.darius@gmail.com>

This patch series fixes SDHCI on S3C2416. I got SD card working with this patches
and with patches for GPIO card detection support by Marek Szyprowski.
