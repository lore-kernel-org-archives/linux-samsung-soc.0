From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn clock gating
Date: Thu, 19 Sep 2019 13:58:35 +0200
Message-ID: <717b3f94-1a24-a407-398f-6a476cf7ff69@samsung.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
 <20190918104634.15216-5-s.nawrocki@samsung.com>
 <20190918143157.GH10204@ediswmail.ad.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190918143157.GH10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 9/18/19 16:31, Charles Keepax wrote:
>> @@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
>>  
>>  			active_dereference(component);
>>  		}
>> +		if (mclk)
>> +			clk_disable_unprepare(mclk);
>
> I don't think this works in the case of changing active FLLs.
> The driver looks like it allows changing the FLL configuration
> whilst the FLL is already active in which case it you would have
> two wm8994_set_fll calls enabling the FLL but only a single one
> disabling it. Resulting in the FLL being off but the MCLK being
> left enabled.

Indeed I missed this scenario, or rather assumed it won't be used.
But since the driver allows reconfiguring active FLLs we should make
sure such use case remains properly supported.

What I came up so far as a fix is reading current FLL refclk source and 
if FLL was enabled with that source disabling refclk, before we change FLL 
configuration to new one.  So we have clk_disable_unprepare(MCLK) more 
closely following FLL enable bit changes.  I have tested it and it seems 
to work - something like below. Do you think it makes sense?

-- 
Regards,
Sylwester

---------8<----------
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index bf02e8908d5a..78a0835a095e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2277,6 +2277,31 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
        snd_soc_component_update_bits(component, WM8994_FLL1_CONTROL_1 + reg_offset,
                            WM8994_FLL1_ENA, 0);
 
+       /* Disable MCLK if needed before we possibly change to new clock parent */
+       if (was_enabled) {
+               reg = snd_soc_component_read32(component, WM8994_FLL1_CONTROL_5
+                                                       + reg_offset);
+               reg = ((reg & WM8994_FLL1_REFCLK_SRC_MASK)
+                       >> WM8994_FLL1_REFCLK_SRC_SHIFT) + 1;
+
+               switch (reg) {
+               case WM8994_FLL_SRC_MCLK1:
+                       mclk = control->mclk[WM8994_MCLK1].clk;
+                       break;
+               case WM8994_FLL_SRC_MCLK2:
+                       mclk = control->mclk[WM8994_MCLK2].clk;
+                       break;
+               default:
+                       mclk = NULL;
+               }
+
+               clk_disable_unprepare(mclk);
+       }
+
        if (wm8994->fll_byp && src == WM8994_FLL_SRC_BCLK &&
            freq_in == freq_out && freq_out) {
                dev_dbg(component->dev, "Bypassing FLL%d\n", id + 1);

@@ -2396,8 +2420,6 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 
                        active_dereference(component);
                }
-               if (mclk)
-                       clk_disable_unprepare(mclk);
        }
 
 out:
---------8<----------
