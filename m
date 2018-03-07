From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/6] ASoC: max98095: Add #sound-dai-cells
 property documentation
Date: Wed, 07 Mar 2018 18:02:03 +0100
Message-ID: <20180307170203.13998-1-s.nawrocki@samsung.com>
References: <CGME20180307170216epcas1p353aa2716b06b350231332681fff0c92c@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

MAX98095 CODEC supports 3 input DAIs, adding the #sound-dai-cells property
allows to reference selected DAI in DT.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/sound/max98095.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max98095.txt b/Documentation/devicetree/bindings/sound/max98095.txt
index 318a4c82f17f..944efa06487b 100644
--- a/Documentation/devicetree/bindings/sound/max98095.txt
+++ b/Documentation/devicetree/bindings/sound/max98095.txt
@@ -14,6 +14,9 @@ Optional properties:
 
 - clock-names: Should be "mclk"
 
+- #sound-dai-cells : should be 1.
+
+
 Example:
 
 max98095: codec@11 {
-- 
2.14.2
