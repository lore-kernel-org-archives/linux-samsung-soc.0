From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 00/10] more dwc2/gadget fixes
Date: Mon, 20 Oct 2014 12:45:30 +0200
Message-ID: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54314 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753060AbaJTKpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 06:45:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi!

This patchset contains a set of fixes to solve vaious minor issues
related to cable connect/disconnect events, pull-up control,
soft-disconnect mode, proper usb phy operation and restoring gadget
state after suspend/resume cycle.

Changes since v1 (http://www.spinics.net/lists/linux-samsung-soc/msg37842.html):
- fixed issues spotted by Felipe Balbi

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland

Marek Szyprowski (10):
  usb: dwc2/gadget: report disconnect event from 'end session' irq
  usb: dwc2/gadget: fix enumeration issues
  usb: dwc2/gadget: fix gadget unregistration in udc_stop() function
  usb: dwc2/gadget: disable phy before turning off power regulators
  usb: dwc2/gadget: move setting last reset time to s3c_hsotg_core_init
  usb: dwc2/gadget: decouple setting soft-disconnect from
    s3c_hsotg_core_init
  usb: dwc2/gadget: move phy control calls out of pullup() method
  usb: dwc2/gadget: use soft-disconnect udc feature in pullup() method
  usb: dwc2/gadget: fix calls to phy control functions in suspend/resume
    code
  usb: dwc2/gadget: rework suspend/resume code to correctly restore
    gadget state

 drivers/usb/dwc2/core.h   |  4 +-
 drivers/usb/dwc2/gadget.c | 95 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 69 insertions(+), 30 deletions(-)

-- 
1.9.2
