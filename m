From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 0/3] Few cleanups for samsung clock
Date: Wed, 03 Dec 2014 17:01:29 +0530
Message-ID: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63047 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbaLCLi3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 06:38:29 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG000FAD8BXYQ10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 20:38:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series does some cleanup of samsung clock files and fixes
one typo in clk.h.

All patches in this series can be applied independently. Just for keep
track of them I grouped them in series.

Changes since v2:
 - Rebased patch against latest kgene/for-next.
 - Fix build break by not removing syscore_ops.h from clk.h.

Changes since v1:
 - Added patch commit message description to patch 1/3 and 2/3.

Pankaj Dubey (3):
  clk: samsung: Spelling s/bwtween/between/
  clk: samsung: remove unnecessary CONFIG_OF from clk.c
  clk: samsung: remove unnecessary inclusion of header files from clk.h

 drivers/clk/samsung/clk.c |    3 +--
 drivers/clk/samsung/clk.h |    6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

-- 
1.7.9.5
