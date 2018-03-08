From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: Use proper DT compatible string for
	Hardkernel Odroid boards" to the asoc tree
Date: Thu, 08 Mar 2018 17:22:10 +0000
Message-ID: <E1etzF4-0007V1-IR@debutante>
References: <20180307174625.16597-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180307174625.16597-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: Use proper DT compatible string for Hardkernel Odroid boards

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From d9e575127b4169061d94c9982c4f0e8aae208c78 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 7 Mar 2018 18:46:25 +0100
Subject: [PATCH] ASoC: Use proper DT compatible string for Hardkernel Odroid
 boards

The Odroid boards are manufactured by Hardkernel, not Samsung. New compatible
string entries are added, with "hardkernel," instead of "samsung," vendor
prefix. Support for the old compatible strings is going to be removed after
some time.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/samsung,odroid.txt | 6 +++---
 sound/soc/samsung/odroid.c                                 | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
index 625b1b18fd02..f35a2694eb04 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -2,8 +2,8 @@ Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
 
 Required properties:
 
- - compatible - "samsung,odroidxu3-audio" - for Odroid XU3 board,
-		"samsung,odroidxu4-audio" - for Odroid XU4 board
+ - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
+		"hardkernel,odroid-xu4-audio" - for Odroid XU4 board
  - model - the user-visible name of this sound complex
  - clocks - should contain entries matching clock names in the clock-names
     property
@@ -35,7 +35,7 @@ Required sub-nodes:
 Example:
 
 sound {
-	compatible = "samsung,odroidxu3-audio";
+	compatible = "hardkernel,odroid-xu3-audio";
 	model = "Odroid-XU3";
 	samsung,audio-routing =
 		"Headphone Jack", "HPL",
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 44b6de5a331a..92d750806d1d 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -213,8 +213,10 @@ static int odroid_audio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id odroid_audio_of_match[] = {
+	{ .compatible	= "hardkernel,odroid-xu3-audio" },
+	{ .compatible	= "hardkernel,odroid-xu4-audio" },
 	{ .compatible	= "samsung,odroid-xu3-audio" },
-	{ .compatible	= "samsung,odroid-xu4-audio"},
+	{ .compatible	= "samsung,odroid-xu4-audio" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, odroid_audio_of_match);
-- 
2.16.2
