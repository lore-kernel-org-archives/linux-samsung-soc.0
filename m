From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] ASoC: samsung: Add MODULE_DEVICE_TABLE for Snow
Date: Wed,  5 Nov 2014 17:44:52 +0100
Message-ID: <1415205892-5553-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56822 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754039AbaKEQoZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Nov 2014 11:44:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, open list <linux-kernel@vger.kernel.org>

This enables the snd_soc_snow module to be auto-loaded.

=46ixes: da5993df2374 ("ASoC: samsung: Add sound card driver for Snow b=
oard")
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Tested using patches for Spring, but should apply to Snow/Peach-pi equ=
ally.
 Rebased onto sound.git for-next branch.

 sound/soc/samsung/snow.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 0acf5d0eed53..72118a77dd5b 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -110,6 +110,7 @@ static const struct of_device_id snow_of_match[] =3D=
 {
 	{ .compatible =3D "google,snow-audio-max98095", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, snow_of_match);
=20
 static struct platform_driver snow_driver =3D {
 	.driver =3D {
--=20
2.1.2
