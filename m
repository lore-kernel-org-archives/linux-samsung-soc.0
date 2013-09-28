From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy
	driver
Date: Sun, 29 Sep 2013 01:10:42 +0900
Message-ID: <CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA@mail.gmail.com>
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
	<CAPdUM4OoicU76Tw-gkuvAGGvOHM-x1DfYLUEFKa3KaEAtwLAvw@mail.gmail.com>
	<CAOw6vbLrgigGHdwGQHRWJAF=N-ZaL+6VSyUfP37B-4baU-+jBQ@mail.gmail.com>
	<CAPdUM4PpFbc9utAsHnqyF9OJdipdgq036fqFM_SeG0O+M3N5jA@mail.gmail.com>
	<037401ceb2d9$ea596ea0$bf0c4be0$%dae@samsung.com>
	<CAPdUM4P0mecAGe++QELW_B7KOpABUSFvFTgCddowCM8cqtVvFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0313637989=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAPdUM4P0mecAGe++QELW_B7KOpABUSFvFTgCddowCM8cqtVvFA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Shirish S <shirish@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0313637989==
Content-Type: multipart/alternative; boundary=001a11c373e4411a9904e773d844

--001a11c373e4411a9904e773d844
Content-Type: text/plain; charset=ISO-8859-1

2013/9/27 Rahul Sharma <r.sh.open@gmail.com>

