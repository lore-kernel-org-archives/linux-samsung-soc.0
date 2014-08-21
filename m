From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Thu, 21 Aug 2014 14:57:21 +0530
Message-ID: <CAEC9eQM7R6qy_cVnmFhRTQO+VPT1v25oXW+KSU84G7qGQe-wfw@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
	<20140422083311.GC17275@ulmo>
	<CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
	<20140422152657.GB30048@ulmo>
	<CACP_E+KntYzVDjZrXcByU2LrCtzDbwW79LpSAazjHzbYbQrpDQ@mail.gmail.com>
	<20140821073631.GH4486@ulmo>
	<CACP_E++72CuDCf1yOKk8b0O49mOd1YvBUUGKnD5zpJW6BT7QtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:49555 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753757AbaHUJ1V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Aug 2014 05:27:21 -0400
Received: by mail-ie0-f169.google.com with SMTP id rd18so4381664iec.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2014 02:27:21 -0700 (PDT)
In-Reply-To: <CACP_E++72CuDCf1yOKk8b0O49mOd1YvBUUGKnD5zpJW6BT7QtA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On Thu, Aug 21, 2014 at 1:55 PM, St=C3=A9phane Marchesin
<stephane.marchesin@gmail.com> wrote:
> On Thu, Aug 21, 2014 at 12:36 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>> On Tue, Aug 19, 2014 at 09:02:39PM -0700, St=C3=A9phane Marchesin wr=
ote:
>>> On Tue, Apr 22, 2014 at 8:26 AM, Thierry Reding
>>> <thierry.reding@gmail.com> wrote:
>>> > On Tue, Apr 22, 2014 at 08:33:23PM +0530, Ajay kumar wrote:
>>> >> Hi Thierry,
>>> >>
>>> >> On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
>>> >> <thierry.reding@gmail.com> wrote:
>>> >> > On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
>>> >> >> Register exynos_dp_panel before the list of exynos crtcs and
>>> >> >> connectors are probed.
>>> >> >>
>>> >> >> This is needed because exynos_dp_panel should be registered t=
o
>>> >> >> the drm_panel list via panel-exynos-dp probe, i.e much before
>>> >> >> exynos_dp_bind calls of_drm_find_panel().
>>> >> >>
>>> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>> >> >> ---
>>> >> >> Changes since V1:
>>> >> >>       Added platform_driver_unregister(&exynos_dp_panel_drive=
r) to
>>> >> >>       exynos_drm_platform_remove as per Jingoo Han's correcti=
on
>>> >> >>
>>> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++=
++
>>> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
>>> >> >>  2 files changed, 16 insertions(+)
>>> >> >>
>>> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/driver=
s/gpu/drm/exynos/exynos_drm_drv.c
>>> >> >> index 1d653f8..2db7f67 100644
>>> >> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> >> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> >> >> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(st=
ruct platform_device *pdev)
>>> >> >>               goto err_unregister_ipp_drv;
>>> >> >>  #endif
>>> >> >>
>>> >> >> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
>>> >> >> +     ret =3D platform_driver_register(&exynos_dp_panel_drive=
r);
>>> >> >> +     if (ret < 0)
>>> >> >> +             goto err_unregister_dp_panel;
>>> >> >> +#endif
>>> >> >
>>> >> > No, this is not how you're supposed to use DRM panel drivers. =
The idea
>>> >> > is that you write a standalone driver for a given panel.
>>> >> >
>>> >> > What you do here has a number of problems. For one it's a driv=
er that's
>>> >> > tightly coupled to Exynos SoCs. But if I have a different SoC =
that uses
>>> >> > the same panel I want to be able to use the same driver, and n=
ot have to
>>> >> > rewrite the driver for my SoC.
>>> >> >
>>> >> > Another problem is that you're assuming here that the driver i=
s built in
>>> >> > and it will break if you try to build either Exynos DRM or the=
 panel
>>> >> > driver as a module. This is perhaps nothing you care about rig=
ht now,
>>> >> > but eventually people will want to ship a single kernel that c=
an run on
>>> >> > a number of SoCs. But if we keep adding things like this, that=
 kernel
>>> >> > will keep growing in size until it no longer fits in any kind =
of memory.
>>> >> >
>>> >> > Thierry
>>> >>
>>> >> I completely agree with you in this!
>>> >>
>>> >> Yes, this is not acceptable, but I want to know an "acceptable"
>>> >> workaround for the situation below:
>>> >> I register the driver using module_init().
>>> >> And, exynos_drm gets probed much before the panel driver probe h=
appens.
>>> >> So, the panel driver hasn't probed yet, but exynos_dp via exynos=
_drm
>>> >> tries to call
>>> >> "of_drm_find_panel" which always returns NULL.
>>> >
>>> > That's a situation that your driver needs to be able to deal with=
=2E The
>>> > driver registration order doesn't matter one bit. It may happen t=
o work
>>> > most of the time, but as soon as one of the resources that your p=
anel
>>> > driver needs isn't there when the panel is probed, then it won't =
be
>>> > registered and of_drm_find_panel() will still return NULL.
>>> >
>>> > Usually the right thing to do in that case would be to return (an=
d
>>> > propagate) -EPROBE_DEFER so that your driver's probe is deferred =
and
>>> > retried when other drivers have been probed. That way it should
>>> > eventually get a non-NULL panel.
>>>
>>> So I just gave this (drm_panel + probe deferring) a shot on exynos,
>>> and correctly reacting to -EPROBE_DEFER postpones DP initialization=
 by
>>> approximately 1.5 second. Is there a good way to handle that? As it
>>> stands, this isn't usable.
>>
>> How much is 1.5 seconds compared to the overall boot time of the dev=
ice?
>
> 1.5s is 15-20% of my boot time (if you count the boot time from
> firmware start to login prompt, otherwise it's more). Note that on
> other platforms, we've seen this take as much as 5 or 6s, but for the
> exynos case it is "only" 1.5s.
>
>> What exactly is causing this 1.5 second delay?
>
> A regulator isn't ready, and then drm_panel returns defer. Then the
> whole drm driver init is deferred.
>
>>
>> This really is a fundamental issue with deferred probing and the iss=
ue
>> has come up several times in the past. A couple of possible solution=
s
>> have been proposed, with the latest being here[0] I think. That ende=
d in
>> a bit of a debacle, unfortunately, but on of the outcomes was that a=
 lot
>> of the ordering problems could be fixed by using phandle references =
to
>> track dependencies. I'm not aware of anyone working on that right no=
w,
>> presumably because everyone is busy getting features merged rather t=
han
>> optimizing boot speed.
>
> Yes, I don't believe boot time ordering will ever happen upstream, bu=
t
> then the current implementation with EPROBE_DEFER isn't usable either=
=2E
> Any ideas? ATM it seems like the only way out is to just write my
> own dt format for the panel and ignore drm_panel.
Something like this:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chrom=
eos-3.8/drivers/gpu/drm/exynos/exynos_dp_core.c

With this way also, we would expect the regulator to come up early(befo=
re drm).

Ajay
