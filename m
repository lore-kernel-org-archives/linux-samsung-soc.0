From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [samsung-soc] CPUfreq Linux clock API question
Date: Fri, 11 Dec 2009 14:47:06 +0100
Message-ID: <000b01ca7a68$6d5f4cb0$481de610$%majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27311 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758185AbZLKNr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 08:47:26 -0500
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUH0015LQB68E@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 13:47:30 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KUH00IX5QB67N@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 13:47:30 +0000 (GMT)
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, Tomasz Fujak <t.fujak@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org

Hello all,

I'm working on providing cpufreq functionality for S5PC110 Samsung SoC.
For this purpose I'm using clock API's clk_set_rate function. All the code
is very similar to the one from S3C64xx.
Using standard clock API I've managed to control only the ARM core clock
frequency (and reduce chip power consumption in this way).

After some studies I've concluded that it would be welcome to change rate
(to be precise clock dividers values) for two clock simultaneously. It could
provide opportunities for further power savings. 

The clock API used at S3C64xx seems not to allow for setting rate of two
clocks simultaneously (or am I wrong? :-) ). 

If this change would not be possible, then have anyone thought about the way
to provide such functionality? 

It is always possible to "hack" the kernel clock API and provide new
pointers to new methods in the struck clk (and implement those new methods).
However I'm concerned if this "new" code would be accepted by the open
source community. 

As a good programming practice, I'd like to use already implemented and
tested API.

Sharing any experience in designing/programming kernel clock API will be
appreciated :-)

Best regards,
Lukasz Majewski

Samsung R&D Center, Poland
