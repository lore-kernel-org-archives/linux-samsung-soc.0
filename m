From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Wed, 1 Feb 2017 15:29:40 +0000
Message-ID: <CACvgo504WEd_pPrjEViH+-i8BNwEjQ-q7MdnYWJ3V6uTB_tk5Q@mail.gmail.com>
References: <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com> <588FD3C3.7080508@samsung.com>
 <20170131085449.GA19348@ulmo.ba.sec> <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec> <87r33j85ap.fsf@eliezer.anholt.net>
 <20170131213132.GC872@mithrandir.ba.sec> <87d1f2kfgi.fsf@eliezer.anholt.net> <20170201145249.GB17698@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34627 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750903AbdBAP3n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 10:29:43 -0500
In-Reply-To: <20170201145249.GB17698@ulmo.ba.sec>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Eric Anholt <eric@anholt.net>, devicetree <devicetree@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Donghwa Lee <dh09.lee@samsung.com>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, Kukjin Kim <kgene@kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

On 1 February 2017 at 14:52, Thierry Reding <thierry.reding@gmail.com> wrot=
e:
> On Tue, Jan 31, 2017 at 02:54:53PM -0800, Eric Anholt wrote:
>> Thierry Reding <thierry.reding@gmail.com> writes:
>>
>> > [ Unknown signature status ]
>> > On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
>> >> Thierry Reding <thierry.reding@gmail.com> writes:
>> >>
>> >> > [ Unknown signature status ]
>> >> > On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
>> >> >> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
>> >> >> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
>> >> >> > >
>> >> >> > >
>> >> >> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun K=
won =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> >> >> > > > Dear Thierry,
>> >> >> > > >
>> >> >> > > > Could you please review this patch?
>> >> >> > >
>> >> >> > > Thierry, I think this patch has been reviewed enough but no co=
mment
>> >> >> > > from you. Seems you are busy. I will pick up this.
>> >> >> >
>> >> >> > Sorry, but that's not how it works. This patch has gone through =
8
>> >> >> > revisions within 4 weeks, and I tend to ignore patches like that=
 until
>> >> >> > the dust settles.
>> >> >> >
>> >> >>
>> >> >> Seems like the dust was pretty settled. It was posted on 1/11, pin=
ged on 1/24,
>> >> >> and picked up on 1/31. I don't think it's unreasonable to take it =
through
>> >> >> another tree after that.
>> >> >>
>> >> >> I wonder if drm_panel would benefit from the -misc group maintaine=
rship model
>> >> >> as drm_bridge does. By spreading out the workload, the high-mainte=
nance
>> >> >> patches would hopefully find someone to shepherd them through.
>> >> >
>> >> > Except that nobody except me really cares. If we let people take pa=
tches
>> >> > through separate trees or group-maintained trees they'll likely go =
in
>> >> > without too much thought. DRM panel is somewhat different from core=
 DRM
>> >> > in this regard because its infrastructure is minimal and there's li=
ttle
>> >> > outside the panel-simple driver. So we're still at a stage where we=
 need
>> >> > to fine-tune what drivers should look like and how we can improve.
>> >>
>> >> I would love to care and participate in review, but with the structur=
e
>> >> of your tree you're the only one whose review counts, so I don't
>> >> participate.
>> >
>> > Really? What exactly do you think is special about the structure of my
>> > tree? I require patches to be on dri-devel (I pick them up from the
>> > patchwork instance at freedesktop.org), the tree is publicly available
>> > and reviewed-by tags get picked up automatically by patchwork.
>> >
>> > The panel tree works exactly like any other maintainer tree. And my
>> > review is *not* the only one that counts. I appreciate every Reviewed-=
by
>> > tag I see on panel patches because it means that I don't have to look =
as
>> > closely as I have to otherwise.
>> >
>> > It is true that I am responsible for those patches, that's why I get t=
o
>> > have the final word on whether or not a patch gets applied. And that's
>> > no different from any other maintainer tree either.
>>
>> If me reviewing a patch isn't part of unblocking that patch getting in,
>> then I won't bother because all I could end up doing is punishing the
>> developer of the patch.  Contributors have a hard enough time already.
>
> Maybe you should go and read my previous reply again more carefully.
> Perhaps then you'll realize that reviews are in fact helping in getting
> patches merged.
>
> Interestingly my inbox doesn't show you ever bothering to review panel
> patches, so maybe you should be more careful about your assumptions.
>
Gents, it's understandable that emotions might be running high.

What's the point in pointing fingers at each other - there is enough
to go in each direction.
Let us all step back for a second and consider how we can make things bette=
r.

I think it'll be nice to have some/most of the common concerns that
Thierry/others comes across documented - in-kernel, blog post, other.
Such that one can reference to specific points as patch falls sub-par.
We all want to have a balance of nicely written driver and quick
merge.

Inki, I believe myself and others have invited you before on
#dri-devel. This is another medium where you can poke devs and from my
experience - it tends to be more efficient, most of the time.

Thanks
Emil
