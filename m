From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] MAINTAINERS: Add entry for Samsung SoC clock drivers
Date: Sat,  9 Nov 2013 03:17:34 +0100
Message-ID: <1383963454-2749-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Tomasz Figa <t.figa@samsung.com>

This patch adds an entry for Samsung SoC clock drivers located under
drivers/clk/samsung/ directory, with me taking the maintainer role.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Mike Turquette <mturquette@linaro.org>
Acked-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61b8757..df7e1bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7319,6 +7319,12 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/i2c/s5c73m3/*
 
+SAMSUNG SOC CLOCK DRIVERS
+M:	Tomasz Figa <t.figa@samsung.com>
+S:	Supported
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+F:	drivers/clk/samsung/
+
 SERIAL DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-serial@vger.kernel.org
-- 
1.8.4.2