> On 16 September 2013 18:10, Inki Dae <inki.dae@samsung.com> wrote:
> > CCing devicetree,
> >
> >> -----Original Message-----
> >> From: Rahul Sharma [mailto:r.sh.open@gmail.com]
> >> Sent: Tuesday, September 10, 2013 5:28 PM
> >> To: Sean Paul
> >> Cc: Inki Dae; Rahul Sharma; linux-samsung-soc; dri-devel; kgene.kim;
> >> sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil joshi;
> >> Shirish S
> >> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to
> hdmiphy
> >> driver
> >>
> >> On 6 September 2013 19:21, Sean Paul <seanpaul@chromium.org> wrote:
> >> > On Thu, Sep 5, 2013 at 11:37 PM, Rahul Sharma <r.sh.open@gmail.com>
> >> wrote:
> >> >> On 5 September 2013 19:20, Inki Dae <inki.dae@samsung.com> wrote:
> >> >>>
> >> >>>
> >> >>>> -----Original Message-----
> >> >>>> From: Sean Paul [mailto:seanpaul@chromium.org]
> >> >>>> Sent: Thursday, September 05, 2013 10:20 PM
> >> >>>> To: Inki Dae
> >> >>>> Cc: Rahul Sharma; Rahul Sharma; linux-samsung-soc; dri-devel;
> >> kgene.kim;
> >> >>>> sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil
> > joshi;
> >> >>>> Shirish S
> >> >>>> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to
> >> hdmiphy
> >> >>>> driver
> >> >>>>
> >> >>>> On Thu, Sep 5, 2013 at 2:19 AM, Inki Dae <inki.dae@samsung.com>
> > wrote:
> >> >>>> >
> >> >>>> >
> >> >>>> >> -----Original Message-----
> >> >>>> >> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-
> >> samsung-
> >> >>>> soc-
> >> >>>> >> owner@vger.kernel.org] On Behalf Of Rahul Sharma
> >> >>>> >> Sent: Thursday, September 05, 2013 3:04 PM
> >> >>>> >> To: Inki Dae
> >> >>>> >> Cc: Sean Paul; Rahul Sharma; linux-samsung-soc; dri-devel;
> >> kgene.kim;
> >> >>>> >> sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil
> >> joshi;
> >> >>>> >> Shirish S
> >> >>>> >> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code
> to
> >> >>>> hdmiphy
> >> >>>> >> driver
> >> >>>> >>
> >> >>>> >> On 5 September 2013 10:52, Inki Dae <inki.dae@samsung.com>
> wrote:
> >> >>>> >> >> >> >> >> +static struct hdmiphy_config
> hdmiphy_4210_configs[] =
> >> {
> >> >>>> >> >> >> >> >> +       {
> >> >>>> >> >> >> >> >> +               .pixel_clock = 27000000,
> >> >>>> >> >> >> >> >> +               .conf = {
> >> >>>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8,
> 0x10,
> > 0x1C,
> >> >>>> > 0x30,
> >> >>>> >> >> > 0x40,
> >> >>>> >> >> >> >> >> +                       0x6B, 0x10, 0x02, 0x51,
> 0xDF,
> > 0xF2,
> >> >>>> > 0x54,
> >> >>>> >> >> > 0x87,
> >> >>>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38,
> 0x00,
> > 0x08,
> >> >>>> > 0x10,
> >> >>>> >> >> > 0xE0,
> >> >>>> >> >> >> >> >> +                       0x22, 0x40, 0xE3, 0x26,
> 0x00,
> > 0x00,
> >> >>>> > 0x00,
> >> >>>> >> >> > 0x00,
> >> >>>> >> >> >> >> >> +               },
> >> >>>> >> >> >> >> >> +       },
> >> >>>> >> >> >> >> >> +       {
> >> >>>> >> >> >> >> >> +               .pixel_clock = 27027000,
> >> >>>> >> >> >> >> >> +               .conf = {
> >> >>>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD4,
> 0x10,
> > 0x9C,
> >> >>>> > 0x09,
> >> >>>> >> >> > 0x64,
> >> >>>> >> >> >> >> >> +                       0x6B, 0x10, 0x02, 0x51,
> 0xDF,
> > 0xF2,
> >> >>>> > 0x54,
> >> >>>> >> >> > 0x87,
> >> >>>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38,
> 0x00,
> > 0x08,
> >> >>>> > 0x10,
> >> >>>> >> >> > 0xE0,
> >> >>>> >> >> >> >> >> +                       0x22, 0x40, 0xE3, 0x26,
> 0x00,
> > 0x00,
> >> >>>> > 0x00,
> >> >>>> >> >> > 0x00,
> >> >>>> >> >> >> >> >> +               },
> >> >>>> >> >> >> >> >> +       },
> >> >>>> >> >> >> >> >> +       {
> >> >>>> >> >> >> >> >> +               .pixel_clock = 74176000,
> >> >>>> >> >> >> >> >> +               .conf = {
> >> >>>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8,
> 0x10,
> > 0x9C,
> >> >>>> > 0xef,
> >> >>>> >> >> > 0x5B,
> >> >>>> >> >> >> >> >> +                       0x6D, 0x10, 0x01, 0x51,
> 0xef,
> > 0xF3,
> >> >>>> > 0x54,
> >> >>>> >> >> > 0xb9,
> >> >>>> >> >> >> >> >> +                       0x84, 0x00, 0x30, 0x38,
> 0x00,
> > 0x08,
> >> >>>> > 0x10,
> >> >>>> >> >> > 0xE0,
> >> >>>> >> >> >> >> >> +                       0x22, 0x40, 0xa5, 0x26,
> 0x01,
> > 0x00,
> >> >>>> > 0x00,
> >> >>>> >> >> > 0x00,
> >> >>>> >> >> >> >> >> +               },
> >> >>>> >> >> >> >> >> +       },
> >> >>>> >> >> >> >> >> +       {
> >> >>>> >> >> >> >> >> +               .pixel_clock = 74250000,
> >> >>>> >> >> >> >> >> +               .conf = {
> >> >>>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xd8,
> 0x10,
> > 0x9c,
> >> >>>> > 0xf8,
> >> >>>> >> >> > 0x40,
> >> >>>> >> >> >> >> >> +                       0x6a, 0x10, 0x01, 0x51,
> 0xff,
> > 0xf1,
> >> >>>> > 0x54,
> >> >>>> >> >> > 0xba,
> >> >>>> >> >> >> >> >> +                       0x84, 0x00, 0x10, 0x38,
> 0x00,
> > 0x08,
> >> >>>> > 0x10,
> >> >>>> >> >> > 0xe0,
> >> >>>> >> >> >> >> >> +                       0x22, 0x40, 0xa4, 0x26,
> 0x01,
> > 0x00,
> >> >>>> > 0x00,
> >> >>>> >> >> > 0x00,
> >> >>>> >> >> >> >> >> +               },
> >> >>>> >> >> >> >> >> +       },
> >> >>>> >> >> >> >> >> +       {
> >> >>>> >> >> >> >> >> +               .pixel_clock = 148500000,
> >> >>>> >> >> >> >> >> +               .conf = {
> >> >>>> >> >> >> >> >> +                       0x01, 0x05, 0x00, 0xD8,
> 0x10,
> > 0x9C,
> >> >>>> > 0xf8,
> >> >>>> >> >> > 0x40,
> >> >>>> >> >> >> >> >> +                       0x6A, 0x18, 0x00, 0x51,
> 0xff,
> > 0xF1,
> >> >>>> > 0x54,
> >> >>>> >> >> > 0xba,
> >> >>>> >> >> >> >> >> +                       0x84, 0x00, 0x10, 0x38,
> 0x00,
> > 0x08,
> >> >>>> > 0x10,
> >> >>>> >> >> > 0xE0,
> >> >>>> >> >> >> >> >> +                       0x22, 0x40, 0xa4, 0x26,
> 0x02,
> > 0x00,
> >> >>>> > 0x00,
> >> >>>> >> >> > 0x00,
> >> >>>> >> >> >> >> >> +               },
> >> >>>> >> >> >> >> >> +       },
> >> >>>> >> >> >> >> >> +};
> >> >>>> >> >> >> >> >> +
> >> >>>> >> >> >> >> >
> >> >>>> >> >> >> >> > Are you aware of the effort to move these to dt?
> Since
> >> these
> >> >>>> >> are
> >> >>>> >> >> >> >> > board-specific values, it seems incorrect to apply
> them
> >> >>>> >> >> universally.
> >> >>>> >> >> >> >> > Shirish has uploaded a patch to the chromium review
> >> site to
> >> >>>> >> push
> >> >>>> >> >> >> these
> >> >>>> >> >> >> >> > into dt
> >> >>> (https://chromium-review.googlesource.com/#/c/65581).
> >> >>>> >> >> Maybe
> >> >>>> >> >> >> >> > you can work that into your patch set?
> >> >>>> >> >> >> >> >
> >> >>>> >> >> >> >
> >> >>>> >> >> >> > Are these really board-specific values?
> >> >>>> >> >> >>
> >> >>>> >> >> >> According to your hardware people:
> >> >>>> >> >> >>
> >> >>>> >> >> >> "If the signal pattern doesn't change for new board, the
> phy
> >> >>>> setting
> >> >>>> >> >> >> is same as the current board. But if changed, you need to
> >> confirm
> >> >>>> >> with
> >> >>>> >> >> >> measurement of signals, because it may vary slightly by
> >> >>>> resistance
> >> >>>> >> of
> >> >>>> >> >> >> board pattern"
> >> >>>> >> >> >>
> >> >>>> >> >> >
> >> >>>> >> >> > Right. it seems that the phy configuration should be
> adjusted
> >> >>>> >> according
> >> >>>> >> >> to
> >> >>>> >> >> > PCB environment: OSC clock rate, 24MHz or 27MHz, could be
> >> decided
> >> >>>> by
> >> >>>> >> PCB
> >> >>>> >> >> > even though most PCBs use 27MHz.
> >> >>>> >> >> >
> >> >>>> >> >> >> That indicates to me that we might need to tweak these on
> a
> >> per-
> >> >>>> >> board
> >> >>>> >> >> >> basis.
> >> >>>> >> >> >>
> >> >>>> >> >> >> In the 5420 datasheet, there are a few register
> descriptions
> >> >>>> >> available
> >> >>>> >> >> >> for the phy. 0x145D0004 is CLK_SEL which seems like it
> would
> >> be
> >> >>>> >> >> >> board-specific, same with TX_* registers.
> >> >>>> >> >> >>
> >> >>>> >> >> >
> >> >>>> >> >> > And we can select HDMI Tx PHY internal PLL input clock by
> >> setting
> >> >>>> >> >> CLK_SEL.
> >> >>>> >> >> > Ok, Shirish's patch set is reasonable to me. However, that
> >> patch
> >> >>>> set
> >> >>>> >> >> should
> >> >>>> >> >> > be rebased on top of Rahul's patch set. Shirish and Rahul,
> >> please
> >> >>>> re-
> >> >>>> >> >> post
> >> >>>> >> >> > your patch set after discussing how to rebase these patch
> > set.
> >> >>>> >> >> >
> >> >>>> >> >> > Thanks,
> >> >>>> >> >> > Inki Dae
> >> >>>> >> >> >
> >> >>>> >> >>
> >> >>>> >> >> In that case, we need to test the phy confs for all the
> exynos
> >> >>>> boards,
> >> >>>> >> >> supported in
> >> >>>> >> >> mainline. Probably needs a analyser as well to precisely
> >> compare the
> >> >>>> >> >> deviation.
> >> >>>> >> >
> >> >>>> >> > Shirish patch adds phy config data only to arndale and
> smdk5250
> >> >>>> boards,
> >> >>>> >> and
> >> >>>> >> > these config data should have each board specific values.
> >> Therefore,
> >> >>>> for
> >> >>>> >> > other boards, shouldn't correct phy config data suitable to
> >> their
> >> >>>> boards
> >> >>>> >> be
> >> >>>> >> > added to their board dts files? Is the above analyzer really
> >> needed?
> >> >>>> >> >
> >> >>>> >>
> >> >>>> >> Sorry, I had only seen his patches for chromium tree. In
> mainline
> >> >>>> >> version, he added for 5250 as well. But both sets (for arndale
> and
> >> >>>> >> smdk) are exactly same as original 5250 configs which also works
> >> >>>> >> with 4412 origen.
> >> >>>> >>
> >> >>>> >> Some problem has been identified during conformance testing for
> >> >>>> >> 5420 peach board, which happens with analyser. It was always
> >> >>>> >> working fine on the TV sets that I have. @Shirish/Sean please
> >> >>>> >> correct me if wrong.
> >> >>>> >>
> >> >>>> >> >> Shirish patch is only for 5420 Peach board. Else, to start
> with
> >> we
> >> >>>> can
> >> >>>> >> >> mark
> >> >>>> >> >> phyconf as optional property which overrides the default Phy
> >> Confs
> >> >>>> for
> >> >>>> >> >> given SoC.
> >> >>>> >> >
> >> >>>> >> > Hm.... you mean that hdmiphy driver use the default phy config
> >> data
> >> >>>> in
> >> >>>> >> > driver; most boards use the same data, and only in special
> case;
> >> a
> >> >>>> board
> >> >>>> >> > uses different OSC clock rate, the hdmiphy driver use phy
> config
> >> data
> >> >>>> >> from
> >> >>>> >> > dts file checking hdmiphy-confs property?
> >> >>>> >> >
> >> >>>> >>
> >> >>>> >> Yes. I meant same. I don't see the real need to duplicate so
> much
> >> >>>> >> of data in all board dts files. We can add it for a particular
> >> board,
> >> >>>> if
> >> >>>> >> really required.
> >> >>>> >>
> >> >>>> >
> >> >>>> > Yes, reasonable to me. It's not good that board dts files have
> same
> >> phy
> >> >>>> > config data. How about using the phy config data from dts file if
> >> >>>> > hdmiphy-confs property exists, otherwise using default phy config
> >> data
> >> >>>> then?
> >> >>>> > This means that we don't need to remove the phy config data from
> >> driver;
> >> >>>> > that will be used as default values.
> >> >>>> >
> >> >>>>
> >> >>>> Can you add the "default" configs to exynos5250.dtsi and
> >> >>>> exynos5420.dtsi, then overwrite it in the board file if it needs to
> >> be
> >> >>>> different?
> >> >>>>
> >> >>
> >> >> This will still introduce some duplication as 4412 and 5250 share
> same
> >> >> phy confs and have no common dtsi. Similar situation can arise for
> >> later
> >> >> SoCs in exynos series.
> >> >>
> >> >>>
> >> >>> Good idea but how about adding default-hdmiphy-config property to
> each
> >> board
> >> >>> dts file and removing phy config data from board dts file if they
> are
> >> same
> >> >>> as default one of driver? With this, hdmiphy driver checks if
> >> >>> default-hdmiphy-config property exists, and then use default config
> >> data if
> >> >>> exists. And if not exists, hdmiphy driver gets and uses board
> specific
> >> phy
> >> >>> config data from board dts file.
> >> >>> And it seems that the phy config values of Shirish's patch set are
> >> same as
> >> >>> default ones of driver. So we can remove the phy config data from
> each
> >> board
> >> >>> dts files and add default-hdmiphy-config property to there so that
> >> default
> >> >>> data of driver can be used.
> >> >>>
> >> >>>
> >> >>> Thanks,
> >> >>> Inki Dae
> >> >>>
> >> >>
> >> >> We can simplify it further by letting the driver use phy-conf
> >> >> property from DT. If phy-conf property is not available switch to
> >> >> default confs, provided in the driver. This way we don't need to add
> >> >> default-hdmiphy-config property to all board files.
> >> >>
> >> >
> >> > This is probably a worthwhile discussion to have on Shirish's patch
> >> > with devicetree-discuss. I'm unsure which is the preferred way to do
> >> > something like this.
> >>
> >> I agree.
> >>
> >> Shall we keep those patches for "phy conf from DT" independent to this
> >> series? Until this phy separation patches get merged, hdmi will remain
> >> broken for 5250 and 5420.
> >>
> >
> > Sorry for being late. I was so busy.
> >
> > I have pondered over whether we should use default phy config values of
> > driver or not. My opinion is that we need to keep the default phy config
> > values in dts file because the values couldn't be used as default for all
> > boards: the default means that all boards should work well with the
> default
> > values, but wouldn't work. Therefore, the default values we are
> discussing
> > are specific to some boards even though most boards work well with the
> > values.
> >
> > So I tend to agree with Sean Paul. Let's just add the default phy config
> > values to each board dts file that works well even though the values are
> > duplicated. For this, Rahul, we could rebase your patch set on top of
> > Shirish's patch.
> >
> > Other opinions?
> >
>
> Any opinion from Device-Tree folks?
>
> IMO, we should have same consensus on Shirish patches before proceeding.
>
>
Rahul, it seems that DT people have no interest in this issue. So let's
have a consensus about this issue internally.

To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,
How about keeping hdmiphy config data in each board dts file?

Thanks,
Inki Dae


> Regards,
> Rahul Sharma.
>
> > Thanks,
> > Inki Dae
> >
> >> regards,
> >> Rahul Sharma.
> >>
> >> >
> >> > Sean
> >> >
> >> >> The number of exceptions where we need to override the default confs
> >> >> is zero (as if now). 5420 based Peach and Smdk boards work exactly
> >> >> the same with same set of phy confs on 3 hdmi displays, I have. It
> >> >> may differ on Analyser. IMO we can defer this part till we have
> >> >> unacceptable analyser results for any specific board.
> >> >>
> >> >> Regards,
> >> >> Rahul Sharma.
> >> >>
> >> >>>> Sean
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>> > Rahul, let's go if there is other opinion. we SHOULD MERGE these
> >> this
> >> >>>> > time.:)
> >> >>>> >
> >> >>>> > Thanks,
> >> >>>> > Inki Dae
> >> >>>> >
> >> >>>> >> Regards,
> >> >>>> >> Rahul Sharma.
> >> >>>> >>
> >> >>>> >> >
> >> >>>> >> >>
> >> >>>> >> >> regards,
> >> >>>> >> >> Rahul Sharma.
> >> >>>> >> >>
> >> >>>> >> >> >> Sean
> >> >>>> >> >> >>
> >> >>>> >> >> >>
> >> >>>> >> >
> >> >>>> >> --
> >> >>>> >> To unsubscribe from this list: send the line "unsubscribe linux-
> >> >>>> samsung-
> >> >>>> >> soc" in
> >> >>>> >> the body of a message to majordomo@vger.kernel.org
> >> >>>> >> More majordomo info at
> http://vger.kernel.org/majordomo-info.html
> >> >>>> >
> >> >>>
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--001a11c373e4411a9904e773d844
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2013/9/27 Rahul Sharma <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:r.sh.open@gmail.com" target=3D"_blank">r.sh.open@gma=
il.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);borde=
r-left-width:1px;border-left-style:solid">
<div class=3D"HOEnZb"><div class=3D"h5">On 16 September 2013 18:10, Inki Da=
e &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt; =
wrote:<br>
&gt; CCing devicetree,<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Rahul Sharma [mailto:<a href=3D"mailto:r.sh.open@gmail.com">=
r.sh.open@gmail.com</a>]<br>
&gt;&gt; Sent: Tuesday, September 10, 2013 5:28 PM<br>
&gt;&gt; To: Sean Paul<br>
&gt;&gt; Cc: Inki Dae; Rahul Sharma; linux-samsung-soc; dri-devel; kgene.ki=
m;<br>
&gt;&gt; sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester Nawrocki; sunil jo=
shi;<br>
&gt;&gt; Shirish S<br>
&gt;&gt; Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to =
hdmiphy<br>
&gt;&gt; driver<br>
&gt;&gt;<br>
&gt;&gt; On 6 September 2013 19:21, Sean Paul &lt;<a href=3D"mailto:seanpau=
l@chromium.org">seanpaul@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt; On Thu, Sep 5, 2013 at 11:37 PM, Rahul Sharma &lt;<a href=3D"=
mailto:r.sh.open@gmail.com">r.sh.open@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; On 5 September 2013 19:20, Inki Dae &lt;<a href=3D"mailto=
:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt; &gt;&gt;&gt;&gt; From: Sean Paul [mailto:<a href=3D"mailto:seanpau=
l@chromium.org">seanpaul@chromium.org</a>]<br>
&gt;&gt; &gt;&gt;&gt;&gt; Sent: Thursday, September 05, 2013 10:20 PM<br>
&gt;&gt; &gt;&gt;&gt;&gt; To: Inki Dae<br>
&gt;&gt; &gt;&gt;&gt;&gt; Cc: Rahul Sharma; Rahul Sharma; linux-samsung-soc=
; dri-devel;<br>
&gt;&gt; kgene.kim;<br>
&gt;&gt; &gt;&gt;&gt;&gt; sw0312.kim; Lucas Stach; Tomasz Figa; Sylwester N=
awrocki; sunil<br>
&gt; joshi;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Shirish S<br>
&gt;&gt; &gt;&gt;&gt;&gt; Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy=
 related code to<br>
&gt;&gt; hdmiphy<br>
&gt;&gt; &gt;&gt;&gt;&gt; driver<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; On Thu, Sep 5, 2013 at 2:19 AM, Inki Dae &lt;<a h=
ref=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; -----Original Message-----<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; From: <a href=3D"mailto:linux-samsung-so=
c-owner@vger.kernel.org">linux-samsung-soc-owner@vger.kernel.org</a> [mailt=
o:<a href=3D"mailto:linux-">linux-</a><br>
&gt;&gt; samsung-<br>
&gt;&gt; &gt;&gt;&gt;&gt; soc-<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; <a href=3D"mailto:owner@vger.kernel.org"=
>owner@vger.kernel.org</a>] On Behalf Of Rahul Sharma<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Sent: Thursday, September 05, 2013 3:04 =
PM<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; To: Inki Dae<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Cc: Sean Paul; Rahul Sharma; linux-samsu=
ng-soc; dri-devel;<br>
&gt;&gt; kgene.kim;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; sw0312.kim; Lucas Stach; Tomasz Figa; Sy=
lwester Nawrocki; sunil<br>
&gt;&gt; joshi;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Shirish S<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Subject: Re: [PATCH 1/7] drm/exynos: mov=
e hdmiphy related code to<br>
&gt;&gt; &gt;&gt;&gt;&gt; hdmiphy<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; driver<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; On 5 September 2013 10:52, Inki Dae &lt;=
<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +sta=
tic struct hdmiphy_config hdmiphy_4210_configs[] =3D<br>
&gt;&gt; {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,<b=
r>
&gt; 0x1C,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x30,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x40,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,<b=
r>
&gt; 0xF2,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x54,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x87,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,<b=
r>
&gt; 0x08,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x10,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xE0,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,<b=
r>
&gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27027000,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD4, 0x10,<b=
r>
&gt; 0x9C,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x09,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x64,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,<b=
r>
&gt; 0xF2,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x54,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x87,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,<b=
r>
&gt; 0x08,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x10,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xE0,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,<b=
r>
&gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74176000,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,<b=
r>
&gt; 0x9C,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0xef,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x5B,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6D, 0x10, 0x01, 0x51, 0xef,<b=
r>
&gt; 0xF3,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x54,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xb9,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,<b=
r>
&gt; 0x08,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x10,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xE0,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa5, 0x26, 0x01,<b=
r>
&gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74250000,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xd8, 0x10,<b=
r>
&gt; 0x9c,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0xf8,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x40,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6a, 0x10, 0x01, 0x51, 0xff,<b=
r>
&gt; 0xf1,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x54,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xba,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,<b=
r>
&gt; 0x08,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x10,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xe0,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x01,<b=
r>
&gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 148500000,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,<b=
r>
&gt; 0x9C,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0xf8,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x40,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6A, 0x18, 0x00, 0x51, 0xff,<b=
r>
&gt; 0xF1,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x54,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xba,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,<b=
r>
&gt; 0x08,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x10,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0xE0,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x02,<b=
r>
&gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; 0x00,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; + =
=A0 =A0 =A0 },<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +};<=
br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br=
>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Are you =
aware of the effort to move these to dt? Since<br>
&gt;&gt; these<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; are<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; board-sp=
ecific values, it seems incorrect to apply them<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; universally.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Shirish =
has uploaded a patch to the chromium review<br>
&gt;&gt; site to<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; push<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; these<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; into dt<=
br>
&gt;&gt; &gt;&gt;&gt; (<a href=3D"https://chromium-review.googlesource.com/=
#/c/65581" target=3D"_blank">https://chromium-review.googlesource.com/#/c/6=
5581</a>).<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; Maybe<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; you can =
work that into your patch set?<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Are these really =
board-specific values?<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; According to your hard=
ware people:<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &quot;If the signal pa=
ttern doesn&#39;t change for new board, the phy<br>
&gt;&gt; &gt;&gt;&gt;&gt; setting<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; is same as the current=
 board. But if changed, you need to<br>
