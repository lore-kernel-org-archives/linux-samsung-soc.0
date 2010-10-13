From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] ARM: SAMSUNG: Add Support Power Domain Control
Date: Wed, 13 Oct 2010 20:47:00 +0900
Message-ID: <1286970422-15993-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51542 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab0JML4H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 07:56:07 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com

This patch adds support Power Domain Control based on Runtim PM.

Each Power Domain is represented by a Power Domain device and the devices
belong to these Power Domains should be set as a child device of the Power
Domain devices. The corresponding drivers of the devices should implement
Runtime PM to control the Power Domains.

NOTE: Depends on EINT and GPIOlib.

[PATCH 1/2] ARM: SAMSUNG: Add support for Power Domain control
[PATCH 2/2] ARM: S5PV310: Add support Power Domain
