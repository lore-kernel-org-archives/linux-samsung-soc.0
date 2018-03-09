From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/7] ASoC: max98090: Add #sound-dai-cells
 property documentation
Date: Fri, 09 Mar 2018 18:48:52 +0100
Message-ID: <20180309174858.24017-1-s.nawrocki@samsung.com>
References: <CGME20180309174916epcas2p4e147dc398038a938b130549f47fe2b85@epcas2p4.samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, javierm@redhat.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

MAX98090 CODEC supports 1 input DAI, adding the #sound-dai-cells property
helps to reference the DAI in DT in a standard way.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - new patch.

 Documentation/devicetree/bindings/sound/max98090.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
index 4e3be6682c98..7e1bbd5c27fd 100644
--- a/Documentation/devicetree/bindings/sound/max98090.txt
+++ b/Documentation/devicetree/bindings/sound/max98090.txt
@@ -16,6 +16,8 @@ Optional properties:

 - clock-names: Should be "mclk"

+- #sound-dai-cells : should be 0.
+
 - maxim,dmic-freq: Frequency at which to clock DMIC

 - maxim,micbias: Micbias voltage applies to the analog mic, valid voltages value are:
--
2.14.2
