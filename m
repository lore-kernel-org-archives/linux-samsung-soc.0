From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: Provide helper for DMA init
Date: Mon, 9 Dec 2013 17:30:47 +0530
Message-ID: <CAAgF-BcVqUt7wnYiDxWNsyo79JoZqiSCc=z7obRptXmdx2Ht_g@mail.gmail.com>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
	<CAAgF-BdD_DONQYPOenMwBmc6N+EOJQ3TwJz1hpG2qZVfzhR63Q@mail.gmail.com>
	<20131206112708.GD29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:49052 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932604Ab3LIMAt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 07:00:49 -0500
Received: by mail-qc0-f173.google.com with SMTP id m20so2570557qcx.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 04:00:48 -0800 (PST)
In-Reply-To: <20131206112708.GD29268@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org

Hi Mark,

On Fri, Dec 6, 2013 at 4:57 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Dec 06, 2013 at 10:44:33AM +0530, Padma Venkat wrote:
>
>> This is done in your earlier patch " ASoC: samsung: Ensure DMA data is
>> initialised for secondary DAI ". Was it done on purpose or by mistake
>> in this patch?
>
> It's intentional - notice that the function has changed, this is why I
> kept asking you about mainline.  Mainline doesn't have the wrapper
> function that abstracts the difference between s3c-dma and dmaengine,
> this is why I'm saying these two will need to be rebased on top of the
> mainline fix.

Ok. I didn't notice the function name. Then this commit is not
required in the mainline.
This is required only after your changes because in dmaengine we are
requesting the dma channel statically but in mainline(with samsung
proprietary ops) we are requesting the dma channel at run time during
playback or capture.

>
>> I think you also told to include a patch for reinitialization of the
>> dma_data in i2s_hw_params. If you are in the process of debugging some
>> bug as you mentioned earlier you can ignore this comment. Otherwise it
>> is just a reminder.
>
> Hrm, forgot to commit that bit.

Thanks
Padma
