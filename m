From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/6] ARM: s3c24xx: Improve a size determination in
 s3c2410_iotiming_get()
Date: Mon, 2 Oct 2017 19:59:19 +0200
Message-ID: <3cccfa2f-4bcd-9c45-c56c-2b71b2ae4a42@users.sourceforge.net>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:55776 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751268AbdJBR7x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 13:59:53 -0400
In-Reply-To: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:16:58 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index f587c78fba33..c18769b5f15a 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -453,7 +453,7 @@ int s3c2410_iotiming_get(struct s3c_cpufreq_config *cfg,
 		s3c_freq_iodbg("%s: bank %d: con %08lx\n",
 			       __func__, bank, bankcon);
 
-		bt = kzalloc(sizeof(struct s3c2410_iobank_timing), GFP_KERNEL);
+		bt = kzalloc(sizeof(*bt), GFP_KERNEL);
 		if (!bt)
 			return -ENOMEM;
 
-- 
2.14.2
