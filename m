From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH 0/3] ARM: S5PV310: Add I2C support
Date: Thu,  7 Oct 2010 20:15:29 +0900
Message-ID: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36984 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210Ab0JGLYr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 07:24:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds the I2C support for S5PV310

[PATCH 1/3] ARM: SAMSUNG: Add a helper function for I2C(3,4,5,6,7) platform devices
[PATCH 2/3] ARM: S5PV310: Add address and IRQ definitions for I2C(1,2,3,4,5,6,7)
[PATCH 3/3] ARM: S5PV310: Add I2C(0,1,3,4,5,6,7) support
