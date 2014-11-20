From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: Fix IISMOD setting in i2s_set_sysclk()
Date: Thu, 20 Nov 2014 15:45:26 +0530
Message-ID: <CAAgF-BebN=ro8Pmig1xpchzGULd=KcO+3eVgCku3nky4CimgBg@mail.gmail.com>
References: <1416420664-20952-1-git-send-email-s.nawrocki@samsung.com>
	<CAAgF-BemHSdcmzkqOUX+JNMLu0-GXs0EGm8YWHt+CBRP8Wa5DA@mail.gmail.com>
	<546DBE3D.90206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f182.google.com ([209.85.160.182]:47071 "EHLO
	mail-yk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757171AbaKTKP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 05:15:27 -0500
Received: by mail-yk0-f182.google.com with SMTP id 131so1143588ykp.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 02:15:27 -0800 (PST)
In-Reply-To: <546DBE3D.90206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org

Hi Sylwester,

On 11/20/14, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 20/11/14 08:04, Padma Venkat wrote:
>>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>>> > index 947352d..8db8c66 100644
>>> > --- a/sound/soc/samsung/i2s.c
>>> > +++ b/sound/soc/samsung/i2s.c
>>> > @@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>>> >  		if (dir == SND_SOC_CLOCK_IN)
>>> >  			mod |= 1 << i2s_regs->cdclkcon_off;
>>> >  		else
>>> > -			mod &= 0 << i2s_regs->cdclkcon_off;
>>> > +			mod &= ~(1 << i2s_regs->cdclkcon_off);
>>
>> Thanks for pointing this. In my local machine it was properly done but
>> while rebasing on linux-next I did some mistake. There is one more
>> place in set_sysclk which need to be corrected here
>> mod &= 0 << i2s_regs->rclksrc_off
>> can you include this change also in your patch or should I post a new
>> patch for all?
>
> OK, I'll also correct this and resend the patch.

As I found one more break statement missing. So posted a new patch
with all corrected code with your signed-off. Please do review of the
same.

Thanks for you support.
Padma

>
> --
> Regards,
> Sylwester
>
