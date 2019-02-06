From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [BUG BISECT] NULL pointer after commit "ASoC:
 dapm: Only power up active channels from a DAI"
Date: Wed, 6 Feb 2019 09:58:22 +0000
Message-ID: <20190206095822.GN3837@imbe.wolfsonmicro.main>
References: <20190205211622.GA5891@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20190205211622.GA5891@kozik-lap>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 05, 2019 at 10:16:22PM +0100, Krzysztof Kozlowski wrote:
> Bisect pointed to commit:
>     commit 078a85f2806f0ffd11289009462a6a390f9adb5c
>     Author: Charles Keepax <ckeepax@opensource.cirrus.com>
>     Date:   Thu Jan 31 13:30:18 2019 +0000
>         ASoC: dapm: Only power up active channels from a DAI
> 
> as a bad commit for NULL pointer on my Odroid XU3 and Odroid U3 board when
> doing "aplay /usr/share/sounds/alsa/Front_Right.wav".
> 
> 1. Arch ARM Linux
> 2. exynos_defconfig
> 3. Odroid U3, XU3, Exynos SoC, ARMv7
> 
> Last address is in calltrace:
> c079552c
> dapm_update_dai_unlocked
> sound/soc/soc-dapm.c:2586
> 

Apologies for this one, is a little strange. I am assuming either
we end up with a NULL widget or more likely given the line
number a NULL path/widget on the path. Having some difficulty seeing
how we get into that state though.

Could you confirm what machine driver/DT is being used here? I am
assuming this is arch/arm/boot/dts/exynos4412-odroidu3.dts and
sound/soc/samsung/odroid.c. So will investigate those see if I
can find anything.

And could you try this diff and send through the output:

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 482ddb825fb59..9ee44b0192874 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2570,16 +2570,37 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
        else
                w = dai->capture_widget;

+ if (!w) {
+         pr_err("CK -- NULL widget on %s\n", dai->name);
+         return 0;
+ }
+
        dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name,
                dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");

        snd_soc_dapm_widget_for_each_sink_path(w, p) {
+         if (!p) {
+                 pr_err("DEBUG -- NULL sink path on %s\n", w->name);
+                 continue;
+         }
+         if (!p->sink) {
+                 pr_err("DEBUG -- NULL wink widget on %s\n", w->name);
+                 continue;
+         }
                ret = dapm_update_dai_chan(p, p->sink, channels);
                if (ret < 0)
                        return ret;
        }

        snd_soc_dapm_widget_for_each_source_path(w, p) {
+         if (!p) {
+                 pr_err("DEBUG -- NULL source path on %s\n", w->name);
+                 continue;
+         }
+         if (!p->source) {
+                 pr_err("DEBUG -- NULL source widget on %s\n", w->name);
+                 continue;
+         }
                ret = dapm_update_dai_chan(p, p->source, channels);
                if (ret < 0)
                        return ret;

Thanks,
Charles
