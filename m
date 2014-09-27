From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/3] Some cleanup for samsung clock
Date: Sat, 27 Sep 2014 11:11:56 +0530
Message-ID: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11949 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751177AbaI0Fqo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 01:46:44 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCJ00JHFPDUAYB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 27 Sep 2014 14:46:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series does some cleanup of samsung clock files and fixes
one typo in clk.h

Pankaj Dubey (3):
  clk: samsung: Spelling s/bwtween/between/
  clk: samsung: remove unnecessary CONFIG_OF from clk.c
  clk: samsung: remove unnecessary inclusion of header files from clk.h

 drivers/clk/samsung/clk.c |    5 ++---
 drivers/clk/samsung/clk.h |    6 +-----
 2 files changed, 3 insertions(+), 8 deletions(-)

-- 
1.7.9.5
