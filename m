From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 6/6] ARM: s3c2412: Fix a typo in a comment line
Date: Mon, 2 Oct 2017 20:04:40 +0200
Message-ID: <e2567b9e-d556-bac2-a810-ca478f4398bd@users.sourceforge.net>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63473 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751886AbdJBSFI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 14:05:08 -0400
In-Reply-To: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:41:10 +0200

Adjust a word in this function description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
index 01bcd7d5dac7..c5b12f6b02b5 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
@@ -35,7 +35,7 @@
 #define print_ns(x) ((x) / 10), ((x) % 10)
 
 /**
- * s3c2412_print_timing - print timing infromation via printk.
+ * s3c2412_print_timing - print timing information via printk.
  * @pfx: The prefix to print each line with.
  * @iot: The IO timing information
  */
-- 
2.14.2
