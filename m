From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 0/4] clk: samsung: small fixes and enhancements
Date: Tue, 12 Mar 2013 00:42:09 +0100
Message-ID: <201303120042.09633.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39947 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754178Ab3CKXmS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 19:42:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Small fixes and enhancements that came up when implementing the
common clock support for s3c2443, s3c2416 and s3c2450.

The 3rd and 4th patch enable the adding of separate aliases
to previously defined clocks, as discussed with Sylwester Nawrocki.

This is often needed as some clocks need more than one alias. The hsmmc
hclks on s3c2416 for example are both "hsmmc" and "mmc_busclk.0" .

These changes are required for the common clock conversion of s3c24xx SoCs.

Heiko Stuebner (4):
  clk: samsung: register clk_div_tables for divider clocks
  clk: samsung: remove np check in clock init
  clk: samsung: always allocate the clk_table
  clk: samsung: add infrastructure to add separate aliases

 drivers/clk/samsung/clk.c |   51 +++++++++++++++++++++++++++++++++++++++-----
 drivers/clk/samsung/clk.h |   34 ++++++++++++++++++++++++++---
 2 files changed, 75 insertions(+), 10 deletions(-)

-- 
1.7.2.3
