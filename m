From: Darius Augulis <augulis.darius@gmail.com>
Subject: Re: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Fri, 25 Jun 2010 13:55:31 +0300
Message-ID: <4C248B23.7060905@gmail.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:61891 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753419Ab0FYKzf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 06:55:35 -0400
Received: by wyb38 with SMTP id 38so91179wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jun 2010 03:55:34 -0700 (PDT)
In-Reply-To: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vasily Khoruzhick <anarsoul@gmail.com>

On 06/22/2010 04:16 PM, Yauhen Kharuzhy wrote:
> This patch series fixes SDHCI on S3C2416. I got SD card working with this patches
> and with patches for GPIO card detection support by Marek Szyprowski.
>

Unfortunately I did not get SD card working with these patches. I'm 
using custom board, not SMDK2416, but SD slot connection and schematics 
are the same like in SMDK2416. I've tried to debug a bit this problem 
and this is what I got: kernel do detection of card insert/remove, 
driver prints messages:

s3c-sdhci s3c-sdhci.1: card inserted.
s3c-sdhci s3c-sdhci.1: card removed.

Then I put some printk in s3c-sdhci driver and MMC core and found that 
mmc_rescan() is called only once at startup and no more when 
inserting/removing SD card. Also mmc_rescan() stops at that point where 
mmc_power_up() is called and does not return. And mmc_power_up() stops 
where mmc_delay(10) is called and does not return too.
Every time when inserting/removing SD card only functions 
sdhci_tasklet_card() and mmc_detect_change() are called, and nothing 
happens. Kernel doesn't detect the card inserted.
Maybe this info could help to debug where the problem is - in my custom 
board or in your patches?

Darius.
