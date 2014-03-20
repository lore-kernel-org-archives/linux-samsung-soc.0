From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH V7 7/7] MAINTAINERS: add maintainer for Samsung sxgbe driver
Date: Wed, 19 Mar 2014 19:26:22 -0700
Message-ID: <00ef01cf43e3$c9ea33c0$5dbe9b40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50373 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbaCTC0e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 22:26:34 -0400
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: davem@davemloft.net, 'GIRISH K S' <ks.giri@samsung.com>, 'SIVAREDDY KALLAM' <siva.kallam@samsung.com>, 'Vipul Chandrakant' <vipul.pandya@samsung.com>, 'Ilho Lee' <ilho215.lee@samsung.com>

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
