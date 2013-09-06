From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Fri, 6 Sep 2013 09:07:22 +0530
Message-ID: <CAPdUM4OoicU76Tw-gkuvAGGvOHM-x1DfYLUEFKa3KaEAtwLAvw@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
	<1377845974-28373-2-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vb+2gspWDcTgqt24Mf-Bxusoi5_jr2GR+i=gmG+nmCdNzg@mail.gmail.com>
	<CAPdUM4Px=yoZeGTVVtaKexuBerhQYH08nZYn81QkT9v_vm0i7Q@mail.gmail.com>
	<011901cea941$91853e40$b48fbac0$%dae@samsung.com>
	<CAOw6vb+32WsEY0px-iZaSv-AYj9NS6OX9hqpH-y6VQ77SpHymw@mail.gmail.com>
	<00bf01cea9ee$bcda5960$368f0c20$%dae@samsung.com>
	<CAPdUM4PT4cpXSe6sLgFaQnsycgY9AvYXPtgTMywYT0oePwPWwA@mail.gmail.com>
	<00ca01cea9f7$f5ee3b50$e1cab1f0$%dae@samsung.com>
	<CAPdUM4MxLBoiE6DpUbkn2-Sji89RM1+yHeAS1c2OREB+=BfdVg@mail.gmail.com>
	<00cf01cea9ff$dc9749a0$95c5dce0$%dae@samsung.com>
	<CAOw6vbLAuJyFU55wP1+Akm6PZepxaS_UuwFYe9LWcM3sKFmWwA@mail.gmail.com>
	<011601ceaa3e$d08e8b20$71aba160$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:48400 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758065Ab3IFDhY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 23:37:24 -0400
Received: by mail-wg0-f41.google.com with SMTP id a12so383185wgh.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 20:37:23 -0700 (PDT)
In-Reply-To: <011601ceaa3e$d08e8b20$71aba160$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sunil joshi <joshi@samsung.com>, Shirish S <shirish@chromium.org>

