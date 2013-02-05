From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Tue, 5 Feb 2013 21:24:55 +0530
Message-ID: <CAAgF-Bf4Jhv1AKFdkNMHtrPojHgt2a2L2bg=dJvfsEq=cmbFkg@mail.gmail.com>
References: <1359967675-624-1-git-send-email-padma.v@samsung.com>
	<201302041743.55029.arnd@arndb.de>
	<CAAgF-BfaYo7FoYyFHo1eW-bUGOYdvcfskf7_7UhmCOzASoreYg@mail.gmail.com>
	<201302051113.22720.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:38340 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755605Ab3BEPy5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 10:54:57 -0500
Received: by mail-ia0-f172.google.com with SMTP id u8so300844iag.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 07:54:55 -0800 (PST)
In-Reply-To: <201302051113.22720.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

Hi Arnd,

On Tue, Feb 5, 2013 at 4:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 05 February 2013, Padma Venkat wrote:
>> On Mon, Feb 4, 2013 at 11:13 PM, Arnd Bergmann <arnd@arndb.de> wrote=
:
>> > On Monday 04 February 2013, Padmavathi Venna wrote:
>> >> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-sams=
ung/dma-ops.c
>> >> index 71d58dd..ec0d731 100644
>> >> --- a/arch/arm/plat-samsung/dma-ops.c
>> >> +++ b/arch/arm/plat-samsung/dma-ops.c
>> >> @@ -23,23 +23,15 @@ static unsigned samsung_dmadev_request(enum d=
ma_ch dma_ch,
>> >>                               struct device *dev, char *ch_name)
>> >>  {
>> >>       dma_cap_mask_t mask;
>> >> -     void *filter_param;
>> >>
>> >>       dma_cap_zero(mask);
>> >>       dma_cap_set(param->cap, mask);
>> >>
>> >> -     /*
>> >> -      * If a dma channel property of a device node from device t=
ree is
>> >> -      * specified, use that as the fliter parameter.
>> >> -      */
>> >> -     filter_param =3D (dma_ch =3D=3D DMACH_DT_PROP) ?
>> >> -             (void *)param->dt_dmach_prop : (void *)dma_ch;
>> >> -
>> >>       if (dev->of_node)
>> >>               return (unsigned)dma_request_slave_channel(dev, ch_=
name);
>> >>       else
>> >>               return (unsigned)dma_request_channel(mask, pl330_fi=
lter,
>> >> -                                                     filter_para=
m);
>> >> +                                                     (void *)dma=
_ch);
>> >>  }
>> >
>> > This still looks wrong to me, because the pl330_filter function no=
w tkes
>> > a struct dma_pl330_filter_args pointer argument, not dma_ch name.
>>
>> Below is my understanding about generic dma and our discussion on
>> previous versions of my patches.
>>
>> I can=92t pass single dma channel number(may be not dma_ch name in y=
our
>> comment above) as void* argument to pl330_filter.  Because I also ne=
ed
>> to compare against the dma controller device node, as my requested
>> channel can belong to any of the available dma controller on SoC.  S=
o
>> I either need to pass pointer to dma_spec as void* argument which
>> holds the dma controller node and required channel number or I can
>> pass pointer to dma_pl330_filter_args as per your dw_dmac patches.
>
> Right.
>
>> If I pass pointer to dma_spec I can have a check like below in my
>> filter function
>> return ((chan->private =3D=3D dma_spec->np) && (chan->chan_id =3D=3D=
 dma_spec->args[0]))
>>
>> Or if I pass dma_pl330_filter_args I can have a check like below.
>> return ((chan->device =3D=3D &fargs->pdmac->ddma) && (chan->chan_id =
=3D=3D
>> fargs->chan_id));
>>
>> I modified  the pl330_filter function based on your dw_dmac patches.
>> Indeed I don=92t need to pass pointer to pdmac object as 3rd arg in
>> of_dma_controller_register .  Even I pass NULL here works for me.
>> Can I pass NULL here as the third argument in of_dma_controller_regi=
ster?
>
> These are all not the issues I am referring to in my comment above.
> I think it works either way, even if you pass NULL to
> of_dma_controller_register, although using it for the pdmac object
> seems cleaner to me.
>
>> Please clarify me which is best way of doing this and correct me if =
my
>> understanding is wrong.
>
> My point was that in the samsung_dmadev_request quoted above, you
> refer to the same pl330_filter filter function, but the argument ther=
e
> is a pointer to 'enum dma_ch', which is not compatible with any of
> the methods you list, neither the dma_pl330_filter_args nor the
> raw property.
>
> Also, if you change the calling conventions for the pl330_filter
> function, you should change both the caller and the function in the
> same patch.

In none of my patches I have changed the pl330_filter args.  This
function always takes the same argument void*. In non-DT case 'enum
dma_ch' was typecasted to void* and in DT case I am passing a pointer
to dma_pl330_filter_args and in pl330_filter function they are
converted back. In both cases it finally comes down to
dma_request_channel which takes them as void* which in turn calls the
pl330_filter.

I think this is what you are pointing to. Please let me know if I am
still wrong :( .

>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Thanks
Padma
