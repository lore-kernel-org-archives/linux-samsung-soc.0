From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 0/4] clk: samsung: pm fixes and multiple aliases
Date: Wed, 13 Mar 2013 14:58:18 +0100
Message-ID: <201303131458.18671.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59096 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932295Ab3CMN6Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 09:58:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Second version of the fixes to address comments gathered from the first
version, like not entering the dt code on non-dt platforms even if
dt-support is present in the kernel.

Patch 1 and 3 got "Reviewed-by" tags but I only included the one for
patch 1, because patch 3 changed due to the changes in patch 2.

Heiko Stuebner (4):
  clk: samsung: register clk_div_tables for divider clocks
  clk: samsung: fix pm init on non-dt platforms
  clk: samsung: always allocate the clk_table
  clk: samsung: add infrastructure to add separate aliases

 drivers/clk/samsung/clk.c |   72 +++++++++++++++++++++++++++++++++++---------
 drivers/clk/samsung/clk.h |   34 ++++++++++++++++++--
 2 files changed, 87 insertions(+), 19 deletions(-)

-- 
1.7.2.3
