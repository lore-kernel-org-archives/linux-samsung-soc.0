From: p.paneri@samsung.com
Subject: [RFC][PATCH 0/5] USB: DWC OTG: Add dwc_otg driver for S5P6440 samsung
 SoC.
Date: Tue, 21 Jun 2011 12:33:42 +0530
Message-ID: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58781 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266Ab1FUG7Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 02:59:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, tmarri@apm.com, naushad@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com

From: Praveen Paneri <p.paneri@samsung.com>

These patches modify DWC OTG driver for ARM and add it for ARM based SoCs.
Currently it has been tested for Samsung's S5P6440. The development is still 
under process so these are not the best set of patches. They are just for review
and not for merge. Intent of these patches is to show required modifications
to make dwc_otg patches work on ARM.

Following features are tested for basic functions on SMDK6440
board after modifications:
OTG HOST: HID and mass-storage
OTG DEVICE: mass-storage and adb

This patch series is based on below dwc_otg patches
	http://patchwork.ozlabs.org/patch/89560/

To: Tirumala Marri, Felipe Balbi
[PATCH 1/5] USB: DWC OTG: Modification in DWC OTG driver for ARM based SoCs

To: Kukjin Kim
[PATCH 2/5] ARM: SAMSUNG: Changing the build condition of OTG platform device for samsung
[PATCH 3/5] ARM: SAMSUNG: Adding IO mapping for OTG
[PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
[PATCH 5/5] ARM: S5P64x0: Adding OTG device and initialization code for smdk6440
