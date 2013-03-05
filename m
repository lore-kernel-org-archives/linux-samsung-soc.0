From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] DMA: PL330: Add check if device tree compatible
Date: Tue, 5 Mar 2013 11:21:46 +0530
Message-ID: <CAAgF-Bfw7__aehMT3RBXz4=S7kxd_0frs8v1FqA=gP0Dq5H6hg@mail.gmail.com>
References: <1362374943-29312-1-git-send-email-padma.v@samsung.com>
	<201303041258.39222.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:47244 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752244Ab3CEFvr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 00:51:47 -0500
Received: by mail-ie0-f170.google.com with SMTP id c11so7341155ieb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Mar 2013 21:51:46 -0800 (PST)
In-Reply-To: <201303041258.39222.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com

Hi Arnd,

On Mon, Mar 4, 2013 at 6:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 04 March 2013, Padmavathi Venna wrote:
>> +
>> +       if (adev->dev.of_node) {
>> +               ret = of_dma_controller_register(adev->dev.of_node,
>> +                                        of_dma_pl330_xlate, pdmac);
>> +               if (ret) {
>> +                       dev_err(&adev->dev,
>> +                       "unable to register DMA to the generic DT DMA helpers\n");
>> +                       goto probe_err4;
>> +               }
>>         }
>
> Hmm, when I did the same thing in dw_dma, Andy commented that this should
> not be a failure at all, since the device is still usable. Could we
> instead make of_dma_controller_register return silently when it
> gets a NULL of_node?

Ok. I will do that.

Thanks
Padma
>
>         Arnd
