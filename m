From: p.paneri@samsung.com
Subject: [RFC][PATCH 3/5] ARM: SAMSUNG: Adding IO mapping for OTG PHY.
Date: Tue, 21 Jun 2011 12:33:45 +0530
Message-ID: <1308639827-2121-4-git-send-email-p.paneri@samsung.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14157 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752763Ab1FUG73 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 02:59:29 -0400
In-reply-to: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, tmarri@apm.com, naushad@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com

From: Praveen Paneri <p.paneri@samsung.com>

Adding virtual addresses for OTG PHY.

Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index a5c0095..8dc6f20 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -57,6 +57,11 @@ static struct map_desc s5p64x0_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(S5P64X0_PA_VIC1),
 		.length		= SZ_16K,
 		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
+		.pfn		= __phys_to_pfn(S5P64X0_PA_USB_HSPHY),
+		.length		= SZ_1M,
+		.type		= MT_DEVICE,
 	},
 };
 
-- 
1.7.0.4
