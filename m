From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] usb: phy: samsung: Add support to set pmu isolation
Date: Tue, 18 Dec 2012 11:26:06 +0530
Message-ID: <1355810167-18425-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de, p.paneri@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Based on patches for samsung-usbphy driver available at:
https://patchwork.kernel.org/patch/1794651/

In this patch we are adding support to parse device tree data for
samsung-usbphy driver and further setting pmu_isolation to
enable/disable phy as and when needed.
This further chucks out the need of platform data for samsung-usbphy on
DT enabled system and hence serves the purpose of the discussion
in the thread for:
[PATCH v8 2/2] usb: s3c-hsotg: Adding phy driver support

Vivek Gautam (1):
  usb: phy: samsung: Add support to set pmu isolation

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   10 +++
 drivers/usb/phy/samsung-usbphy.c                   |   80 ++++++++++++++++++--
 2 files changed, 82 insertions(+), 8 deletions(-)

-- 
1.7.6.5
