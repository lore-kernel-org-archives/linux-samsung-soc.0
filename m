From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/5] ASoC: samsung: odroid: Drop sample rates
 that cannot be supported from hw_params()
Date: Wed, 14 Mar 2018 17:41:14 +0100
Message-ID: <20180314164115.22736-2-s.nawrocki@samsung.com>
References: <20180314164115.22736-1-s.nawrocki@samsung.com>
 <CGME20180314164137epcas2p336d64724b044d14aa920d611b6483593@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180314164115.22736-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The I2S controller can handle sample rates only up to 96000 and the CPU DAI
has already related constraint set so drop the impossible 176400, 192000
switch cases.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e698e67f5f84..e1b59457a327 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -46,14 +46,12 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 		break;
 	case 44100:
 	case 88200:
-	case 176400:
 		pll_freq = 180633609U;
 		rfs = 512;
 		break;
 	case 32000:
 	case 48000:
 	case 96000:
-	case 192000:
 		pll_freq = 196608001U;
 		rfs = 512;
 		break;
-- 
2.14.2
