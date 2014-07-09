From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: samsung: Add machine driver for
 Odroid X2/U3
Date: Wed, 09 Jul 2014 19:20:05 +0200
Message-ID: <53BD79C5.3060604@samsung.com>
References: <1404479625-25385-1-git-send-email-s.nawrocki@samsung.com>
 <1404479625-25385-2-git-send-email-s.nawrocki@samsung.com>
 <CAD8Lp44JFtbcD22c+0PVb5S4U1kVTTxHD=PgqiKzhVypFW5Prg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21632 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755337AbaGIRUJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 13:20:09 -0400
In-reply-to: <CAD8Lp44JFtbcD22c+0PVb5S4U1kVTTxHD=PgqiKzhVypFW5Prg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chen Zhen <zhen1.chen@samsung.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi,

On 08/07/14 11:15, Daniel Drake wrote:
> On Fri, Jul 4, 2014 at 2:13 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> This patch adds the sound subsystem driver for Odroid-X2 and
>> Odroid-U3 boards. The codec works in I2S master mode; there
>> are two separate audio routing paths defined, as there are
>> differences in the signal routing between the X2 and U3 boards,
>> i.e. U3 uses single jack for headphones and microphone.
>>
>> Signed-off-by: Chen Zhen <zhen1.chen@samsung.com>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Testing on ODROID-U2, v3 is not quite working for me, but v2 of the
> patch was fine.
> I boot up, run:
> # speaker-test -c 2 -t wav
> 
> As soon as I hear the word "front" I press ctrl+c and then run the
> command again.
> Now the command hangs with no audible output.
> 
> Any ideas? Let me know if you have trouble reproducing.

Thanks the feedback, we have also noticed this issue.
It sounds like a bug in the Samsung I2S driver, which sets the
CDCLK pin to input mode in the i2s_shutdown callback and never
restores it. AFAICS this setting should not be lost after a call
to struct soc_snd_dai_ops::shutdown().
I'm going will prepare a proper patch soon, until then you could
try and see if this fixes the problem for you:

---8<---
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d80121e..42c4f3e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -724,10 +724,6 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,

        spin_unlock_irqrestore(&lock, flags);

-       /* Gate CDCLK by default */
-       if (!is_opened(other))
-               i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
-                               0, SND_SOC_CLOCK_IN);
 }
--->8---

--
Thanks,
Sylwester
