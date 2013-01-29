From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/4] DMA: PL330: Add xlate function
Date: Tue, 29 Jan 2013 14:33:29 +0530
Message-ID: <CAAgF-BcxqNyf8VQcndJbRnQYEcZyRayTYq-hqkB73Jd+FVTaYg@mail.gmail.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
	<1358508824-20352-2-git-send-email-padma.v@samsung.com>
	<201301281458.15219.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:34305 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754556Ab3A2JD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 04:03:29 -0500
Received: by mail-ie0-f175.google.com with SMTP id c12so122973ieb.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 01:03:29 -0800 (PST)
In-Reply-To: <201301281458.15219.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, swarren@nvidia.com, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com

Hi,

On Mon, Jan 28, 2013 at 8:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 18 January 2013, Padmavathi Venna wrote:
>> +struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
>> +                                               struct of_dma *ofdma)
>> +{
>> +       int count = dma_spec->args_count;
>> +       struct of_dma_filter_info *info = ofdma->of_dma_data;
>> +
>> +       if (!info || !info->filter_fn)
>> +               return NULL;
>> +
>> +       if (count != 1)
>> +               return NULL;
>> +
>> +       return dma_request_channel(info->dma_cap, info->filter_fn, dma_spec);
>> +}
>> +EXPORT_SYMBOL_GPL(of_dma_pl330_xlate);
>
> It seems a little sad that we still have to use dma_request_channel()
> to implement this, when that function will go off searching all channels
> and pass them tino the filter, which then has to look for the device node
> and match it with each channel. We already know the controller and should
> just be able to get a channel for it, although I don't exactly know how
> that is done.
>
> Further, your function is almost identical to the of_dma_simple_xlate
> function. Can't you use that one instead?

of_dma_simple_xlate is just passing the dma channel number to the
filter function. But I also need
to compare against device node as my requested channel can belong to
any of the available dma controller
on SoC. So I implemented a xlate which passes the whole dma_spec.

Thanks for reviewing the patches.

Regards
Padma

>
>         Arnd
