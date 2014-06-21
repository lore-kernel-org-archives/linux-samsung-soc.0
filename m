From: Daniel Walter <dwalter@google.com>
Subject: [PATCH 3/9] [arch/arm/mach-s3c24xx] replace strict_strto* with
 kstrto*
Date: Sat, 21 Jun 2014 13:05:00 +0100
Message-ID: <20140621120500.GA6288@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

 Replace obsolete strict_strto call with kstrto

Signed-off-by: Daniel Walter <dwalter@google.com>
---
 arch/arm/mach-s3c24xx/mach-jive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index e81ea82..bac9bb5 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -243,7 +243,7 @@ static int __init jive_mtdset(char *options)
 	if (options == NULL || options[0] == '\0')
 		return 0;
 
-	if (strict_strtoul(options, 10, &set)) {
+	if (kstrtoul(options, 10, &set)) {
 		printk(KERN_ERR "failed to parse mtdset=%s\n", options);
 		return 0;
 	}
-- 
2.0.0.526.g5318336
