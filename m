From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Wed, 27 Nov 2013 18:08:47 +0530
Message-ID: <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
	<1384264120-24750-2-git-send-email-broonie@kernel.org>
	<CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
	<20131126102311.GW14725@sirena.org.uk>
	<CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
	<20131126122031.GA14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:62919 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749Ab3K0Mis (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Nov 2013 07:38:48 -0500
Received: by mail-qa0-f47.google.com with SMTP id w5so5675431qac.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2013 04:38:47 -0800 (PST)
In-Reply-To: <20131126122031.GA14725@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Tue, Nov 26, 2013 at 5:50 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 26, 2013 at 04:18:41PM +0530, Padma Venkat wrote:
>
>> I tried this on linux-samsung tree by applying all the patches from
>> you and Lars.
>
> Can you use -next plus the posted patches please in case there's
> something been misplaced, it'll help if we're working from the same code
> base?

Sound tree has some booting issue on smdk5420 so I tried this on
linux-samsung tree.

>
>> I initialised the dma_data for secondary dai as there is a crash with out that.
>
> Can you please send a patch for that if you find it's needed?  Like I
> said in reply to your earlier mail it looks like this doesn't work
> anyway so mainline ought to be fixed.

Okay. I will send a patch.

>
>> Then I used aplay after running the mixer settings.
>> ./aplay /mars/share/sounds/alsa/Front_Center.wav
>
> So this is 16 bit stereo or something, and did it work beforehand?  Like
> I say I suspect the DMA is ending up being configured with the wrong
> transfer size, can you check what actually happens there please - what's
> different about the configuration that the DMA controller gets?  I don't
> have any Exynos systems with mainline audio support so I can't test
> anything myself.

This stream was working before. dma_size in i2s_hw_params not getting
effected as dma_data is getting initialized only at dai probe time. So
by default the dma_size is always 4 which is initialized at driver
probe time. The fifo_size of dai is also always 0. It is not getting
passed from dai driver. I just hard coded the dma_size to 2 and
fifo_size to 32 then I can hear the audio only on right ear phone.
Still underrun error message appears.

Thanks
Padma
