From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/9] more dwc2/gadget fixes
Date: Thu, 16 Oct 2014 14:57:56 +0200
Message-ID: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21232 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbaJPM62 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 08:58:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi!

This patchset contains a set of fixes to solve vaious minor issues
related to cable connect/disconnect events, pull-up control,
soft-disconnect mode, proper usb phy operation and restoring gadget
state after suspend/resume cycle.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland

Marek Szyprowski (9):
  usb: dwc2/gadget: report disconnect event from 'end session' irq
  usb: dwc2/gadget: fix enumeration issues
  usb: dwc2/gadget: fix support for soft_connect udc framework feature
  usb: dwc2/gadget: disable phy before turning off power regulators
  usb: dwc2/gadget: move setting last reset time to s3c_hsotg_core_init
  usb: dwc2/gadget: decouple setting soft disconnect from
    s3c_hsotg_core_init
  usb: dwc2/gadget: use soft disconnect mode for implementing pullup
    control
  usb: dwc2/gadget: fix calls to phy control functions in suspend/resume
    code
  usb: dwc2/gadget: rework suspend/resume code to correctly restore
    gadget state

 drivers/usb/dwc2/core.h   |  4 +-
 drivers/usb/dwc2/gadget.c | 93 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 69 insertions(+), 28 deletions(-)

-- 
1.9.2
