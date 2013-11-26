From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 26 Nov 2013 16:18:41 +0530
Message-ID: <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
	<1384264120-24750-2-git-send-email-broonie@kernel.org>
	<CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
	<20131126102311.GW14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f45.google.com ([209.85.128.45]:44809 "EHLO
	mail-qe0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652Ab3KZKsm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 05:48:42 -0500
Received: by mail-qe0-f45.google.com with SMTP id 6so5397809qea.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Nov 2013 02:48:41 -0800 (PST)
In-Reply-To: <20131126102311.GW14725@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>

Hi Mark,

On Tue, Nov 26, 2013 at 3:53 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 26, 2013 at 10:55:17AM +0530, Padma Venkat wrote:
>
>> I tested this patch set on smdk5420 i2s. During playback audio playing
>> fast and there is underrun error like below.
>> underrun!!! (at least 0.061 ms long)
>> underrun!!! (at least 0.043 ms long)
>
> This sounds like it's setting the transfer width incorrectly, though I
> can't immediately see how that's changed unless the DMA driver is not
> working correctly.  What exactly did you do to test?

I tried this on linux-samsung tree by applying all the patches from
you and Lars.
I initialised the dma_data for secondary dai as there is a crash with out that.
Then I used aplay after running the mixer settings.
./aplay /mars/share/sounds/alsa/Front_Center.wav

Thanks
Padma
