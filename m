From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Tue, 5 Feb 2013 13:34:29 +0530
Message-ID: <CAAgF-BfaYo7FoYyFHo1eW-bUGOYdvcfskf7_7UhmCOzASoreYg@mail.gmail.com>
References: <1359967675-624-1-git-send-email-padma.v@samsung.com>
	<201302041743.55029.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:54788 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754109Ab3BEIEa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 03:04:30 -0500
Received: by mail-ie0-f180.google.com with SMTP id bn7so5856817ieb.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 00:04:30 -0800 (PST)
In-Reply-To: <201302041743.55029.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

Hi Arnd,

On Mon, Feb 4, 2013 at 11:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 04 February 2013, Padmavathi Venna wrote:
>> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung=
/dma-ops.c
>> index 71d58dd..ec0d731 100644
>> --- a/arch/arm/plat-samsung/dma-ops.c
>> +++ b/arch/arm/plat-samsung/dma-ops.c
>> @@ -23,23 +23,15 @@ static unsigned samsung_dmadev_request(enum dma_=
ch dma_ch,
>>                               struct device *dev, char *ch_name)
>>  {
>>       dma_cap_mask_t mask;
>> -     void *filter_param;
>>
>>       dma_cap_zero(mask);
>>       dma_cap_set(param->cap, mask);
>>
>> -     /*
>> -      * If a dma channel property of a device node from device tree=
 is
>> -      * specified, use that as the fliter parameter.
>> -      */
>> -     filter_param =3D (dma_ch =3D=3D DMACH_DT_PROP) ?
>> -             (void *)param->dt_dmach_prop : (void *)dma_ch;
>> -
>>       if (dev->of_node)
>>               return (unsigned)dma_request_slave_channel(dev, ch_nam=
e);
>>       else
>>               return (unsigned)dma_request_channel(mask, pl330_filte=
r,
>> -                                                     filter_param);
>> +                                                     (void *)dma_ch=
);
>>  }
>
> This still looks wrong to me, because the pl330_filter function now t=
kes
> a struct dma_pl330_filter_args pointer argument, not dma_ch name.

Below is my understanding about generic dma and our discussion on
previous versions of my patches.

I can=92t pass single dma channel number(may be not dma_ch name in your
comment above) as void* argument to pl330_filter.  Because I also need
to compare against the dma controller device node, as my requested
channel can belong to any of the available dma controller on SoC.  So
I either need to pass pointer to dma_spec as void* argument which
holds the dma controller node and required channel number or I can
pass pointer to dma_pl330_filter_args as per your dw_dmac patches.

If I pass pointer to dma_spec I can have a check like below in my
filter function
return ((chan->private =3D=3D dma_spec->np) && (chan->chan_id =3D=3D dm=
a_spec->args[0]))

Or if I pass dma_pl330_filter_args I can have a check like below.
return ((chan->device =3D=3D &fargs->pdmac->ddma) && (chan->chan_id =3D=
=3D
fargs->chan_id));

I modified  the pl330_filter function based on your dw_dmac patches.
Indeed I don=92t need to pass pointer to pdmac object as 3rd arg in
of_dma_controller_register .  Even I pass NULL here works for me.
Can I pass NULL here as the third argument in of_dma_controller_registe=
r?
Please clarify me which is best way of doing this and correct me if my
understanding is wrong.

>
>         Arnd
Thanks
Padma
