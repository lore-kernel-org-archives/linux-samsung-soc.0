From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v2 1/7] ARM: dts: Move display-timimg information inside
 FIMD DT node for exynos5250
Date: Wed, 14 Aug 2013 14:10:16 +0530
Message-ID: <CAGm_ybiXe17UNrXzj0YCA2E6W-L1zpPbhh8TqMqBAJbYm7KG=g@mail.gmail.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
	<171932162.BeOHtLbZec@amdc1227>
	<105c01ce98b3$14b3d1e0$3e1b75a0$@org>
	<1502617.tZjjGUmS3P@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36734 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759410Ab3HNIkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 04:40:19 -0400
In-Reply-To: <1502617.tZjjGUmS3P@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, InKi Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, patches@linaro.org, linaro-kernel@lists.linaro.org, Grant Likely <grant.likely@secretlab.ca>, swarren@wwwdotorg.org, mark.rutland@arm.com

Hi Tomasz,

On Wed, Aug 14, 2013 at 1:46 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Wednesday 14 of August 2013 14:56:55 Kukjin Kim wrote:
>> Tomasz Figa wrote:
>> > Hi Vikas,
>> >
>> > On Tuesday 30 of July 2013 16:49:32 Vikas Sajjan wrote:
>> > > As the display-timing information is parsed by FIMD driver, it makes
>> > > sense to move the display-timimg DT node inside FIMD DT node for
>> > > exynos5250
>> > >
>> > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> > > ---
>> > >
>> > >  arch/arm/boot/dts/exynos5250-smdk5250.dts |   29
>> > >
>> > > ++++++++++++++++------------- 1 file changed, 16 insertions(+), 13
>> > > deletions(-)
>> > >
>> > > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> > > b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 49f18c2..d176dbb
>> > > 100644
>> > > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> > > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> > > @@ -262,19 +262,22 @@
>> > >
>> > >           pinctrl-0 = <&dp_hpd>;
>> > >
>> > >   };
>> > >
>> > > - display-timings {
>> > > -         native-mode = <&timing0>;
>> > > -         timing0: timing@0 {
>> > > -                 /* 1280x800 */
>> > > -                 clock-frequency = <50000>;
>> > > -                 hactive = <1280>;
>> > > -                 vactive = <800>;
>> > > -                 hfront-porch = <4>;
>> > > -                 hback-porch = <4>;
>> > > -                 hsync-len = <4>;
>> > > -                 vback-porch = <4>;
>> > > -                 vfront-porch = <4>;
>> > > -                 vsync-len = <4>;
>> > > + fimd@14400000 {
>> > > +         status = "okay";
>> > > +         display-timings {
>> > > +                 native-mode = <&timing0>;
>> > > +                 timing0: timing@0 {
>> > > +                         /* 1280x800 */
>> > > +                         clock-frequency = <50000>;
>> > > +                         hactive = <1280>;
>> > > +                         vactive = <800>;
>> > > +                         hfront-porch = <4>;
>> > > +                         hback-porch = <4>;
>> > > +                         hsync-len = <4>;
>> > > +                         vback-porch = <4>;
>> > > +                         vfront-porch = <4>;
>> > > +                         vsync-len = <4>;
>> > > +                 };
>> > >
>> > >           };
>> > >
>> > >   };
>> >
>> > Looks good to me, but I would like some other people from the device
>> > tree mailing list to comment on node naming: Do we want to conform to
>> > the recommendation of ePAPR about node naming, which states that node
>> > names should be generic, not platform specific or we are free to
>> > ignore it?
>> The name of node looks good to me and the name had been being used for a
>> long time
>
> Like a lot of things used in device trees of ARM platforms, since we did
> not have any proper processes defined for creating device tree bindings
> and device trees themselves, including any recommended set of good
> practices.
>
> We are now trying to define all of this and so it's time to rethink all
> the DT related things that has been added for ARM platforms since the time
> DT for ARM was introduced and make sure that everything is reasonable.
>
>> , and if we change that now, that will cause the bigger
>> confusion.
>
> Still, I think this patch can go as is and node naming can be fixed in
> separate patches, including any other quirks of Exynos device trees.
>
> So, for the whole series:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>

Thanks for the review.


> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
