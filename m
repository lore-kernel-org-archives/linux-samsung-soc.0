From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/7] ASoC: max98095: Add #sound-dai-cells
 property documentation
Date: Fri, 09 Mar 2018 18:48:53 +0100
Message-ID: <20180309174858.24017-2-s.nawrocki@samsung.com>
References: <20180309174858.24017-1-s.nawrocki@samsung.com>
 <CGME20180309174958epcas2p474ad581313e36a458192b2f60760c549@epcas2p4.samsung.com>
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

MAX98095 CODEC supports 3 input DAIs, adding the #sound-dai-cells property
allows to reference selected DAI in DT.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
 - none.
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
