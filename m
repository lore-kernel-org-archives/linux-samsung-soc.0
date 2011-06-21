From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [RFC][PATCH 0/5] USB: DWC OTG: Add dwc_otg driver for S5P6440
 samsung	SoC.
Date: Tue, 21 Jun 2011 11:45:28 +0200
Message-ID: <001701cc2ff7$f468d3c0$dd3a7b40$%szyprowski@samsung.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20278 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756257Ab1FUJpj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 05:45:39 -0400
In-reply-to: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: p.paneri@samsung.com, linux-usb@vger.kernel.org
Cc: kgene.kim@samsung.com, tmarri@apm.com, balbi@ti.com, naushad@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, a.kesavan@samsung.com, linux-arm-kernel@lists.infradead.org

Hello,

On Tuesday, June 21, 2011 9:04 AM p.paneri@samsung.com wrote:

> From: Praveen Paneri <p.paneri@samsung.com>
> 
> These patches modify DWC OTG driver for ARM and add it for ARM based SoCs.
> Currently it has been tested for Samsung's S5P6440. The development is
> still
> under process so these are not the best set of patches. They are just for
> review
> and not for merge. Intent of these patches is to show required
> modifications
> to make dwc_otg patches work on ARM.

What are the differences between DWC OTG hardware and OTG hardware found
in s3c64xx/s5pc100/s5pv210 and Exynos4 SoCs series? I've did a brief look
at register definitions and most of them looks same. Can this driver be
merged with s3c-hsotg.c driver?

> Following features are tested for basic functions on SMDK6440
> board after modifications:
> OTG HOST: HID and mass-storage
> OTG DEVICE: mass-storage and adb

Does it mean that HID or mass-storage (both host or gadget drivers) needs
modifications to get them working with this DWC OTG driver?

(snipped)

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
