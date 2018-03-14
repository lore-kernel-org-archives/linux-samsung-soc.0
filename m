From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/5] ASoC: samsung: Document compatible strings
 for Odroid X/X2, Odroid XU3
Date: Wed, 14 Mar 2018 17:42:41 +0100
Message-ID: <20180314164242.22927-1-s.nawrocki@samsung.com>
References: <CGME20180314164301epcas1p105f42730914735774284892b71839572@epcas1p1.samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

There are no significant differences across Odroid X, Odroid-X2, Odroid-U3
and Odroid-XU3 with regards to the audio subsystem so add more entries
to the compatible strings list.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/sound/samsung,odroid.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
index f35a2694eb04..a50a0c6a354b 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -1,8 +1,10 @@
-Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
+Hardkernel Odroid X/X2/U3/XU3/XU4 audio complex with MAX98090 codec
 
 Required properties:
 
- - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
+ - compatible - "hardkernel,odroid-u3-audio" - for Odroid U3 board,
+		"hardkernel,odroid-x-audio" - for Odroid X, Odroid X2 boards,
+		"hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
 		"hardkernel,odroid-xu4-audio" - for Odroid XU4 board
  - model - the user-visible name of this sound complex
  - clocks - should contain entries matching clock names in the clock-names
-- 
2.14.2
