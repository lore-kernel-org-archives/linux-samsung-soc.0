From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Initialize the dma_data for secondary dai
Date: Thu, 5 Dec 2013 16:33:19 +0530
Message-ID: <CAAgF-BdqRzB5MxTf_9nZkgSOY=F6dGAs0yhTkNHqrUQLonFAsw@mail.gmail.com>
References: <1385632932-16579-1-git-send-email-padma.v@samsung.com>
	<20131128113800.GB27568@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:49742 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752475Ab3LELDT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 06:03:19 -0500
Received: by mail-qc0-f172.google.com with SMTP id e16so4688180qcx.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2013 03:03:19 -0800 (PST)
In-Reply-To: <20131128113800.GB27568@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, lars@metafoo.de

Hi Mark,

On Thu, Nov 28, 2013 at 5:08 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Nov 28, 2013 at 03:32:12PM +0530, Padmavathi Venna wrote:
>
>> This is made based on Mark Brown for-next branch of sound.git
>> This patch is based on Mark Brown below patches for
>> generic dma engine support for samsung audio IPs.
>> ASoC: samsung: Use ASoC dmaengine code where possible
>> ASoC: samsung: Provide helper for DMA init
>
> Why don't we need this fix for mainline?  The dmaengine change is just
> moving the initialisation through a layer of indirection but there was
> initialisation anyway.  I'm concerned that there's a bug that ought to
> be fixed for v3.13 as well here.

Yes. We need this for mainline. Not dependent on your dmaengine changes.

>
>>       return snd_dmaengine_pcm_register(dev, &samsung_dmaengine_pcm_config,
>> -                                       SND_DMAENGINE_PCM_FLAG_COMPAT);
>> +                                       SND_DMAENGINE_PCM_FLAG_COMPAT |
>> +                             SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME);
>
> This is already done.

Should I send another patch by removing this flag from this patch?

Thanks
Padma
