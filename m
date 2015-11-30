From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2] arm: dts: Fix audio card detection on peach boards
Date: Mon, 30 Nov 2015 11:01:33 -0300
Message-ID: <565C56BD.2050002@osg.samsung.com>
References: <1444653438-6532-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444653438-6532-1-git-send-email-alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Alim,

On 10/12/2015 09:37 AM, Alim Akhtar wrote:
> Since commit 2fad972d45c4 ("ARM: dts: Add mclk entry for Peach boards"),
> sound card detection is broken on peach boards and gives below errors:
> 
> [    3.630457] max98090 7-0010: MAX98091 REVID=0x51
> [    3.634233] max98090 7-0010: use default 2.8v micbias
> [    3.640985] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
> [    3.645307] max98090 7-0010: Invalid master clock frequency
> [    3.650824] snow-audio sound: ASoC: Peach-Pi-I2S-MAX98091 late_probe() failed: -22
> [    3.658914] snow-audio sound: snd_soc_register_card failed (-22)
> [    3.664366] snow-audio: probe of sound failed with error -22
> 
> This patch adds missing assigned-clocks and assigned-clock-parents for
> pmu_system_controller node which is used as "mclk" for audio codec.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Fixes: 2fad972d45c4 ("ARM: dts: Add mclk entry for Peach boards")

I found that this patch is not enough to have proper audio working
on an Exynos5800 Peach Pi. Even playing a simple wav does not work:

$ time aplay -D sysdefault /usr/share/sounds/alsa/Front_Center.wav 
Playing WAVE '/usr/share/sounds/alsa/Front_Center.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono

real	0m1.138s
user	0m0.005s
sys	0m0.005s

This should be ~1.5 seconds so audio is processed faster than expected.

So something else besides making the CLKOUT to provide a valid frequency
for the codec's master clock is needed.

Do you know what's missing in mainline? For instance, I see that the
sound/soc/samsung/snow.c ASoC machine driver doesn't have a hw_params
but I'm not that familiar with ALSA to know if that makes sense or not.

Also, do you know if the "simple-audio-card" can be used instead for
snow and peachs as it is used for other Exynos5 boards or a specific
ASoC machine driver is really needed for these Chromebooks?

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
