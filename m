From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] MAX88743-extcon: add proper OTG and Dock (OTG+MHL)
 support
Date: Wed, 18 Oct 2017 11:28:00 +0200
Message-ID: <20171018092802.25390-1-m.szyprowski@samsung.com>
References: <CGME20171018092807eucas1p1a48ca03af94e7439c69ba5ffc43b5f31@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi!

This patchset enables proper detection and support for the following
micro USB accessories: standard OTG cable (passive) and so called
SmartDock (a Dock with OTG and MHL features).

Tested on Exynos5433 TM2 board.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (2):
  extcon: max88743: Add OTG power control to the MUIC driver
  extcon: max88743: Add support for SmartDock accessory

 drivers/extcon/extcon-max77843.c     | 93 ++++++++++++++++++++++++++++++------
 include/linux/mfd/max77843-private.h |  5 ++
 2 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.14.2
