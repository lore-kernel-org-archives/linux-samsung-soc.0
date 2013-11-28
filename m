From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Thu, 28 Nov 2013 15:29:31 +0530
Message-ID: <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
	<1384264120-24750-2-git-send-email-broonie@kernel.org>
	<CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
	<20131126102311.GW14725@sirena.org.uk>
	<CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
	<20131126122031.GA14725@sirena.org.uk>
	<CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
	<20131127150534.GW14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:48910 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750847Ab3K1J7b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 04:59:31 -0500
Received: by mail-qa0-f54.google.com with SMTP id f11so540241qae.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2013 01:59:31 -0800 (PST)
In-Reply-To: <20131127150534.GW14725@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Wed, Nov 27, 2013 at 8:35 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 27, 2013 at 06:08:47PM +0530, Padma Venkat wrote:
>> On Tue, Nov 26, 2013 at 5:50 PM, Mark Brown <broonie@kernel.org> wrote:
>
>> > So this is 16 bit stereo or something, and did it work beforehand?  Like
>> > I say I suspect the DMA is ending up being configured with the wrong
>> > transfer size, can you check what actually happens there please - what's
>> > different about the configuration that the DMA controller gets?  I don't
>> > have any Exynos systems with mainline audio support so I can't test
>> > anything myself.
>
>> This stream was working before. dma_size in i2s_hw_params not getting
>> effected as dma_data is getting initialized only at dai probe time. So
>> by default the dma_size is always 4 which is initialized at driver
>> probe time. The fifo_size of dai is also always 0. It is not getting
>> passed from dai driver. I just hard coded the dma_size to 2 and
>
> But if it's initialised at probe time then when is it getting
> overwritten?  This must be something triggered by DT which unfortunately
> I can't test.  It's a bit of a shame that the flows are different
> between the DT and non-DT cases.

it's getting overwritten in i2s_hw_params which is happening after
dma_data got initialized in dai probe. Based on mono or stereo channel
this value getting initialized to 2 or 4 respectively in
i2s_hw_params. This value is not triggered by DT now.

>
> The FIFO size looks like a difference between the pl330 and pl080, it
> doesn't seem to matter for pl080.  We just need to set it though.

fifo_size seems doesn't have any effect even in this case.

>
>> fifo_size to 32 then I can hear the audio only on right ear phone.
>> Still underrun error message appears.
>
> Are you sure that dma_size should be 2?  The i2s DAI driver seems to be
> hard coding it to 4.

I think for mono files the dma_size should be 2 only. Right now based
on mono or stereo this value getting overwritten in i2s_hw_params.
Initially it is hardcoded to 4. Due to this commit "ASoC: samsung:
Allow mono in i2s driver" which was not there earlier, I got confused.
Now it seems clear except that underrun message which I am still
debugging.

Thanks
Padma
