From: Heiko =?iso-8859-1?q?St=FCbner?= <mmind@debian.org>
Subject: s3c-sdhci s3c-sdhci.1: failed to get io clock on a s3c2416
Date: Sun, 2 Jan 2011 18:42:55 +0100
Message-ID: <201101021842.55281.mmind@debian.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:55252 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753913Ab1ABRt7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 12:49:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexander Neumann <fd0@lochraster.org>

[please keep the Cc, thanks]

Hi,

we are trying to start a current kernel on a device of the Qisda ebook-reader
family. It uses both hsmmc-channels. The first one is connected to a nand-chip
from Hynix and the second is connected to a micro-sd-slot.

The system is based on a s3c2416 soc and is the basis for nearly every ebook
reader with a sipix-display at the moment. (more than 20 different models
worldwide).

We used kernel 2.6.37rc8 with the sdhci-patch from the next-s3c24xx branch.
The first channel is initialized correctly but the second channel throws the 
error mentioned. The relevant bootlog looks like this:


s3c-sdhci s3c-sdhci.0: clock source 0: hsmmc (133333333 Hz)
s3c-sdhci s3c-sdhci.0: clock source 1: hsmmc (133333333 Hz)
s3c-sdhci s3c-sdhci.0: clock source 2: hsmmc-if (96000000 Hz)
mmc0: SDHCI controller on samsung-hsmmc [s3c-sdhci.0] using ADMA
s3c-sdhci s3c-sdhci.1: failed to get io clock
mmc0: mmc_rescan: trying to init card at 400000 Hz
s3c-sdhci: probe of s3c-sdhci.1 failed with error -2
mmc0: new high speed MMC card at address 0001
mmcblk0: mmc0:0001 HYNIX  1.88 GiB
 mmcblk0: p1 p2 p3

The complete log can be found on: http://avalon.gnuzifer.de/~fd0/oyo/bootlog

Originally Qisda used something called s3c-linux which is a fork of 2.6.21.5
implementing support for Samsung SoCs and added some (propably machine
specific) voodoo to make it work.

One source of this kernel is: http://www.thalia.de/oyo_src/SG060B00_V009.tgz

If anyone could suggest what may be wrong here I would be really grateful as 
this stuff is way out my league :-)


Thanks
Heiko
