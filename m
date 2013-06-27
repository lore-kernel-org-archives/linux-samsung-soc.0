From: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Subject: Broken IRQ handling for S3C2416
Date: Thu, 27 Jun 2013 12:59:07 +0100
Message-ID: <51CC290B.5080701@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lmv.inov.pt ([146.193.64.2]:51837 "EHLO lmv.inov.pt"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752165Ab3F0MTB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Jun 2013 08:19:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Hi,

While migrating from kernel 3.8 to kernel 3.9 I've detected a problem o=
n my=20
S3C2416 based board. I'm using UART 3 as console and with kernel 3.9 I'=
m unable to=20
have a getty working on that port and see a lot of these on dmesg:

samsung-uart s3c2440-uart.3: cannot get irq 94

Also WDT is not correctly initialized in 3.8, I see in dmesg:

s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabled, irq disable=
d

while in 3.9 I see:

s3c2410-wdt s3c2410-wdt: tmr_margin value out of range, default 15 used
s3c2410-wdt s3c2410-wdt: failed to install irq (-38)
s3c2410-wdt: probe of s3c2410-wdt failed with error -38

So I guess something is broken in 3.9 kernel's IRQ handling for S3C2416=
=2E

Best regards,
Jos=E9 Gon=E7alves
