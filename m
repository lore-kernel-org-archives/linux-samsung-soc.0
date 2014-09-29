From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/3] Some cleanup for samsung clock
Date: Mon, 29 Sep 2014 13:17:45 +0530
Message-ID: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63495 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbaI2Hwr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:52:47 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCN00BKTKJX7870@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Sep 2014 16:52:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series does some cleanup of samsung clock files and fixes
one typo in clk.h

Changes since v1:
 - Added patch commit message description to patch 1/3 and 2/3.

Pankaj Dubey (3):
  clk: samsung: Spelling s/bwtween/between/
  clk: samsung: remove unnecessary CONFIG_OF from clk.c
  clk: samsung: remove unnecessary inclusion of header files from clk.h

 drivers/clk/samsung/clk.c |    5 ++---
 drivers/clk/samsung/clk.h |    6 +-----
 2 files changed, 3 insertions(+), 8 deletions(-)

-- 
1.7.9.5
