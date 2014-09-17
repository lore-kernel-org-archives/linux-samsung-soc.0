From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 0/2] usb: host: ehci/ohci-exynos: phy cleanup
Date: Wed, 17 Sep 2014 16:47:40 +0530
Message-ID: <1410952662-4297-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kgene.kim@samsung.com, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Cleaning up the phy getting sequence in ehci-exynos and ohci-exynos
drivers.

Hi Alan, Jingoo,

I have not imported the Acked-by and Reviewed-by from you guys, from V2 version
of this patch series, since this version is now rebased on the already available
commit in usb-next - "usb: ehci/ohci-exynos: Fix PHY getting sequence".

Please feel free to comment on it and add your Acked-by's and Reviewed-by's.

Changes since v2:
 - Rebased on top of usb-next branch, which now has
   'usb: ehci/ohci-exynos: Fix PHY getting sequence' patch.

Changes since v1:
 - This patch was part of the series "[PATCH 0/7] usb-phy: samsung: Cleanup the unused drivers"
   https://lkml.org/lkml/2014/8/14/235. I have dropped the phy cleanup patches from that series-
   Patches 1-5.
 - Rebased this patch on top of 3.17-rc1.

Vivek Gautam (2):
  usb: host: ehci-exynos: Remove unnecessary usb-phy support
  usb: host: ohci-exynos: Remove unnecessary usb-phy support

 drivers/usb/host/ehci-exynos.c |   81 +++++++++++-------------------------
 drivers/usb/host/ohci-exynos.c |   89 +++++++++++-----------------------------
 2 files changed, 47 insertions(+), 123 deletions(-)

-- 
1.7.10.4
