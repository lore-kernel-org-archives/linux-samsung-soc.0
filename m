From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 0/2] Add support for clocks in S5M8767
Date: Wed, 19 Feb 2014 11:54:34 +0530
Message-ID: <1392791076-28301-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:53728 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846AbaBSGaJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 01:30:09 -0500
Received: by mail-pd0-f180.google.com with SMTP id x10so17313999pdj.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Feb 2014 22:30:09 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org

S5M8767 chip has 3 crystal oscillators which are operated in the same
as the crystal oscillators in S2MPS11. Extend s2mps11-clk driver to
support clocks in S5M8767.

The patches are rebased on top of next-20130218.

Tushar Behera (2):
  clk: clk-s2mps11: Refactor for including support for other MFD clocks
  clk: clk-s2mps11: Add support for clocks in S5M8767 MFD

 drivers/clk/Kconfig       |    6 ++++--
 drivers/clk/clk-s2mps11.c |   25 +++++++++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
1.7.9.5
