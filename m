From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 0/4] modify clock codes of rtc-s3c driver
Date: Tue, 11 Aug 2015 20:28:05 +0900
Message-ID: <55C9DC45.4090102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59288 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933911AbbHKL2G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 07:28:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, =?UTF-8?B?Iuy1nOywrOyasC9TL1cgUGxhdGZvcm0gTGFiKERNQ+yXsCkvUzQo7ISg7J6EKS8=?= =?UTF-8?B?7IK87ISx7KCE7J6QIg==?= <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi,

This patchset modifies clock codes of rtc-s3c driver. Main change is to
fix the problem that alarm interrupt can't happen. Also there are some
fixes incluing cleanup.

Thanks.

----------------------------------------------------------------
Joonyoung Shim (4):
      rtc: s3c: add missing clk control
      rtc: s3c: remove unnecessary NULL assignment
      rtc: s3c: use unified functions for enable/disable of clk
      rtc: s3c: enable/disable clocks for alarm

 drivers/rtc/rtc-s3c.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)
