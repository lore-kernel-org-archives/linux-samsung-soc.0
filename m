From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 6/7] ASoC: samsung: Drop uneeded RCLKSRC
 setting in the Snow driver
Date: Fri, 09 Mar 2018 18:48:57 +0100
Message-ID: <20180309174858.24017-6-s.nawrocki@samsung.com>
References: <20180309174858.24017-1-s.nawrocki@samsung.com>
 <CGME20180309175015epcas1p2ef43a122b650a7a420320ca619124dc6@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180309174858.24017-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, javierm@redhat.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The RCLKSRC mux input 0 is a default configuration after reset, so
there is no need for this explicit snd_soc_dai_set_sysclk() call.
Also, this static mux clock configuration can be specified in DT.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none.
---
 sound/soc/samsung/snow.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index d8ac907bbb0d..fc62110f500f 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -50,11 +50,6 @@ static int snow_late_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		return ret;
 
-	/* Select I2S Bus clock to set RCLK and BCLK */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
-					0, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		return ret;
 
 	return 0;
 }
-- 
2.14.2