&gt;&gt; confirm<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; with<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; measurement of signals=
, because it may vary slightly by<br>
&gt;&gt; &gt;&gt;&gt;&gt; resistance<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; of<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; board pattern&quot;<br=
>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; Right. it seems that the p=
hy configuration should be adjusted<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; according<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; PCB environment: OSC clock=
 rate, 24MHz or 27MHz, could be<br>
&gt;&gt; decided<br>
&gt;&gt; &gt;&gt;&gt;&gt; by<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; PCB<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; even though most PCBs use =
27MHz.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; That indicates to me t=
hat we might need to tweak these on a<br>
&gt;&gt; per-<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; board<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; basis.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; In the 5420 datasheet,=
 there are a few register descriptions<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; available<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; for the phy. 0x145D000=
4 is CLK_SEL which seems like it would<br>
&gt;&gt; be<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; board-specific, same w=
ith TX_* registers.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; And we can select HDMI Tx =
PHY internal PLL input clock by<br>
&gt;&gt; setting<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; CLK_SEL.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; Ok, Shirish&#39;s patch se=
t is reasonable to me. However, that<br>
&gt;&gt; patch<br>
&gt;&gt; &gt;&gt;&gt;&gt; set<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; should<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; be rebased on top of Rahul=
&#39;s patch set. Shirish and Rahul,<br>
&gt;&gt; please<br>
&gt;&gt; &gt;&gt;&gt;&gt; re-<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; post<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; your patch set after discu=
ssing how to rebase these patch<br>
&gt; set.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt; Inki Dae<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; In that case, we need to test t=
he phy confs for all the exynos<br>
&gt;&gt; &gt;&gt;&gt;&gt; boards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; supported in<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; mainline. Probably needs a anal=
yser as well to precisely<br>
&gt;&gt; compare the<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; deviation.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; Shirish patch adds phy config data =
only to arndale and smdk5250<br>
&gt;&gt; &gt;&gt;&gt;&gt; boards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; and<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; these config data should have each =
board specific values.<br>
&gt;&gt; Therefore,<br>
&gt;&gt; &gt;&gt;&gt;&gt; for<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; other boards, shouldn&#39;t correct=
 phy config data suitable to<br>
