From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 21/21] MAINTAINERS: add ARM/S5PC100 and ARM/S5PC110
	architectures
Date: Thu, 14 Jan 2010 12:29:39 +0100
Message-ID: <1263468579-5732-22-git-send-email-m.szyprowski@samsung.com>
References: <1263468579-5732-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1263468579-5732-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Kyungmin Park <kyungmin.park@samsung.com>

Add entries for the ARM S5PC100 and ARM S5PC110 architectures that are
currently being maintained by ourself.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 MAINTAINERS |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c8f47bf..d5fe79c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -936,6 +936,22 @@ W:	http://www.fluff.org/ben/linux/
 S:	Maintained
 F:	arch/arm/mach-s3c6410/
 
+ARM/S5PC100 ARM ARCHITECTURE
+M:	Kyungmin Park <kyungmin.park@samsung.com>
+M:	Marek Szyprowski <m.szyprowski@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-s5pc100/
+
+ARM/S5PC110 ARM ARCHITECTURE
+M:	Kyungmin Park <kyungmin.park@samsung.com>
+M:	Marek Szyprowski <m.szyprowski@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-s5pc110/
+
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.6.4
