From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to exynos5250-arndale.dts
Date: Thu, 9 May 2013 22:38:30 -0700
Message-ID: <CAOesGMg0LLhC7=EYtWxaDL5x=v=ZA6ov5K_j-nxhzev4L-w-Rg@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
	<1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
	<4212940.hYf2k9NPUY@flatron>
	<CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:38477 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754Ab3EJFic (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 May 2013 01:38:32 -0400
Received: by mail-wi0-f178.google.com with SMTP id hm14so243268wib.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 May 2013 22:38:30 -0700 (PDT)
In-Reply-To: <CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim" <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Patch Tracking <patches@linaro.org>

On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Hi Tomasz,
>
>
> On 10 May 2013 05:35, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>
>> Hi Vikas,
>>
>> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
>> > Adds display timing node for a DP panel to Arndale Board DTS file
>> >
>> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> > ---
>> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
>> >  1 file changed, 16 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c
>> > 100644
>> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> > @@ -459,4 +459,20 @@
>> >               samsung,lane-count = <4>;
>> >       };
>> >
>> > +     display-timings {
>> > +             native-mode = <&timing0>;
>> > +             timing0: timing@0 {
>> > +                     /* 2560x1600 DP panel */
>> > +                     clock-frequency = <50000>;
>> > +                     hactive = <2560>;
>> > +                     vactive = <1600>;
>> > +                     hfront-porch = <48>;
>> > +                     hback-porch = <80>;
>> > +                     hsync-len = <32>;
>> > +                     vback-porch = <16>;
>> > +                     vfront-porch = <8>;
>> > +                     vsync-len = <6>;
>> > +             };
>> > +     };
>>
>> What display are those timings used for? Shouldn't they be placed inside
>> node of that display?
>>
>
> This timing information will be used parsed by the FIMD probe with the help
> of "Video Helper function"  as done in this link
>
> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0

That function passes in a device node pointer to the FIMD device node,
and only looks for a display-timings node under there. Tomasz is
right, as far as I can tell.

Placing display timings at the root of the device tree seems completely wrong.

> Please refer to this patch which is used for exynos4412-origen and
> exynos5250-smdk5250 respectively in similar way
>
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=0207775d6ff7e6a6eddb9931f9328f0f0173a338
>
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=06c460b73f75894cabfb1f5277f27cddbc92745c

That needs to be fixed up as well, thanks for pointing it out.


-Olof