&gt;&gt; their<br>
&gt;&gt; &gt;&gt;&gt;&gt; boards<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; be<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; added to their board dts files? Is =
the above analyzer really<br>
&gt;&gt; needed?<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Sorry, I had only seen his patches for c=
hromium tree. In mainline<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; version, he added for 5250 as well. But =
both sets (for arndale and<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; smdk) are exactly same as original 5250 =
configs which also works<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; with 4412 origen.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Some problem has been identified during =
conformance testing for<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; 5420 peach board, which happens with ana=
lyser. It was always<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; working fine on the TV sets that I have.=
 @Shirish/Sean please<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; correct me if wrong.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; Shirish patch is only for 5420 =
Peach board. Else, to start with<br>
&gt;&gt; we<br>
&gt;&gt; &gt;&gt;&gt;&gt; can<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; mark<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; phyconf as optional property wh=
ich overrides the default Phy<br>
&gt;&gt; Confs<br>
&gt;&gt; &gt;&gt;&gt;&gt; for<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; given SoC.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; Hm.... you mean that hdmiphy driver=
 use the default phy config<br>
&gt;&gt; data<br>
&gt;&gt; &gt;&gt;&gt;&gt; in<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; driver; most boards use the same da=
ta, and only in special case;<br>
&gt;&gt; a<br>
&gt;&gt; &gt;&gt;&gt;&gt; board<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; uses different OSC clock rate, the =
hdmiphy driver use phy config<br>
&gt;&gt; data<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; from<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt; dts file checking hdmiphy-confs pro=
perty?<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Yes. I meant same. I don&#39;t see the r=
eal need to duplicate so much<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; of data in all board dts files. We can a=
dd it for a particular<br>
&gt;&gt; board,<br>
&gt;&gt; &gt;&gt;&gt;&gt; if<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; really required.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Yes, reasonable to me. It&#39;s not good tha=
t board dts files have same<br>
&gt;&gt; phy<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; config data. How about using the phy config =
data from dts file if<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; hdmiphy-confs property exists, otherwise usi=
ng default phy config<br>
&gt;&gt; data<br>
&gt;&gt; &gt;&gt;&gt;&gt; then?<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; This means that we don&#39;t need to remove =
the phy config data from<br>
&gt;&gt; driver;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; that will be used as default values.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Can you add the &quot;default&quot; configs to ex=
ynos5250.dtsi and<br>
&gt;&gt; &gt;&gt;&gt;&gt; exynos5420.dtsi, then overwrite it in the board f=
ile if it needs to<br>
&gt;&gt; be<br>
&gt;&gt; &gt;&gt;&gt;&gt; different?<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This will still introduce some duplication as 4412 and 52=
50 share same<br>
&gt;&gt; &gt;&gt; phy confs and have no common dtsi. Similar situation can =
arise for<br>
&gt;&gt; later<br>
&gt;&gt; &gt;&gt; SoCs in exynos series.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Good idea but how about adding default-hdmiphy-config=
 property to each<br>
