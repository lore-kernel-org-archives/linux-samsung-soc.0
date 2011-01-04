From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] ARM: SAMSUNG: Tidy init+disable clock usage
Date: Tue,  4 Jan 2011 18:30:46 +0900
Message-ID: <1294133453-32210-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60301 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab1ADJz3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 04:55:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches change the clock registration code to use the
s3c_register_clocks() followed by s3c_disable_clocks() instead
of the loops it was using on S3C64XX and S5P SoCs.

[PATCH 1/7] ARM: S3C64XX: Tidy register and disable clock usage
[PATCH 2/7] ARM: S5P6440: Tidy register and disable clock usage
[PATCH 3/7] ARM: S5P6442: Tidy register and disable clock usage
[PATCH 4/7] ARM: S5P6450: Tidy register and disable clock usage
[PATCH 5/7] ARM: S5PC100: Tidy register and disable clock usage
[PATCH 6/7] ARM: S5PV210: Tidy init+disable clock usage and s3c24xx_register_clocks cleanup
[PATCH 7/7] ARM: S5PV310: Tidy init+disable clock usage and s3c24xx_register_clocks cleanup
