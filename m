From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2 4/4] DMA: PL330: Modify pl330 filter based on new
 generic dma dt bindings.
Date: Sat, 2 Feb 2013 08:00:54 +0530
Message-ID: <CAAgF-Bf55eN2WOgU5nQa=nF76fHvBHR7NdmvoBpF-n4ke6rd1g@mail.gmail.com>
References: <1359723116-18173-1-git-send-email-padma.v@samsung.com>
	<1359723116-18173-5-git-send-email-padma.v@samsung.com>
	<201302011523.25771.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:48781 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757258Ab3BBCaz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 21:30:55 -0500
Received: by mail-ie0-f170.google.com with SMTP id c11so4154934ieb.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Feb 2013 18:30:54 -0800 (PST)
In-Reply-To: <201302011523.25771.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

Hi Arnd,

On Fri, Feb 1, 2013 at 8:53 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 01 February 2013, Padmavathi Venna wrote:
>> This patch modify the filter function to filter the required channel
>> based on new filter params.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>
> The result of this looks good, but I fear that changing the filter function
> like this wil break all drivers that currently use the plat-samsung/dma-ops.c
> code. For migration purposes, I think the best way is to change
> samsung_dmadev_request() to match the new filter_param format.
>
> After that is done, you can migrate all the drivers using samsung_dma_get_ops
> over to the new dma_request_slave_channel interface without breaking
> anything when only part of the series is applied.
>
>         Arnd

Please check the below link where I made the dma request compatible to
both DT and non-DT

http://git.kernel.org/?p=linux/kernel/git/broonie/sound.git;a=commit;h=e7ba5f1d0f6292e1b99c63cc4bb74c70232e9065
http://git.kernel.org/?p=linux/kernel/git/broonie/sound.git;a=commit;h=b5be04d35dbb2e00ab27a97bfd26e17019e857ef

Please let me know if any changes required.

Thanks for the suggestions.
Padma
