From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: exynos4412: misc issues on Hardkernel Odroid boards
Date: Sun, 08 Feb 2015 16:00:11 +0100
Message-ID: <54D779FB.9070306@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33148 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755873AbbBGU0H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Feb 2015 15:26:07 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

I've collected some of the more serious remaining problems on the
Hardkernel Odroid boards (here on an X2).

1) When using cpufreq-exynos and having selected the 'ondemand'
governor, the system shutdown/reboot process doesn't complete and hangs
before the end. I'm currently hotfixing this by switching to
'performance' governor in a custom initscript.

2) When reading the 'clk_summary' debugfs entry the system locks up
immediately. Currently hotfixing this by having the ISP powerdomain
always-on. The problem seems to be known, at least it was mentioned here:
http://www.spinics.net/lists/linux-samsung-soc/msg39488.html

3) Maybe related to (1). I'm experiencing high SoC temperatures after
shutting the system down and leaving the AC connector plugged into the
board. The shutdown procedure is like mentioned in (1): Switch to
'performance' and then do a normal 'shutdown -h now'. I was wondering if
the Odroid boards need a special shutdown procedure (like designed in
the odroid-restart handler patch) after all.

4) Spinlock BUGs triggered by the sdhci subsystem (so for the people
using the system with a SD card). This is also a known problem, I think
first mentioned here: http://www.spinics.net/lists/linux-mmc/msg27277.html
Currently fixing this with this patch:
https://github.com/tobiasjakobi/linux-odroid/commit/abc749843dd7022d01322dca3db0181211a30cd8


With best wishes,
Tobias
