From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/6] ARM: s3c24xx: Delete an error message for a failed memory
 allocation in s3c2412_iotiming_get()
Date: Mon, 2 Oct 2017 20:01:28 +0200
Message-ID: <381d4a29-d777-93ee-ed4d-3f41a5ed97cc@users.sourceforge.net>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:53748 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751305AbdJBSB6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 14:01:58 -0400
In-Reply-To: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:37:07 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
index 28b13951de87..f09d5d5ea7ed 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
@@ -243,10 +243,8 @@ int s3c2412_iotiming_get(struct s3c_cpufreq_config *cfg,
 			continue;
 
 		bt = kzalloc(sizeof(struct s3c2412_iobank_timing), GFP_KERNEL);
-		if (!bt) {
-			printk(KERN_ERR "%s: no memory for bank\n", __func__);
+		if (!bt)
 			return -ENOMEM;
-		}
 
 		timings->bank[bank].io_2412 = bt;
 		s3c2412_iotiming_getbank(cfg, bt, bank);
-- 
2.14.2
