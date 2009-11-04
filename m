From: jassisinghbrar@gmail.com
Subject: Revised patches for PCM Controller driver
Date: Wed,  4 Nov 2009 17:27:44 +0900
Message-ID: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37788 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753259AbZKDIdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Acting upon the inputs given by Mark and Ben, I have revised the code.
A few points to be noted:-

1) The prefix s3c24xx_pcm_ in the platform driver has been changed to
   more neutral s3c_audio_

2) ALSA platform driver s3c24xx-pcm.c/h have been renamed s3c-audio.c/h
   since the 'pcm' part will cause ambiguity once PCM Controller driver
   is added. Also, since it is not just for 24xx, the part is dropped
   from the prefix.
   Ofcourse, evey dependent code has been modified to include differently
   named, otherwise same, header s3c-audio.h

3) arch/arm/plat-s3c/include/plat/audio.h has been restored by with only
   necessary data structures.
   Having callbacks to configure controller pins appropriately is necessary
   if the driver is to handle more than one SoC type.
   Currently only callback to configure gpios has been defined, the data
   structure will grow as and when needed.

4) The PCM controller platform devices have been defined in the apparently
   common arch/arm/plat-s3c64xx/dev-audio.c rather than a new PCM specific one.

5) Here comes the tricky one.
   Breaking away from S3C convention, I have defined PCM controller register
   offsets and bit fields in sound/soc/s3c24xx/s3c-pcm.h instead of some
   platform/arch specific header.
   The reason for the move is that usually the device controllers depend upon
   platform type only as far as their base mapping address goes. Otherwise
   just one or two 'types' of same devices serve most SoCs.
   Having those definitions besides the driver helps avoid copyng the same
   definitions for each platform that essentially have the same device controller.

Regards.
   