&gt;&gt; board<br>
&gt;&gt; &gt;&gt;&gt; dts file and removing phy config data from board dts =
file if they are<br>
&gt;&gt; same<br>
&gt;&gt; &gt;&gt;&gt; as default one of driver? With this, hdmiphy driver c=
hecks if<br>
&gt;&gt; &gt;&gt;&gt; default-hdmiphy-config property exists, and then use =
default config<br>
&gt;&gt; data if<br>
&gt;&gt; &gt;&gt;&gt; exists. And if not exists, hdmiphy driver gets and us=
es board specific<br>
&gt;&gt; phy<br>
&gt;&gt; &gt;&gt;&gt; config data from board dts file.<br>
&gt;&gt; &gt;&gt;&gt; And it seems that the phy config values of Shirish&#3=
9;s patch set are<br>
&gt;&gt; same as<br>
&gt;&gt; &gt;&gt;&gt; default ones of driver. So we can remove the phy conf=
ig data from each<br>
&gt;&gt; board<br>
&gt;&gt; &gt;&gt;&gt; dts files and add default-hdmiphy-config property to =
there so that<br>
&gt;&gt; default<br>
&gt;&gt; &gt;&gt;&gt; data of driver can be used.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Thanks,<br>
&gt;&gt; &gt;&gt;&gt; Inki Dae<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We can simplify it further by letting the driver use phy-=
conf<br>
&gt;&gt; &gt;&gt; property from DT. If phy-conf property is not available s=
witch to<br>
&gt;&gt; &gt;&gt; default confs, provided in the driver. This way we don&#3=
9;t need to add<br>
&gt;&gt; &gt;&gt; default-hdmiphy-config property to all board files.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is probably a worthwhile discussion to have on Shirish&#=
39;s patch<br>
&gt;&gt; &gt; with devicetree-discuss. I&#39;m unsure which is the preferre=
d way to do<br>
&gt;&gt; &gt; something like this.<br>
&gt;&gt;<br>
&gt;&gt; I agree.<br>
&gt;&gt;<br>
&gt;&gt; Shall we keep those patches for &quot;phy conf from DT&quot; indep=
endent to this<br>
&gt;&gt; series? Until this phy separation patches get merged, hdmi will re=
main<br>
&gt;&gt; broken for 5250 and 5420.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sorry for being late. I was so busy.<br>
&gt;<br>
&gt; I have pondered over whether we should use default phy config values o=
f<br>
&gt; driver or not. My opinion is that we need to keep the default phy conf=
ig<br>
&gt; values in dts file because the values couldn&#39;t be used as default =
for all<br>
&gt; boards: the default means that all boards should work well with the de=
fault<br>
&gt; values, but wouldn&#39;t work. Therefore, the default values we are di=
scussing<br>
&gt; are specific to some boards even though most boards work well with the=
<br>
&gt; values.<br>
&gt;<br>
&gt; So I tend to agree with Sean Paul. Let&#39;s just add the default phy =
config<br>
&gt; values to each board dts file that works well even though the values a=
re<br>
&gt; duplicated. For this, Rahul, we could rebase your patch set on top of<=
br>
&gt; Shirish&#39;s patch.<br>
&gt;<br>
&gt; Other opinions?<br>
&gt;<br>
<br>
</div></div>Any opinion from Device-Tree folks?<br>
<br>
IMO, we should have same consensus on Shirish patches before proceeding.<br=
>
<br></blockquote><div>=A0</div><div>Rahul, it seems that DT people have no =
interest in this issue. So let&#39;s have a consensus=A0about this issue=A0=
internally.</div><div>=A0</div><div>To=A0Mr. Kyungmin, Sylwester, Kukjin Ki=
m, and Tomasz,</div>
<div>How about keeping hdmiphy config data in each board dts file?</div><di=
v>=A0</div><div>Thanks,</div><div>Inki Dae=A0</div><div>=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;=
border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:=
solid">

