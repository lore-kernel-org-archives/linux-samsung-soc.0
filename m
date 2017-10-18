From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/2] MAX77843-extcon: add proper OTG and Dock (OTG+MHL)
 support
Date: Wed, 18 Oct 2017 11:56:20 +0200
Message-ID: <20171018095622.23738-1-m.szyprowski@samsung.com>
References: <CGME20171018095630eucas1p1dd88e65e6519a22c6d685ae77f2c41f5@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36208 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933038AbdJRJ4e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 05:56:34 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi!

This patchset enables proper detection and support for the following
micro USB accessories: standard OTG cable (passive) and so called
SmartDock (a Dock with OTG and MHL features).

Tested on Exynos5433 TM2 board.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v2:
- fixed typo in subject (max88743 to max77843)
- added Chanwoo acks

v1:
- initial version

Marek Szyprowski (2):
  extcon: max88743: Add OTG power control to the MUIC driver
  extcon: max88743: Add support for SmartDock accessory

 drivers/extcon/extcon-max77843.c     | 93 ++++++++++++++++++++++++++++++------
 include/linux/mfd/max77843-private.h |  5 ++
 2 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.14.2
