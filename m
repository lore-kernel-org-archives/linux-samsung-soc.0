From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH V4 8/8] MAINTAINERS: add maintainer for Samsung sxgbe driver
Date: Mon, 17 Mar 2014 23:47:18 -0700
Message-ID: <00f901cf4275$e8eb3810$bac1a830$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48712 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753401AbaCRGrl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 02:47:41 -0400
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davem@davemloft.net, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, ilho215.lee@samsung.com

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
