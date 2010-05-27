From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] Add Compact Flash driver for Samsung SoCs
Date: Thu, 27 May 2010 17:22:00 +0900
Message-ID: <1274948524-2970-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48710 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755428Ab0E0IZO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 04:25:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches add PATA driver for Samsung SoCs. And this enables
support for Compact Flash interfacing with Samsung SoCs.

[PATCH 1/4] ARM: S3C64XX: Add support for Compact Flash driver on SMDK6410
[PATCH 2/4] ARM: S5PV210: Add support for Compact Flash driver on SMDKV210/SMDKC110
[PATCH 3/4] ARM: S5PC100: Add support for Compact Flash driver on SMDKC100
[PATCH 4/4] pata_samsung: Add Samsung PATA controller driver
