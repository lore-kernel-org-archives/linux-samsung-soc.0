From: Ben Dooks <ben-linux@fluff.org>
Subject: Samsung clock changes
Date: Tue,  1 Dec 2009 01:43:06 +0000
Message-ID: <1259631793-25480-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:39984 "EHLO
	teyla.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752557AbZLABmz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2009 20:42:55 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, laforge@gnumonks.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Initial run of clock changes, only tested past the 'they build'
stage. If someone else can test and report success then that
would be helpful.

git branch next-samsung-clock will get you these plus most of
the other s3c64xx and s3c24xx changes since 2.6.32-rc7.

As such the s5pc1xx code has only be touched as far as fixing
the merge problems with the update 'clk_ops' code and has yet
to have the common clksrc code patches applied to it.
