From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 0/2] ARM: SAMSUNG: Add Support Power Domain Control
Date: Fri,  3 Dec 2010 18:39:42 +0900
Message-ID: <1291369184-31460-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58952 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755853Ab0LCJxX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 04:53:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com

This patch adds support Power Domain Control based on Runtim PM.

Each Power Domain is represented by a Power Domain device and the devices
belong to these Power Domains should be set as a child device of the Power
Domain devices. The corresponding drivers of the devices should implement
Runtime PM to control the Power Domains.

Changes since V1:
- Removed calling of 'samsung_pd_init()' from machine specific code to arch_initcall as Ben's suggestion.
- Use "base" variable in platform data instead of using long switch case statement as Marek's suggestion.
- Add GPS power domain.

[PATCH V2 1/2] ARM: SAMSUNG: Add support for Power Domain control
[PATCH V2 2/2] ARM: S5PV310: Add support Power Domain
