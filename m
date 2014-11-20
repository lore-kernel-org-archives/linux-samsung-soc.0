From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: Fix IISMOD setting in
 i2s_set_sysclk()
Date: Thu, 20 Nov 2014 11:11:09 +0100
Message-ID: <546DBE3D.90206@samsung.com>
References: <1416420664-20952-1-git-send-email-s.nawrocki@samsung.com>
 <CAAgF-BemHSdcmzkqOUX+JNMLu0-GXs0EGm8YWHt+CBRP8Wa5DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26550 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755904AbaKTKLN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 05:11:13 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFC0064D1RASV10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 10:13:58 +0000 (GMT)
In-reply-to: <CAAgF-BemHSdcmzkqOUX+JNMLu0-GXs0EGm8YWHt+CBRP8Wa5DA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

On 20/11/14 08:04, Padma Venkat wrote:
>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>> > index 947352d..8db8c66 100644
>> > --- a/sound/soc/samsung/i2s.c
>> > +++ b/sound/soc/samsung/i2s.c
>> > @@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>> >  		if (dir == SND_SOC_CLOCK_IN)
>> >  			mod |= 1 << i2s_regs->cdclkcon_off;
>> >  		else
>> > -			mod &= 0 << i2s_regs->cdclkcon_off;
>> > +			mod &= ~(1 << i2s_regs->cdclkcon_off);
>
> Thanks for pointing this. In my local machine it was properly done but
> while rebasing on linux-next I did some mistake. There is one more
> place in set_sysclk which need to be corrected here
> mod &= 0 << i2s_regs->rclksrc_off
> can you include this change also in your patch or should I post a new
> patch for all?

OK, I'll also correct this and resend the patch.

-- 
Regards,
Sylwester
