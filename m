From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 0/4 V2] Arndale: Adding Sound Machine Driver for ALC5631 Codec
Date: Wed, 12 Nov 2014 14:05:35 +0530
Message-ID: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36440 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751895AbaKLIgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 03:36:10 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEX001P93W3X0C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Nov 2014 17:36:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

These patches add machine driver to instantiate I2S based realtek's
 ALC5631 based sound card on Arndale board.

There are other variants of Audio Daughter Cards for Arndale
Board for which support already exists but there is no support for
Realtek's alc5631 codec based card hence support for ALC5631 based
machine driver is being added.

Most of the code has been pulled from insignal's git for Arndale and
modified to suit the maintain syntax. Machine driver has been made
DT compatible.

Changes done:
	- Removed ifdef for of_device_id structure as commented by Mark Brown
	- Supporting both variants of device name:alc5631 and rt5631 as
	  commented by Mark Brown
	- Added "return -EINVAL" if cpu_of_node or codec_of_node is not
	  found in dtb, as commented by Anil Kumar 

Krishna Mohan Dani (4):
  ASoC: ALC5631/RT5631: Add device tree binding documentation
  ASoC: Samsung: Add arndale_rt5631 machine driver
  Sound: Kconfig: Adding the description of the codec
  ASoC: rt5631: Adding Device Tree compatibility to Realtek's ALC5631
    codec driver

 Documentation/devicetree/bindings/sound/rt5631.txt |   48 ++++++
 sound/soc/codecs/Kconfig                           |    3 +-
 sound/soc/codecs/rt5631.c                          |   11 ++
 sound/soc/samsung/Kconfig                          |    6 +
 sound/soc/samsung/Makefile                         |    2 +
 sound/soc/samsung/arndale_rt5631.c                 |  166 ++++++++++++++++++++
 6 files changed, 235 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rt5631.txt
 create mode 100644 sound/soc/samsung/arndale_rt5631.c

-- 
1.7.9.5
