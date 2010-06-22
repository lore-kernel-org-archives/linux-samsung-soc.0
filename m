From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Add support of SD/MMC card detection on SMDK2416 board
Date: Tue, 22 Jun 2010 16:54:16 +0300
Message-ID: <1277214857-817-1-git-send-email-jekhor@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:51516 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753720Ab0FVNyf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 09:54:35 -0400
Received: by fxm10 with SMTP id 10so2433581fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 06:54:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Darius Augulis <augulis.darius@gmail.com>

This patch adds card detection setup to SDHCI platform data on SMDK2416.
It was not tested because I don't have access to SMDK2416 board anymore,
but I tested similar patch on another board.


Note: it depends on patches:

ARM: S3C24XX: Fix gpiolib support for ports K..M
ARM: S3C2416: Add clock definition for HSMMC1
ARM: S3C2416: Add platform helpers for setup SDHCI
Samsung: sdhci-s3c: add support for new card detection methods
sdhci-s3c: add support for the non standard minimal clock value
sdhci-s3c: add support for new card detection methods
