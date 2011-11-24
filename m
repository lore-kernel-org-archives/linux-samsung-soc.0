From: =?ISO-8859-1?Q?Thomas_Lang=E5s?= <thomas.langaas@gmail.com>
Subject: Trying 3.2.0-rc1 with brcmfmac (BCM4329) fails
Date: Thu, 24 Nov 2011 14:00:03 +0100
Message-ID: <CANN7TQmHw2USCbUjHAegHfBgNnax9rNNkQn9NoNAWuSXqLWydg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39549 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755329Ab1KXNAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Nov 2011 08:00:04 -0500
Received: by iage36 with SMTP id e36so2958287iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Nov 2011 05:00:04 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi!

I'm trying to get the Exynos 4210 to work with the BCM4329 wifi
module, using SDIO, and
with the Android kernel for the Exynos, this works nicely, but with
the current kernel (3.2.0-rc1)
it doesn't.

After debugging (together with some devs. from Broadcom) it has been
narrowed down to:
[  267.175000] brcmf_sdioh_request_word: rw=1, func=1, addr=0x0bf98, nbytes=4
[  267.175000] mmc1: starting CMD53 arg 957f3004 flags 000001b5
[  267.175000] mmc1:     blksz 4 blocks 1 flags 00000100 tsac 1000 ms nsac 0
[  267.175000] sdhci [sdhci_irq()]: *** mmc1 got interrupt: 0x00208003
[  267.175000] before mmc_request_done
[  267.175000] mmc1: req done (CMD53): 0: 00001000 00000000 00000000 00000000
[  267.175000] mmc1:     0 bytes transferred: -84
[  267.175000] after mmc_request_done

The interrupt above is really weird because it is masked as both a
command and data.

Summary is as follows:
* 3.2.0-rc1; CMD52 read/write and CMD53 read works.  CMD53 write fails
* 2.6.35.7(android): CMD52 read/write and CMD53 read/write works.

Since the brcmfmac driver doesn't exist in the android-kernel, I tried
the bcmdhd-driver
from the ICS-kernel (after talking to Broadcom devs), and it is the same.

It seems like the error is in something else than the wifi-driver, and
I'm out of ideas, so
any help at all would be appreciated.

In advance, thanks!

-- 
Thomas