Regards,<br>
Rahul Sharma.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt;<br>
&gt;&gt; regards,<br>
&gt;&gt; Rahul Sharma.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sean<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; The number of exceptions where we need to override the de=
fault confs<br>
&gt;&gt; &gt;&gt; is zero (as if now). 5420 based Peach and Smdk boards wor=
k exactly<br>
&gt;&gt; &gt;&gt; the same with same set of phy confs on 3 hdmi displays, I=
 have. It<br>
&gt;&gt; &gt;&gt; may differ on Analyser. IMO we can defer this part till w=
e have<br>
&gt;&gt; &gt;&gt; unacceptable analyser results for any specific board.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Regards,<br>
&gt;&gt; &gt;&gt; Rahul Sharma.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Sean<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Rahul, let&#39;s go if there is other opinio=
n. we SHOULD MERGE these<br>
&gt;&gt; this<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; time.:)<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Inki Dae<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Regards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; Rahul Sharma.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; regards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; Rahul Sharma.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Sean<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; To unsubscribe from this list: send the =
line &quot;unsubscribe linux-<br>
&gt;&gt; &gt;&gt;&gt;&gt; samsung-<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; soc&quot; in<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; the body of a message to <a href=3D"mail=
to:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a><br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;&gt; More majordomo info at =A0<a href=3D"htt=
p://vger.kernel.org/majordomo-info.html" target=3D"_blank">http://vger.kern=
el.org/majordomo-info.html</a><br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br>

--001a11c373e4411a9904e773d844--

--===============0313637989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0313637989==--
