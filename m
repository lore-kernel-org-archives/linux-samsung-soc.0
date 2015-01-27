From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 00/16] ASoC: samsung: Add clk provider for I2S internal
 clocks
Date: Tue, 27 Jan 2015 11:59:41 +0100
Message-ID: <54C76F9D.7040805@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <54C2FB25.4030501@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54C2FB25.4030501-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Jakobi <liquid.acid-hi6Y0CQ0nG0@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Tobias,

On 24/01/15 02:53, Tobias Jakobi wrote:
> Hello,
> 
> I've tested the series on my X2 and so far I haven't encountered any
> obvious issues with it.
> 
> I have a small question though. With the move to simple-audio-card the
> old driver (selected by SND_SOC_ODROIDX2) is probably going away after
> some time.
> Currently SND_SOC_ODROIDX2 also selects SND_SOC_MAX98090 and
> SND_SAMSUNG_I2S, which I believe (correct me if I'm wrong) are necessary
> to use the sound subsystem even with simple-audio-card (since the
> max98090 codec has to be built at least). I've found no way of selecting
> these two manually, so at the moment I need both CONFIG_SND_SIMPLE_CARD
> and SND_SOC_ODROIDX2 enabled to use sound. Is this intended behaviour?

Thanks for the feedback.  It seems I finally forgot to update Kconfig,
presumably we should make SND_SOC_ODROIDX2 selecting SND_SIMPLE_CARD,
i.e.

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 58c797a..7fb728c 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -247,6 +247,7 @@ config SND_SOC_ODROIDX2
        depends on SND_SOC_SAMSUNG
        select SND_SOC_MAX98090
        select SND_SAMSUNG_I2S
+       select SND_SIMPLE_CARD
        help
          Say Y here to enable audio support for the Odroidx2.

Making SND_SOC_SAMSUNG selecting SND_SIMPLE_CARD is probably not a good
idea and still we would be missing the codec part.
I'm going to post a patch as above.

> And while I'm at it. I'm booting the board with an upstream u-boot
> version which sets the MPLL to 800MHz, which AFAIK is the clocking rate
> that makes less 'trouble' (but at the expense of performance).
> I was wondering if anyone can comment on whether the recent rework has
> any influence on the behaviour when booting with the vendor u-boot
> (which sets the MPLL to 880MHz). IIRC then clock rounding issues arose
> there.
> 
> It would be interesting to know if this series gets us closer to drive
> the MPLL with the recommended (?) higher clocking rate.

No, (unfortunately) this series has nothing to do with MPLL.  The whole
clock tree for sound is configured by the kernel, including the EPLL, which
provides reference clock for the audio subsystem.  MPLL and EPLL are normally
used in different clock domains.  So there should be no any clock rounding
issues related to bootloader as far as audio is concerned.  Please let me
know if you find any related problems.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
