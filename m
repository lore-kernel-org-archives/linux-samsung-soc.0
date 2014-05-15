From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: =?UTF-8?q?=5BPATCH=5D=20Fix=20for=20possible=20null=20pointer=20dereference=20in=20dma=2Ec?=
Date: Thu, 15 May 2014 23:57:56 +0200
Message-ID: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

There is otherwise a risk of a possible null pointer dereference.

Was largely found by using a static code analysis program called cppche=
ck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital=
=2Ese>
---
 sound/soc/samsung/dma.c |   10 ++++++----
 1 fil =C3=A4ndrad, 6 till=C3=A4gg(+), 4 borttagningar(-)

diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index dc09b71..b1f6757 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -115,17 +115,19 @@ static void dma_enqueue(struct snd_pcm_substream =
*substream)
 static void audio_buffdone(void *data)
 {
 	struct snd_pcm_substream *substream =3D data;
-	struct runtime_data *prtd =3D substream->runtime->private_data;
+	struct runtime_data *prtd =3D NULL;
=20
 	pr_debug("Entered %s\n", __func__);
=20
-	if (prtd->state & ST_RUNNING) {
+	if(substream)
+		prtd =3D substream->runtime->private_data;
+
+	if (prtd && prtd->state & ST_RUNNING) {
 		prtd->dma_pos +=3D prtd->dma_period;
 		if (prtd->dma_pos >=3D prtd->dma_end)
 			prtd->dma_pos =3D prtd->dma_start;
=20
-		if (substream)
-			snd_pcm_period_elapsed(substream);
+		snd_pcm_period_elapsed(substream);
=20
 		spin_lock(&prtd->lock);
 		if (!samsung_dma_has_circular()) {
--=20
1.7.10.4
