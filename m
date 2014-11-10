From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 0/4] Arndale: Adding Sound Machine Driver for ALC5631 Codec
Date: Mon, 10 Nov 2014 13:31:55 +0530
Message-ID: <1415606519-30744-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53419 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbaKJICa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Nov 2014 03:02:30 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NET00KDED03TS90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Nov 2014 17:02:27 +0900 (KST)
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

Krishna Mohan Dani (4):
  ASoC: ALC5631: Add device tree binding documentation
  Sound: Samsung: Add sound card machine driver for Arndale Board
  Sound: Kconfig: Adding the description of the codec
  Sound: DT: Adding Device Tree compatibility to Realtek's ALC5631
    codec driver

 Documentation/devicetree/bindings/sound/rt5631.txt |   41 +++++
 sound/soc/codecs/Kconfig                           |    3 +-
 sound/soc/codecs/rt5631.c                          |   11 ++
 sound/soc/samsung/Kconfig                          |    6 +
 sound/soc/samsung/Makefile                         |    2 +
 sound/soc/samsung/arndale_rt5631.c                 |  167 ++++++++++++++++++++
 6 files changed, 229 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rt5631.txt
 create mode 100644 sound/soc/samsung/arndale_rt5631.c

-- 
1.7.9.5
