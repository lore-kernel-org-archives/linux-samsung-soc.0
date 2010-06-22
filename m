From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 0/4] S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Tue, 22 Jun 2010 18:22:00 +0300
Message-ID: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58164 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768Ab0FVPYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 11:24:32 -0400
Received: by bwz9 with SMTP id 9so60044bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 08:24:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch series fixes SDHCI on S3C2416. I got SD card working with this patches
and with patches for GPIO card detection support by Marek Szyprowski.

Resent due error in previous post.
