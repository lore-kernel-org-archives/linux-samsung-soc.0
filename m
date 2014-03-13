From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH V2 RE-SEND 7/7] MAINTAINERS: add maintainer for Samsung sxgbe
 driver
Date: Thu, 13 Mar 2014 15:56:21 +0900
Message-ID: <008001cf3e89$576767f0$063637d0$%an@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44235 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbaCMG4W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 02:56:22 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davem@davemloft.net, ilho215.lee@samsung.com


Signed-off-by: Byungho An <bh74.an@samsung.com>
---
 MAINTAINERS |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2cf5cf..344702c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7497,6 +7497,15 @@ S:	Supported
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 F:	drivers/clk/samsung/
 
+SAMSUNG SXGBE DRIVERS
+M:	Byungho An <bh74.an@samsung.com>
+M:	Girish K S <ks.giri@samsung.com>
+M:	Siva Reddy Kallam <siva.kallam@samsung.com>
+M:	Vipul Pandya <vipul.pandya@samsung.com>
+S:	Supported
+L:	netdev@vger.kernel.org
+F:	drivers/net/ethernet/samsung/
+
 SERIAL DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-serial@vger.kernel.org
-- 
1.7.10.4
