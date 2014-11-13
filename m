From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 0/4 V3] Arndale: Adding Sound Machine Driver for ALC5631 Codec
Date: Thu, 13 Nov 2014 17:44:20 +0530
Message-ID: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27070 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932512AbaKMMPK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 07:15:10 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEZ00FUW8P8TZB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 21:15:08 +0900 (KST)
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
        - Removed i2s specific changes
        - Added signed off of claude
        - Removed CONFIG_OF check from rt5631.c codec driver and other changes

Krishna Mohan Dani (4):
  ASoC: ALC5631/RT5631: Add device tree binding documentation
  ASoC: Samsung: Add arndale_rt5631 machine driver
  Sound: Kconfig: Adding the description of the codec
  ASoC: rt5631: Adding Device Tree compatibility to Realtek's
    ALC5631/RT5631 codec driver

 Documentation/devicetree/bindings/sound/rt5631.txt |   48 +++++++
 sound/soc/codecs/Kconfig                           |    3 +-
 sound/soc/codecs/rt5631.c                          |    9 ++
 sound/soc/samsung/Kconfig                          |    6 +
 sound/soc/samsung/Makefile                         |    2 +
 sound/soc/samsung/arndale_rt5631.c                 |  150 ++++++++++++++++++++
 6 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rt5631.txt
 create mode 100644 sound/soc/samsung/arndale_rt5631.c

-- 
1.7.9.5
