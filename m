From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Thu, 5 Dec 2013 16:20:03 +0530
Message-ID: <CAAgF-Bc3fOdJ3C-Jrmw-7Vxt_9QSJHEX5kWvCEyu_WBrsMDdEA@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
	<1384264120-24750-2-git-send-email-broonie@kernel.org>
	<CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
	<20131126102311.GW14725@sirena.org.uk>
	<CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
	<20131126122031.GA14725@sirena.org.uk>
	<CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
	<20131127150534.GW14725@sirena.org.uk>
	<CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
	<20131128115351.GC27568@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:50112 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755396Ab3LEKuE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 05:50:04 -0500
Received: by mail-qa0-f44.google.com with SMTP id i13so7488790qae.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2013 02:50:03 -0800 (PST)
In-Reply-To: <20131128115351.GC27568@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Thu, Nov 28, 2013 at 5:23 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Nov 28, 2013 at 03:29:31PM +0530, Padma Venkat wrote:
>> On Wed, Nov 27, 2013 at 8:35 PM, Mark Brown <broonie@kernel.org> wrote:
>
>> > But if it's initialised at probe time then when is it getting
>> > overwritten?  This must be something triggered by DT which unfortunately
>> > I can't test.  It's a bit of a shame that the flows are different
>> > between the DT and non-DT cases.
>
>> it's getting overwritten in i2s_hw_params which is happening after
>> dma_data got initialized in dai probe. Based on mono or stereo channel
>> this value getting initialized to 2 or 4 respectively in
>> i2s_hw_params. This value is not triggered by DT now.
>
> OK, so we can probably just reinitialise the dmaengine data after we
> reset it?  Like below

Yes. That works well.

>
>> > Are you sure that dma_size should be 2?  The i2s DAI driver seems to be
>> > hard coding it to 4.
>
>> I think for mono files the dma_size should be 2 only. Right now based
>> on mono or stereo this value getting overwritten in i2s_hw_params.
>> Initially it is hardcoded to 4. Due to this commit "ASoC: samsung:
>> Allow mono in i2s driver" which was not there earlier, I got confused.
>> Now it seems clear except that underrun message which I am still
>> debugging.

As I forgot to add SND_DMAENGINE_PCM_FLAG_NO_RESIDUE flag, I was
getting underrun error. After adding this flag audio playback is
working fine for smaller files on smdk5420 with pl330 dma driver.

Except for the crash due to NULL pointer dereference in secondary
dai(I posted a patch for the same (ASoC: samsung: Initialize the
dma_data for secondary dai)) you can add my

Tested By: Padmavathi Venna <padma.v@samsung.com>

>
> Yeah, that's now confusing - I'll send a patch to remove the
> initialisation on probe() since it's getting overwritten later.
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 67d9fa91fdb9..ba24a954b9e4 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -702,6 +702,8 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>         }
>         writel(mod, i2s->addr + I2SMOD);
>
> +       samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
> +
>         i2s->frmclk = params_rate(params);
>
>         return 0;

Thanks
Padma
