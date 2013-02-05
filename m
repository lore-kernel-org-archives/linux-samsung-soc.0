From: Alexander Varnin <fenixk19@mail.ru>
Subject: Help connect s3c2410-lcd device to SMDK2443
Date: Tue, 05 Feb 2013 23:36:20 +0400
Message-ID: <51115F34.8030503@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback6.mail.ru ([94.100.176.134]:48596 "EHLO
	fallback6.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756658Ab3BEVHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 16:07:44 -0500
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [94.100.177.91])
	by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id 85D8FA5C9830
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Feb 2013 23:36:50 +0400 (MSK)
Received: from [46.28.89.34] (port=59946 helo=[10.1.1.191])
	by smtp31.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1U2oJb-0003bX-Dd
	for linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 23:36:23 +0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello. I'm trying to setup "s3c2410-lcd" device on SMDK2443 with 3.6 kernel.
On requesting interrupt it fails with EINVAL:
~ # dmesg | grep lcd
s3c2410-lcd s3c2410-lcd: cannot get irq 32 - err -22
s3c2410-lcd: probe of s3c2410-lcd failed with error -16


The interrupt is not busy by something else. Here is my table:
~ # cat /proc/interrupts
CPU0
  17:          0  s3c-ext0 s3c-mci
  30:     409934       s3c  S3C2410 Timer Tick
  37:          0       s3c s3c-mci
  42:        416       s3c ohci_hcd:usb1
  43:          0       s3c s3c2410-i2c
  56:          1   s3c-ext uio_mcross
  57:      72585   s3c-ext eth0
  73:         63  s3c-uart1 s3c2440-uart
  74:        108  s3c-uart1 s3c2440-uart
  97:          0         - s3c2410-wdt
Err:

Please, help me to find the reason.
