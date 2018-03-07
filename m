From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/6] ASoC: Snow Chromebook DT bindings update
Date: Wed, 07 Mar 2018 18:02:49 +0100
Message-ID: <20180307170249.14057-1-s.nawrocki@samsung.com>
References: <CGME20180307170309epcas1p40ae0381dbd69168307cf23f0d993e8b3@epcas1p4.samsung.com>
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

The new DT bindings are introduced so sound on the HDMI interface
is also supported.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/sound/snow.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/snow.txt b/Documentation/devicetree/bindings/sound/snow.txt
index 6df74f15687f..80fd9a87bb3f 100644
--- a/Documentation/devicetree/bindings/sound/snow.txt
+++ b/Documentation/devicetree/bindings/sound/snow.txt
@@ -5,8 +5,17 @@ Required properties:
 			"google,snow-audio-max98090" or
 			"google,snow-audio-max98091" or
 			"google,snow-audio-max98095"
-- samsung,i2s-controller: The phandle of the Samsung I2S controller
-- samsung,audio-codec: The phandle of the audio codec
+- samsung,i2s-controller (deprecated): The phandle of the Samsung I2S controller
+- samsung,audio-codec (deprecated): The phandle of the audio codec
+
+Required sub-nodes:
+
+ - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
+    controller
+ - 'codec' subnode with a 'sound-dai' property containing list of phandles
+    to the CODEC nodes, first entry must be the phandle of the MAX98090,
+    MAX98091 or MAX98095 CODEC (exact device type is indicated by the compatible
+    string) and the second entry must be the phandle of the HDMI IP block node
 
 Optional:
 - samsung,model: The name of the sound-card
-- 
2.14.2
