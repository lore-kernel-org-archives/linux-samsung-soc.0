From: Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [PATCH 0/4] media: don't print error when adding adapter fails
Date: Tue,  9 Aug 2016 13:35:12 +0200
Message-ID: <1470742517-12774-1-git-send-email-wsa-dev@sang-engineering.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa-dev@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Since v4.8-rc1, the I2C core will print detailed information when adding an I2C
adapter fails. So, drivers can skip this now.

Should go via subsystem tree, I'd think.

Wolfram Sang (4):
  media: pci: netup_unidvb: don't print error when adding adapter fails
  media: pci: pt3: don't print error when adding adapter fails
  media: platform: exynos4-is: fimc-is-i2c: don't print error when
    adding adapter fails
  media: usb: dvb-usb-v2: dvb_usb_core: don't print error when adding
    adapter fails

 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 5 +----
 drivers/media/pci/pt3/pt3.c                       | 4 +---
 drivers/media/platform/exynos4-is/fimc-is-i2c.c   | 5 +----
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c       | 2 --
 4 files changed, 3 insertions(+), 13 deletions(-)

-- 
2.8.1
