From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: [PATCH 03/14] MAINTAINERS: remove arch/arm/plat-s3c24xx/
Date: Sat,  2 Mar 2013 22:53:41 -0300
Message-ID: <1362275632-20242-4-git-send-email-cesarb@cesarb.net>
References: <1362275632-20242-1-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1362275632-20242-1-git-send-email-cesarb@cesarb.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Cesar Eduardo Barros <cesarb@cesarb.net>
List-Id: linux-samsung-soc@vger.kernel.org

This directory was removed by commit 09ec1d7 (ARM: S3C24XX: Remove
plat-s3c24xx directory in arch/arm/).

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c074d5..5af82f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1119,7 +1119,6 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 W:	http://www.fluff.org/ben/linux/
 S:	Maintained
 F:	arch/arm/plat-samsung/
-F:	arch/arm/plat-s3c24xx/
 F:	arch/arm/mach-s3c24*/
 F:	arch/arm/mach-s3c64xx/
 F:	drivers/*/*s3c2410*
-- 
1.7.11.7
