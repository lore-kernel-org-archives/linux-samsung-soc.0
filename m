From: Ben Dooks <ben-linux@fluff.org>
Subject: S3C2443 clock updates
Date: Sat, 30 Jan 2010 15:11:27 +0200
Message-ID: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:64237 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752642Ab0A3NXe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:34 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Some clock updates for tidup and to use the common support in clock-clksrc
to provide many of the divided or muxed clocks.

In branch next-samsung-s3c2443-clock

Note, untested on real hardware yet
