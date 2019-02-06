From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [BUG BISECT] NULL pointer after commit "ASoC:
 dapm: Only power up active channels from a DAI"
Date: Wed, 6 Feb 2019 11:03:10 +0000
Message-ID: <20190206110310.GQ3837@imbe.wolfsonmicro.main>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
 <20190205211622.GA5891@kozik-lap>
 <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
 <5f4f2221-f11f-98c8-fadc-e713f4623246@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <5f4f2221-f11f-98c8-fadc-e713f4623246@samsung.com>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 06, 2019 at 11:11:03AM +0100, Sylwester Nawrocki wrote:
> On 2/6/19 10:46, Sylwester Nawrocki wrote:
> > On 2/5/19 22:16, Krzysztof Kozlowski wrote:
> >> Bisect pointed to commit:
> >>     commit 078a85f2806f0ffd11289009462a6a390f9adb5c
> >>     Author: Charles Keepax <ckeepax@opensource.cirrus.com>
> >>     Date:   Thu Jan 31 13:30:18 2019 +0000
> >>         ASoC: dapm: Only power up active channels from a DAI
> >>
> >> as a bad commit for NULL pointer on my Odroid XU3 and Odroid U3 board when
> >> doing "aplay /usr/share/sounds/alsa/Front_Right.wav".
> >>
> >> 1. Arch ARM Linux
> >> 2. exynos_defconfig
> >> 3. Odroid U3, XU3, Exynos SoC, ARMv7
> >>
> >> Last address is in calltrace:
> >> c079552c
> >> dapm_update_dai_unlocked
> >> sound/soc/soc-dapm.c:2586
> > 
> > Thanks for bisecting this, I ran into same issue last night and I'm starting
> > to debug this now. I have added some debug prints and it looks like it oopses
> > on NULL playback_widget of the dummy DAI.
> > 
> > [   30.701182] hdmi-audio-codec hdmi-audio-codec.0.auto: Update DAI routes for i2s-hifi playback
> > [   30.709630] dapm_update_dai_unlocked:2586 w=8bd27d28
> > [   30.714403] dapm_update_dai_unlocked:2594 w=8bd27d28
> > [   30.724688] max98090 5-0010: Update DAI routes for HiFi playback
> > [   30.730163] dapm_update_dai_unlocked:2586 w=3fc942af
> > [   30.735154] dapm_update_dai_unlocked:2594 w=3fc942af
> > [   30.745051] snd-soc-dummy snd-soc-dummy: Update DAI routes for snd-soc-dummy-dai playback
> > [   30.753128] dapm_update_dai_unlocked:2586 w=  (null)
> > [   30.758114] Unable to handle kernel NULL pointer dereference at virtual address 0000007c
> 
> With a change as below there is no oops and everything works again,
> but I'm not sure this is a proper fix.
> 

I think this is the proper fix, if we have DAIs which don't have
capture/playback widgets then there should be no parts of the
DAPM graph that need updated in relation to the number of
channels, so skipping the processing seems fine.

Thanks,
Charles

> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 5b74dffc9c11..111a23a9708a 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2580,6 +2580,9 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
>         else
>                 w = dai->capture_widget;
>  
> +       if (!w)
> +               return 0;
> +
>         dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name,
>                 dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
> 
> -- 
> Thanks,
> Sylwester
