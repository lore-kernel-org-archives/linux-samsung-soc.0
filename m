From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] drm/bridge: ptn3460: Fix I2C ID table to match the reported modalias
Date: Thu, 14 May 2015 16:31:29 +0200
Message-ID: <1431613889-32737-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47038 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbbENObz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 10:31:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>
Cc: David Airlie <airlied@linux.ie>, Ajay Kumar <ajaykumar.rs@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

I2C drivers that support OF, have both an I2C and OF device ID tables
that are used to fill the supported module aliases. But currently the
I2C core only uses the OF table to match a device with a driver and
the aliases information are always reported in the form i2c:<name>.

The client->name is used as the name postfix and when booting with OF
this is obtained with of_modalias_node() which drops the compatible
string vendor prefix.

So for I2C drivers, the I2C and OF device ID tables should be keep in
sync in order to make module auto-loading to work but the I2C device
entries shouldn't have the vendor prefix since that is not reported.

Before this patch:

MODALIAS=i2c:ptn3460

$ modinfo | grep alias
alias:          i2c:nxp,ptn3460
alias:          of:N*T*Cnxp,ptn3460*

After this patch:

MODALIAS=i2c:ptn3460

$ modinfo | grep alias
alias:          i2c:ptn3460
alias:          of:N*T*Cnxp,ptn3460*

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/gpu/drm/bridge/ptn3460.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 9d2f053382e1..2cc15419088d 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -389,7 +389,7 @@ static int ptn3460_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ptn3460_i2c_table[] = {
-	{"nxp,ptn3460", 0},
+	{"ptn3460", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
-- 
2.1.4
