From: Shirish S <shirish@chromium.org>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy
	driver
Date: Mon, 28 Oct 2013 11:36:30 +0530
Message-ID: <CAHvYUDDeSr9GBY8R7Hp6F9z9A4QP=TtVa_+whv3F8j4STJtbJA@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
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
	<CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA@mail.gmail.com>
	<5248A4EE.9000708@samsung.com> <gmail.com@samsung.com>
	<5248A4EE.9000708@gmail.com>
	<053c01cebe60$2fe5a4c0$8fb0ee40$%dae@samsung.com>
	<CAHvYUDC1GprC1xQcCSdRvSafe_yyihDsrzrTvfS-Ey-hELOgjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417726900=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAHvYUDC1GprC1xQcCSdRvSafe_yyihDsrzrTvfS-Ey-hELOgjA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1417726900==
Content-Type: multipart/alternative; boundary=089e013d19ccb47bbb04e9c6e656

--089e013d19ccb47bbb04e9c6e656
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I have uploaded patch set 2, with only required registers being moved to dt
file.
Thanks,
Shirish S


On Thu, Oct 3, 2013 at 7:58 AM, Shirish S <shirish@chromium.org> wrote:

> Hi,
> First of all sorry for the late response,
>
>
> On Tue, Oct 1, 2013 at 10:09 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
>>
>>
>> > -----Original Message-----
>> > From: Sylwester Nawrocki [mailto:sylvester.nawrocki@gmail.com]
>> > Sent: Monday, September 30, 2013 7:09 AM
>> > To: Inki Dae
>> > Cc: Rahul Sharma; devicetree@vger.kernel.org; linux-samsung-soc;
>> > sw0312.kim; sunil joshi; dri-devel; kgene.kim; Shirish S; Sylwester
>> > Nawrocki; Rahul Sharma; Stephen Warren; Mark Rutland; Kumar Gala; Pawel
>> > Moll; Rob Herring; Sean Paul
>> > Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to
>> hdmiphy
>> > driver
>> >
>> > On 09/28/2013 06:10 PM, Inki Dae wrote:
>> > >> Any opinion from Device-Tree folks?
>> > >>
>> > >> IMO, we should have same consensus on Shirish patches before
>> proceeding.
>> > >
>> > > Rahul, it seems that DT people have no interest in this issue. So
>> let's
>> > > have a consensus about this issue internally.
>> > >
>> > > To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,
>> > > How about keeping hdmiphy config data in each board dts file?
>> >
>> > Please don't use HTML and quote only relevant part of e-mails. Otherwise
>> > there are good chances your messages end up in people's spam box.
>> >
>>
>> Ah, I missed checking text mode. Sorry about this. :)
>>
>>
>>
>> > It often helps to Cc a DT binding maintainer directly.
>> >
>>
>> Good idea.
>>
>> > Then, you consider moving the HDMI phy configuration to the device tree.
>> > As Sean suggested in this thread:
>> >
>>
>> Right.
>>
>> > ">> +static struct hdmiphy_config hdmiphy_4210_configs[] = {
>> > >> +       {
>> > >> +               .pixel_clock = 27000000,
>> > >> +               .conf = {
>> > >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30,
>> 0x40,
>> > >> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54,
>> 0x87,
>> > >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10,
>> 0xE0,
>> > >> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00,
>> 0x00,
>> > >> +               },
>> > >> +       },
>> > [trimmed couple more entries]
>> > >> +};
>> > >>
>> > > Are you aware of the effort to move these to dt? Since these are
>> > > board-specific values, it seems incorrect to apply them universally.
>> > > Shirish has uploaded a patch to the chromium review site to push these
>> > > into dt (https://chromium-review.googlesource.com/#/c/65581). Maybe
>> > > you can work that into your patch set?"
>> >
>> > The configuration data is 64 bytes of the register values IIUC. Would it
>> > be
>> > possible to figure out exact meaning of each byte ? Do all of these
>> bytes
>>
>> Right, but the user manual doesn't describe that enough so we might need
>> to
>> inquire for what it means to design team.
>>
>> > need to be changed per board ? Perhaps we can have per SoC static tables
>> > in
>> > the PHY driver and be overwriting only some of the bytes with values
>> read
>> > from device tree ?
>> >
>> > AFAIR firmware-like binary blobs (register address/value pairs) are not
>> > supposed to be stored in DT.
>> >
>> > If there is no detailed documentation for theese PHY configuration
>> tables
>> > I guess there is no choice but to put these raw 64 bytes in DT.
>> Presumably
>> > this should be a an required property defined only by board dts, since
>> > those
>> > values are PCB design dependent.
>> >
>> > However, if not all boards need tweaking this configuration data, then
>> it
>> > could make sense to define recommended per-SoC tables in the driver and
>> > overwrite from DT only if it is specified there for a specific board.
>> > If we can come up with universal configuration for a SoC and selected
>> > pixel
>> > clock frequency then it could likely be better to store that in the
>> driver
>> > rather than in DT.
>> >
>>
>> Thanks you your opinion. However, we need to make sure how we take care of
>> the PHY configuration values. So I will have two steps to merge this pages
>> set.
>>
>> To Rahul,
>> Could you post only your patch set regardless of Shirish's patch? I will
>> merge your patch set first because as is, Exynos drm hdmi driver is
>> broken.
>> And, we need more discussions about Shirish patch. So I will not merge
>> this
>> patch until we have a consensus about it.
>>
>> To Shirish,
>> For your patch, it seems that you need to make sure to figure out exact
>> meaning of each byte of the PHY configuration values first. Maybe you need
>> to inquire for that to hardware or design team. And please separate the
>> values into common and specific parts if needed.
>>
>> Agreed, I shall request our hardware team to provide description about
> the phy values, and will update the patch, once i receive the same.
>
>
>>
>> Thanks,
>> Inki Dae
>>
>> > --
>> > Thanks,
>> > Sylwester
>>
>> Thanks,
> Shirish S
>

--089e013d19ccb47bbb04e9c6e656
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I have uploaded patch set 2, with only required re=
gisters being moved to dt file.</div><div>Thanks,</div><div>Shirish S<br><d=
iv class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Oct 3, =
2013 at 7:58 AM, Shirish S <span dir=3D"ltr">&lt;<a href=3D"mailto:shirish@=
chromium.org" target=3D"_blank">shirish@chromium.org</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div>First of all sorry =
for the late response,<br><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">
<div><div class=3D"h5">On Tue, Oct 1, 2013 at 10:09 AM, Inki Dae <span dir=
=3D"ltr">&lt;<a href=3D"mailto:inki.dae@samsung.com" target=3D"_blank">inki=
.dae@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Sylwester Nawrocki [mailto:<a href=3D"mailto:sylvester.nawrocki@=
gmail.com" target=3D"_blank">sylvester.nawrocki@gmail.com</a>]<br>
&gt; Sent: Monday, September 30, 2013 7:09 AM<br>
&gt; To: Inki Dae<br>
</div><div>&gt; Cc: Rahul Sharma; <a href=3D"mailto:devicetree@vger.kernel.=
org" target=3D"_blank">devicetree@vger.kernel.org</a>; linux-samsung-soc;<b=
r>
&gt; sw0312.kim; sunil joshi; dri-devel; kgene.kim; Shirish S; Sylwester<br=
>
&gt; Nawrocki; Rahul Sharma; Stephen Warren; Mark Rutland; Kumar Gala; Pawe=
l<br>
&gt; Moll; Rob Herring; Sean Paul<br>
&gt; Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmi=
phy<br>
&gt; driver<br>
&gt;<br>
</div><div>&gt; On 09/28/2013 06:10 PM, Inki Dae wrote:<br>
&gt; &gt;&gt; Any opinion from Device-Tree folks?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; IMO, we should have same consensus on Shirish patches before<=
br>
proceeding.<br>
&gt; &gt;<br>
&gt; &gt; Rahul, it seems that DT people have no interest in this issue. So=
 let&#39;s<br>
&gt; &gt; have a consensus about this issue internally.<br>
&gt; &gt;<br>
&gt; &gt; To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,<br>
&gt; &gt; How about keeping hdmiphy config data in each board dts file?<br>
&gt;<br>
&gt; Please don&#39;t use HTML and quote only relevant part of e-mails. Oth=
erwise<br>
&gt; there are good chances your messages end up in people&#39;s spam box.<=
br>
&gt;<br>
<br>
</div>Ah, I missed checking text mode. Sorry about this. :)<br>
<div><br>
<br>
<br>
&gt; It often helps to Cc a DT binding maintainer directly.<br>
&gt;<br>
<br>
</div>Good idea.<br>
<div><br>
&gt; Then, you consider moving the HDMI phy configuration to the device tre=
e.<br>
&gt; As Sean suggested in this thread:<br>
&gt;<br>
<br>
</div>Right.<br>
<div><br>
&gt; &quot;&gt;&gt; +static struct hdmiphy_config hdmiphy_4210_configs[] =
=3D {<br>
&gt; &gt;&gt; + =A0 =A0 =A0 {<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x0=
0, 0xD8, 0x10, 0x1C, 0x30, 0x40,<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x0=
2, 0x51, 0xDF, 0xF2, 0x54, 0x87,<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x3=
0, 0x38, 0x00, 0x08, 0x10, 0xE0,<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE=
3, 0x26, 0x00, 0x00, 0x00, 0x00,<br>
&gt; &gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
&gt; &gt;&gt; + =A0 =A0 =A0 },<br>
&gt; [trimmed couple more entries]<br>
&gt; &gt;&gt; +};<br>
&gt; &gt;&gt;<br>
&gt; &gt; Are you aware of the effort to move these to dt? Since these are<=
br>
&gt; &gt; board-specific values, it seems incorrect to apply them universal=
ly.<br>
&gt; &gt; Shirish has uploaded a patch to the chromium review site to push =
these<br>
&gt; &gt; into dt (<a href=3D"https://chromium-review.googlesource.com/#/c/=
65581" target=3D"_blank">https://chromium-review.googlesource.com/#/c/65581=
</a>). Maybe<br>
&gt; &gt; you can work that into your patch set?&quot;<br>
&gt;<br>
&gt; The configuration data is 64 bytes of the register values IIUC. Would =
it<br>
&gt; be<br>
&gt; possible to figure out exact meaning of each byte ? Do all of these by=
tes<br>
<br>
</div>Right, but the user manual doesn&#39;t describe that enough so we mig=
ht need to<br>
inquire for what it means to design team.<br>
<div><br>
&gt; need to be changed per board ? Perhaps we can have per SoC static tabl=
es<br>
&gt; in<br>
&gt; the PHY driver and be overwriting only some of the bytes with values r=
ead<br>
&gt; from device tree ?<br>
&gt;<br>
&gt; AFAIR firmware-like binary blobs (register address/value pairs) are no=
t<br>
&gt; supposed to be stored in DT.<br>
&gt;<br>
&gt; If there is no detailed documentation for theese PHY configuration tab=
les<br>
&gt; I guess there is no choice but to put these raw 64 bytes in DT. Presum=
ably<br>
&gt; this should be a an required property defined only by board dts, since=
<br>
&gt; those<br>
&gt; values are PCB design dependent.<br>
&gt;<br>
&gt; However, if not all boards need tweaking this configuration data, then=
 it<br>
&gt; could make sense to define recommended per-SoC tables in the driver an=
d<br>
&gt; overwrite from DT only if it is specified there for a specific board.<=
br>
&gt; If we can come up with universal configuration for a SoC and selected<=
br>
&gt; pixel<br>
&gt; clock frequency then it could likely be better to store that in the dr=
iver<br>
&gt; rather than in DT.<br>
&gt;<br>
<br>
</div>Thanks you your opinion. However, we need to make sure how we take ca=
re of<br>
the PHY configuration values. So I will have two steps to merge this pages<=
br>
set.<br>
<br>
To Rahul,<br>
Could you post only your patch set regardless of Shirish&#39;s patch? I wil=
l<br>
merge your patch set first because as is, Exynos drm hdmi driver is broken.=
<br>
And, we need more discussions about Shirish patch. So I will not merge this=
<br>
patch until we have a consensus about it.<br>
<br>
To Shirish,<br>
For your patch, it seems that you need to make sure to figure out exact<br>
meaning of each byte of the PHY configuration values first. Maybe you need<=
br>
to inquire for that to hardware or design team. And please separate the<br>
values into common and specific parts if needed.<br>
<br></blockquote></div></div><div>Agreed, I shall request our hardware team=
 to provide description about the phy values, and will update the patch, on=
ce i=A0receive=A0the same.</div><div class=3D"im"><div>=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">


<br>
Thanks,<br>
Inki Dae<br>
<span><font color=3D"#888888"><br>
&gt; --<br>
&gt; Thanks,<br>
&gt; Sylwester<br>
<br>
</font></span></blockquote></div></div>Thanks,</div></div><div class=3D"gma=
il_extra">Shirish S</div></div>
</blockquote></div><br></div></div></div>

--089e013d19ccb47bbb04e9c6e656--

--===============1417726900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1417726900==--
