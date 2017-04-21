From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: Add Odroid sound DT bindings
	documentation" to the asoc tree
Date: Fri, 21 Apr 2017 18:28:18 +0100
Message-ID: <E1d1cLy-0001qc-PC@debutante>
References: <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, javier@osg.samsung.com, broonie@kernel.org, krzk@kernel.org, robh+dt@kernel.org, cw00.choi@samsung.com, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: Add Odroid sound DT bindings documentation

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 92c9f05ebc7290e638c7b1b85288918c4fc65d4e Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 21 Apr 2017 19:19:49 +0200
Subject: [PATCH] ASoC: Add Odroid sound DT bindings documentation

This patch adds DT binding documentation for Odroid XU3/4
sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/samsung,odroid.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
new file mode 100644
index 000000000000..c1ac70cb0afb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -0,0 +1,57 @@
+Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
+
+Required properties:
+
+ - compatible - "samsung,odroidxu3-audio" - for Odroid XU3 board,
+		"samsung,odroidxu4-audio" - for Odroid XU4 board
+ - model - the user-visible name of this sound complex
+ - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
+    controller
+ - 'codec' subnode with a 'sound-dai' property containing list of phandles
+    to the CODEC nodes, first entry must be corresponding to the MAX98090
+    CODEC and the second entry must be the phandle of the HDMI IP block node
+ - clocks - should contain entries matching clock names in the clock-names
+    property
+ - clock-names - should contain following entries:
+    - "epll" - indicating the EPLL output clock
+    - "i2s_rclk" - indicating the RCLK (root) clock of the I2S0 controller
+ - samsung,audio-widgets - this property specifies off-codec audio elements
+   like headphones or speakers, for details see widgets.txt
+ - samsung,audio-routing - a list of the connections between audio
+   components;  each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source;
+   valid names for sources and sinks are the MAX98090's pins (as
+   documented in its binding), and the jacks on the board
+
+   For Odroid X2:
+     "Headphone Jack", "Mic Jack", "DMIC"
+
+   For Odroid U3, XU3:
+     "Headphone Jack", "Speakers"
+
+   For Odroid XU4:
+     no entries
+
+Example:
+
+sound {
+	compatible = "samsung,odroidxu3-audio";
+	samsung,cpu-dai = <&i2s0>;
+	samsung,codec-dai = <&max98090>;
+	model = "Odroid-XU3";
+	samsung,audio-routing =
+		"Headphone Jack", "HPL",
+		"Headphone Jack", "HPR",
+		"IN1", "Mic Jack",
+		"Mic Jack", "MICBIAS";
+
+	clocks = <&clock CLK_FOUT_EPLL>, <&i2s0 CLK_I2S_RCLK_SRC>;
+	clock-names = "epll", "sclk_i2s";
+
+	cpu {
+		sound-dai = <&i2s0 0>;
+	};
+	codec {
+		sound-dai = <&hdmi>, <&max98090>;
+	};
+};
-- 
2.11.0
