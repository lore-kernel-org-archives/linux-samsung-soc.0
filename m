From: Richard Weinberger <richard@nod.at>
Subject: [PATCH 25/28] Remove MACH_SMDKV310
Date: Sun,  9 Feb 2014 19:48:03 +0100
Message-ID: <1391971686-9517-26-git-send-email-richard@nod.at>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391971686-9517-1-git-send-email-richard@nod.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG ARM A..." <linux-samsung-soc@vger.kernel.org>, "moderated list:SAMSUNG AUDIO AS...,
 linux-kernel@vger.kernel.org open list" <alsa-devel@alsa-project.org>
Cc: Richard Weinberger <richard@nod.at>
List-Id: linux-samsung-soc@vger.kernel.org

The symbol is an orphan, get rid of it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 sound/soc/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 7ea576c..33fd372 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -145,7 +145,7 @@ config SND_SOC_SAMSUNG_RX1950_UDA1380
 
 config SND_SOC_SAMSUNG_SMDK_WM9713
 	tristate "SoC AC97 Audio support for SMDK with WM9713"
-	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110 || MACH_SMDKV310)
+	depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110)
 	select SND_SOC_WM9713
 	select SND_SAMSUNG_AC97
 	help
-- 
1.8.4.2
