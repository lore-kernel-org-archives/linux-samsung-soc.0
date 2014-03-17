From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH V3 8/8] MAINTAINERS: add maintainer for Samsung sxgbe driver
Date: Mon, 17 Mar 2014 13:43:45 -0700
Message-ID: <00c101cf4221$97f4f1c0$c7ded540$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Content-language: en-us
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davem@davemloft.net, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, ilho215.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Byungho An <bh74.an@samsung.com>

Signed-off-by: Byungho An <bh74.an@samsung.com>
---
 MAINTAINERS |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b7befe7..aeb81f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7536,6 +7536,15 @@ S:	Supported
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 F:	drivers/clk/samsung/
 
+SAMSUNG SXGBE DRIVERS
+M:	Byungho An <bh74.an@samsung.com>
+M:	Girish K S <ks.giri@samsung.com>
+M:	Siva Reddy Kallam <siva.kallam@samsung.com>
+M:	Vipul Pandya <vipul.pandya@samsung.com>
+S:	Supported
+L:	netdev@vger.kernel.org
+F:	drivers/net/ethernet/samsung/sxgbe/
+
 SERIAL DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-serial@vger.kernel.org
-- 
1.7.10.4
