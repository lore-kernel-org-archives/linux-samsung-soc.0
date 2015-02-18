From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/6] ASoC: max98088: Add DT bindings
Date: Wed, 18 Feb 2015 19:25:55 +0100
Message-ID: <1424283959-16289-3-git-send-email-afaerber@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424283959-16289-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Lars-Peter Clausen <lars@metafoo.de>, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: linux-samsung-soc@vger.kernel.org

"maxim,max98089" will be used for the Spring Chromebook.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 sound/soc/codecs/max98088.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 805b3f8cd39d..69a21d1946e3 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -2009,10 +2009,18 @@ static const struct i2c_device_id max98088_i2c_=
id[] =3D {
 };
 MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
=20
+static const struct of_device_id max98088_of_match[] =3D {
+	{ .compatible =3D "maxim,max98088" },
+	{ .compatible =3D "maxim,max98089" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max98088_of_match);
+
 static struct i2c_driver max98088_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "max98088",
 		.owner =3D THIS_MODULE,
+		.of_match_table =3D of_match_ptr(max98088_of_match),
 	},
 	.probe  =3D max98088_i2c_probe,
 	.remove =3D max98088_i2c_remove,
--=20
2.1.4
