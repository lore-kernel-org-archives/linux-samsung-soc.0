From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/1] drivers: i2c: silence a compile warning in i2c-s3c2410.c
Date: Fri, 10 Jan 2014 12:03:45 +0900
Message-ID: <1389323025-4478-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59924 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642AbaAJCtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 21:49:07 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org

If used 64 bit compiler GCC warns that:

drivers/i2c/busses/i2c-s3c2410.c: In function =E2=80=98s3c24xx_get_devi=
ce_quirks=E2=80=99:
drivers/i2c/busses/i2c-s3c2410.c:168:10: warning: cast from pointer to =
integer
of different size [-Wpointer-to-int-cast]

This patch fixes this by converting "unsigned int" to "unsigned long".

CC: Kukjin Kim <kgene.kim@samsung.com>
CC: Wolfram Sang <wsa@the-dreams.de>
CC: linux-i2c@vger.kernel.org
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-=
s3c2410.c
index bf8fb94..447dd98 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -101,7 +101,7 @@ enum s3c24xx_i2c_state {
=20
 struct s3c24xx_i2c {
 	wait_queue_head_t	wait;
-	unsigned int            quirks;
+	unsigned long            quirks;
 	unsigned int		suspended:1;
=20
 	struct i2c_msg		*msg;
@@ -160,12 +160,13 @@ MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
  * Get controller type either from device tree or platform device vari=
ant.
 */
=20
-static inline unsigned int s3c24xx_get_device_quirks(struct platform_d=
evice *pdev)
+static inline unsigned long
+	s3c24xx_get_device_quirks(struct platform_device *pdev)
 {
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match =3D of_match_node(s3c24xx_i2c_match, pdev->dev.of_node);
-		return (unsigned int)match->data;
+		return (unsigned long)match->data;
 	}
=20
 	return platform_get_device_id(pdev)->driver_data;
--=20
1.7.10.4