On 5 September 2013 19:20, Inki Dae <inki.dae@samsung.com> wrote:
>
>
>> -----Original Message-----
>> From: Sean Paul [mailto:seanpaul@chromium.org]
>> Sent: Thursday, September 05, 2013 10:20 PM
>> To: Inki Dae
>> Cc: Rahul Sharma; Rahul Sharma; linux-samsung-soc; dri-devel; kgene.kim;
>> sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil joshi;
>> Shirish S
>> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy
>> driver
>>
>> On Thu, Sep 5, 2013 at 2:19 AM, Inki Dae <inki.dae@samsung.com> wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-
>> soc-
>> >> owner@vger.kernel.org] On Behalf Of Rahul Sharma
>> >> Sent: Thursday, September 05, 2013 3:04 PM
>> >> To: Inki Dae
>> >> Cc: Sean Paul; Rahul Sharma; linux-samsung-soc; dri-devel; kgene.kim;
>> >> sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil joshi;
>> >> Shirish S
>> >> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to
>> hdmiphy
>> >> driver
>> >>
>> >> On 5 September 2013 10:52, Inki Dae <inki.dae@samsung.com> wrote:
>> >> >> >> >> >> +static struct hdmiphy_config hdmiphy_4210_configs[] = {
>> >> >> >> >> >> +       {
>> >> >> >> >> >> +               .pixel_clock = 27000000,
>> >> >> >> >> >> +               .conf = {
>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C,
>> > 0x30,
>> >> >> > 0x40,
>> >> >> >> >> >> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2,
>> > 0x54,
>> >> >> > 0x87,
>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08,
>> > 0x10,
>> >> >> > 0xE0,
>> >> >> >> >> >> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00,
>> > 0x00,
>> >> >> > 0x00,
>> >> >> >> >> >> +               },
>> >> >> >> >> >> +       },
>> >> >> >> >> >> +       {
>> >> >> >> >> >> +               .pixel_clock = 27027000,
>> >> >> >> >> >> +               .conf = {
>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C,
>> > 0x09,
>> >> >> > 0x64,
>> >> >> >> >> >> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2,
>> > 0x54,
>> >> >> > 0x87,
>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08,
>> > 0x10,
>> >> >> > 0xE0,
>> >> >> >> >> >> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00,
>> > 0x00,
>> >> >> > 0x00,
>> >> >> >> >> >> +               },
>> >> >> >> >> >> +       },
>> >> >> >> >> >> +       {
>> >> >> >> >> >> +               .pixel_clock = 74176000,
>> >> >> >> >> >> +               .conf = {
>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C,
>> > 0xef,
>> >> >> > 0x5B,
>> >> >> >> >> >> +                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3,
>> > 0x54,
>> >> >> > 0xb9,
>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08,
>> > 0x10,
>> >> >> > 0xE0,
>> >> >> >> >> >> +                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00,
>> > 0x00,
>> >> >> > 0x00,
>> >> >> >> >> >> +               },
>> >> >> >> >> >> +       },
>> >> >> >> >> >> +       {
>> >> >> >> >> >> +               .pixel_clock = 74250000,
>> >> >> >> >> >> +               .conf = {
>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c,
>> > 0xf8,
>> >> >> > 0x40,
>> >> >> >> >> >> +                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1,
>> > 0x54,
>> >> >> > 0xba,
>> >> >> >> >> >> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08,
>> > 0x10,
>> >> >> > 0xe0,
>> >> >> >> >> >> +                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00,
>> > 0x00,
>> >> >> > 0x00,
>> >> >> >> >> >> +               },
>> >> >> >> >> >> +       },
>> >> >> >> >> >> +       {
>> >> >> >> >> >> +               .pixel_clock = 148500000,
>> >> >> >> >> >> +               .conf = {
>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C,
>> > 0xf8,
>> >> >> > 0x40,
>> >> >> >> >> >> +                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1,
>> > 0x54,
>> >> >> > 0xba,
>> >> >> >> >> >> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08,
>> > 0x10,
>> >> >> > 0xE0,
>> >> >> >> >> >> +                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00,
>> > 0x00,
>> >> >> > 0x00,
>> >> >> >> >> >> +               },
>> >> >> >> >> >> +       },
>> >> >> >> >> >> +};
>> >> >> >> >> >> +
>> >> >> >> >> >
>> >> >> >> >> > Are you aware of the effort to move these to dt? Since these
>> >> are
>> >> >> >> >> > board-specific values, it seems incorrect to apply them
>> >> >> universally.
>> >> >> >> >> > Shirish has uploaded a patch to the chromium review site to
>> >> push
>> >> >> >> these
>> >> >> >> >> > into dt
> (https://chromium-review.googlesource.com/#/c/65581).
>> >> >> Maybe
>> >> >> >> >> > you can work that into your patch set?
>> >> >> >> >> >
>> >> >> >> >
>> >> >> >> > Are these really board-specific values?
>> >> >> >>
>> >> >> >> According to your hardware people:
>> >> >> >>
>> >> >> >> "If the signal pattern doesn't change for new board, the phy
>> setting
>> >> >> >> is same as the current board. But if changed, you need to confirm
>> >> with
>> >> >> >> measurement of signals, because it may vary slightly by
>> resistance
>> >> of
>> >> >> >> board pattern"
>> >> >> >>
>> >> >> >
>> >> >> > Right. it seems that the phy configuration should be adjusted
>> >> according
>> >> >> to
>> >> >> > PCB environment: OSC clock rate, 24MHz or 27MHz, could be decided
>> by
>> >> PCB
>> >> >> > even though most PCBs use 27MHz.
>> >> >> >
>> >> >> >> That indicates to me that we might need to tweak these on a per-
>> >> board
>> >> >> >> basis.
>> >> >> >>
>> >> >> >> In the 5420 datasheet, there are a few register descriptions
>> >> available
>> >> >> >> for the phy. 0x145D0004 is CLK_SEL which seems like it would be
>> >> >> >> board-specific, same with TX_* registers.
>> >> >> >>
>> >> >> >
>> >> >> > And we can select HDMI Tx PHY internal PLL input clock by setting
>> >> >> CLK_SEL.
>> >> >> > Ok, Shirish's patch set is reasonable to me. However, that patch
>> set
>> >> >> should
>> >> >> > be rebased on top of Rahul's patch set. Shirish and Rahul, please
>> re-
>> >> >> post
>> >> >> > your patch set after discussing how to rebase these patch set.
>> >> >> >
>> >> >> > Thanks,
>> >> >> > Inki Dae
>> >> >> >
>> >> >>
>> >> >> In that case, we need to test the phy confs for all the exynos
>> boards,
>> >> >> supported in
>> >> >> mainline. Probably needs a analyser as well to precisely compare the
>> >> >> deviation.
>> >> >
>> >> > Shirish patch adds phy config data only to arndale and smdk5250
>> boards,
>> >> and
>> >> > these config data should have each board specific values. Therefore,
>> for
>> >> > other boards, shouldn't correct phy config data suitable to their
>> boards
>> >> be
>> >> > added to their board dts files? Is the above analyzer really needed?
>> >> >
>> >>
>> >> Sorry, I had only seen his patches for chromium tree. In mainline
>> >> version, he added for 5250 as well. But both sets (for arndale and
>> >> smdk) are exactly same as original 5250 configs which also works
>> >> with 4412 origen.
>> >>
>> >> Some problem has been identified during conformance testing for
>> >> 5420 peach board, which happens with analyser. It was always
>> >> working fine on the TV sets that I have. @Shirish/Sean please
>> >> correct me if wrong.
>> >>
>> >> >> Shirish patch is only for 5420 Peach board. Else, to start with we
>> can
>> >> >> mark
>> >> >> phyconf as optional property which overrides the default Phy Confs
>> for
>> >> >> given SoC.
>> >> >
>> >> > Hm.... you mean that hdmiphy driver use the default phy config data
>> in
>> >> > driver; most boards use the same data, and only in special case; a
>> board
>> >> > uses different OSC clock rate, the hdmiphy driver use phy config data
>> >> from
>> >> > dts file checking hdmiphy-confs property?
>> >> >
>> >>
>> >> Yes. I meant same. I don't see the real need to duplicate so much
>> >> of data in all board dts files. We can add it for a particular board,
>> if
>> >> really required.
>> >>
>> >
>> > Yes, reasonable to me. It's not good that board dts files have same phy
>> > config data. How about using the phy config data from dts file if
>> > hdmiphy-confs property exists, otherwise using default phy config data
>> then?
>> > This means that we don't need to remove the phy config data from driver;
>> > that will be used as default values.
>> >
>>
>> Can you add the "default" configs to exynos5250.dtsi and
>> exynos5420.dtsi, then overwrite it in the board file if it needs to be
>> different?
>>

This will still introduce some duplication as 4412 and 5250 share same
phy confs and have no common dtsi. Similar situation can arise for later
SoCs in exynos series.

>
> Good idea but how about adding default-hdmiphy-config property to each board
> dts file and removing phy config data from board dts file if they are same
> as default one of driver? With this, hdmiphy driver checks if
> default-hdmiphy-config property exists, and then use default config data if
> exists. And if not exists, hdmiphy driver gets and uses board specific phy
> config data from board dts file.
> And it seems that the phy config values of Shirish's patch set are same as
> default ones of driver. So we can remove the phy config data from each board
> dts files and add default-hdmiphy-config property to there so that default
> data of driver can be used.
>
>
> Thanks,
> Inki Dae
>

We can simplify it further by letting the driver use phy-conf
property from DT. If phy-conf property is not available switch to
default confs, provided in the driver. This way we don't need to add
default-hdmiphy-config property to all board files.

The number of exceptions where we need to override the default confs
is zero (as if now). 5420 based Peach and Smdk boards work exactly
the same with same set of phy confs on 3 hdmi displays, I have. It
may differ on Analyser. IMO we can defer this part till we have
unacceptable analyser results for any specific board.

Regards,
Rahul Sharma.

>> Sean
>>
>>
>>
>> > Rahul, let's go if there is other opinion. we SHOULD MERGE these this
>> > time.:)
>> >
>> > Thanks,
>> > Inki Dae
>> >
>> >> Regards,
>> >> Rahul Sharma.
>> >>
>> >> >
>> >> >>
>> >> >> regards,
>> >> >> Rahul Sharma.
>> >> >>
>> >> >> >> Sean
>> >> >> >>
>> >> >> >>
>> >> >
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe linux-
>> samsung-
>> >> soc" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >
>
