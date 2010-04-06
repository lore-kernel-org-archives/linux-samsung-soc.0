From: ch.naveen@samsung.com
Subject: S3C64XX & S3C24XX TS/ADC support in mainline
Date: Tue, 06 Apr 2010 10:35:10 +0530
Message-ID: <1270530310-24119-1-git-send-email-ch.naveen@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63602 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab0DFFFJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Apr 2010 01:05:09 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L0F00HY6VGJPP@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Apr 2010 14:05:08 +0900 (KST)
Received: from localhost.localdomain ([107.108.83.161])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L0F007ZQVGGWJ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Apr 2010 14:05:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Naveen Krishna CH <ch.naveen@samsung.com>

From: Naveen Krishna CH <ch.naveen@samsung.com>

Hi Ben,

This is Naveen from Samsung, India. 

I'm working on adding support for TS/ADC for the following boards
6410, 6440 and V210 on 2.6.34-rc2 kernel. 

1)
I did some initial work and found that the current driver 
(s3c24xx_ts.c) exists for ARCH_S3C24XX alone 
and which requires ADC for S3C24XX.  

Though. there is no board under (mach-s3c24XX) implementing the 
touchscreen driver.

I would like to know, on what all boards is this driver tested  & 
how much compatible it is with S3C64XX and S5P series SoCs.

2)
I also have a design issue with 
a.  There are some GPIO config specific to 2410 in the current driver.
b.  It uses only 1 IRQ (PenDown) and 
c.  The ISR for this IRQ uses the ADC APIs.

I have a reference driver, which uses 2 IRQs 
One for PENDOWN and another Stylus Action.
And this driver does not use the ADC driver.

TS on S3C64XX and S5P series does not seem to need
ADC driver as such. 

I need your suggestions on this. 


-- 
Thank You,
(: Naveen Krishna Ch :)
