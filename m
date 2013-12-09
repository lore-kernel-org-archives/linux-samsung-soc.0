From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/5] phy: remove the need for the phys to know about their users
Date: Mon,  9 Dec 2013 17:08:52 +0200
Message-ID: <1386601737-8735-1-git-send-email-heikki.krogerus@linux.intel.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:35255 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932291Ab3LIPJA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 10:09:00 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi,

This replaces the consumer & init_data structures with a lookup table
that contains complete associations with the phys and their users,
removing the need for the phy drivers themselves to care about their
users even when not using DT.

The lookup method is copied from the way the gpio descriptor lookup is
now handled in gpiolib.c.


Heikki Krogerus (5):
  phy: unify the phy name parameters
  phy: add support for indexed lookup
  phy: improved lookup method
  arm: omap3: twl: use the new lookup method with usb phy
  phy: remove the old lookup method

 arch/arm/mach-omap2/twl-common.c    |  15 ++-
 drivers/phy/phy-core.c              | 209 ++++++++++++++++++++++++++----------
 drivers/phy/phy-exynos-dp-video.c   |   2 +-
 drivers/phy/phy-exynos-mipi-video.c |   2 +-
 drivers/phy/phy-omap-usb2.c         |   2 +-
 drivers/phy/phy-twl4030-usb.c       |   4 +-
 include/linux/phy/phy.h             |  86 ++++++++++-----
 7 files changed, 221 insertions(+), 99 deletions(-)

-- 
1.8.5.1
