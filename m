From: y@samsung.com
Subject: [PATCH v2] drivers: i2c: silence a compile warning in i2c-s3c2410.c
Date: Wed, 15 Jan 2014 10:42:42 +0900
Message-ID: <1389750162-5765-1-git-send-email-y@samsung.com>
References: <20140114190910.GE10340@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140114190910.GE10340@katana>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

=46rom: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

If used 64 bit compiler GCC warns that:

drivers/i2c/busses/i2c-s3c2410.c: In function =E2=80=98s3c24xx_get_devi=
ce_quirks=E2=80=99:
drivers/i2c/busses/i2c-s3c2410.c:168:10: warning: cast from pointer to =
integer
of different size [-Wpointer-to-int-cast]

This patch fixes this by converting "unsigned int" to "kernel_ulong_t".

CC: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
CC: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
CC: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Changes since v1:
    - using "kernel_ulong_t" instead of "unsigned long" for consistency=
=2E
    - take care of formatting issues as pointed by Wolfram Sang.

 drivers/i2c/busses/i2c-s3c2410.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-=
s3c2410.c
index bf8fb94..168de17 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -101,7 +101,7 @@ enum s3c24xx_i2c_state {
=20
 struct s3c24xx_i2c {
 	wait_queue_head_t	wait;
-	unsigned int            quirks;
+	kernel_ulong_t		quirks;
 	unsigned int		suspended:1;
=20
 	struct i2c_msg		*msg;
@@ -160,12 +160,12 @@ MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
  * Get controller type either from device tree or platform device vari=
ant.
 */
=20
-static inline unsigned int s3c24xx_get_device_quirks(struct platform_d=
evice *pdev)
+static inline kernel_ulong_t s3c24xx_get_device_quirks(struct platform=
_device *pdev)
 {
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match =3D of_match_node(s3c24xx_i2c_match, pdev->dev.of_node);
-		return (unsigned int)match->data;
+		return (kernel_ulong_t)match->data;
 	}
=20
 	return platform_get_device_id(pdev)->driver_data;
--=20
1.7.10.4
