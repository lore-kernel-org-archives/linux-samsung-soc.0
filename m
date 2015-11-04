From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Wed, 04 Nov 2015 08:24:30 +0100
Message-ID: <5639B2AE.6020601@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <5638B57E.9070702@samsung.com>
 <CAAQKjZOUBE5Grz=pPtwx9oF19-yoRX-UFtv9C+GxQgNy_sSRag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43285 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbbKDHYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2015 02:24:44 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXA000ZC4L52N60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Nov 2015 07:24:41 +0000 (GMT)
In-reply-to: <CAAQKjZOUBE5Grz=pPtwx9oF19-yoRX-UFtv9C+GxQgNy_sSRag@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 11/03/2015 04:38 PM, Inki Dae wrote:
>  
> 2015-11-03 22:24 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com
> <mailto:a.hajda@samsung.com>>:
> > Hi Inki,
> >
> > On 11/03/2015 11:47 AM, Inki Dae wrote:
> >> This patch series adds pm runtime support for Exynos drm.
> >>
> >> Originally, this patch was posted by Gustavo but there was no any
> >> answer about some comments. So I rebased this patch series on top of
> >> exynos-drm-next, removed unnecessary patches and modified wrong macro.
> >
> > I have sent comment to original patchset[1], but for some strange reasons
> > it went only to mailing lists.
> > My concerns were as follows:
> > - exynos_drm has already pm_runtime support via exynos_drm_drv pm ops,
> >   why should we add per component support?
>  
> For this, I think I already mentioned enough,
>         http://www.spinics.net/lists/linux-samsung-soc/msg47695.html
>
> In brief, exynos_drm_drv doesn't control each power domain of each kms device.
> It means that we cannot power off fully without pm runtime interface of each
> kms device - just they can only control their clock not power domain. So
> question. How we could control power domain of each kms device without runtime
> pm interface?

Hmm, but to enable pm_runtime in components it is enough to use
pm_runtime_enable/disable and pm_runtime_get/put(_sync), there is no need to add
pm callbacks.
In fact most of the components already supports runtime pm,  but quick grep
shows that it is not implemented in:
exynos_drm_dsi.c, exynos_dp_core.c, exynos_drm_mic.c.
So I guess adding pm_runtime support by adding calls pm_runtime_enable/disable
and pm_runtime_get/put(_sync) in appropriate places should be enough.

>
> > - component suspend sequence is non deterministic, but in case of
> >   video pipelines, specification often requires fixed order,
>
> Can your show me an example? I think component suspend and resume are invoked
> by only drm dpms interface, and the dpms interface has a fixed order - when
> dpms goes to off, encoder first, and when dpms goes to on, crtc first.

Now as I understand you do not want to remove exynos_drm_drv pm callbacks so
they will disable devices properly, after that clock disabling order should not
matter, so the whole point is not valid.

>
> My only concern is that runtime pm interface of each kms driver is called
> within pm sleep context of Exynos drm driver. So I will look into this no problem.
>
> > - the patchset adds implicit dependency on PM_SLEEP.
> >
> >
> > Current solution should work correctly and it was OK last time I have tested it.
> > I am not sure about atomic requirements, are there special ones?
>
> Not related to atomic feature.
>
> >
> > There are other issues with current solution, rather easy to solve:
> > - it assumes that exynos-drm device will be suspended first - it should be true,
> >  as it is created at the end and suspend order is reverse to creation order, but
> >  I am not sure if we can rely on it - some solution is to add pm callbacks to
> >  all components, and from those callbacks call one centralized pm routine,
>
> You mean pm callbacks are pm sleep interface? And you mean let's add sleep pm
> interface to each kms driver?  If so, I'm not agree with you because sleep pm
> should be controlled by only drm top like single driver does.

Lets look at an example:
Assume we have present only fimd and dsi components.
In such case kernel creates two platform devices for fimd and dsi in early stage
of parsing device tree blob.
During exynos_drm_drv initialization exynos-drm platform device is created, the
important thing it is created after fimd and dsi.
Now when platform enters sleep mode suspend callbacks are called, the important
thing here is
in which order. If I remember correctly PM guarantees only that children will be
handled before parents.
Since we have no parent-child relation between exynos-drm, fimd and dsi, the
order is unknown.
So it will be possible that component will enter sleep mode before exynos-drm
and in such case system can even
hang if exynos-drm callbacks will try to access registers of such component.
Fortunately in current implementation of PM order of suspending is reversed
order of device creation, so
it will be always exynos-drm first.

So in short we rely here on implementation detail of PM framework.

>
> > - suspend/resume callbacks theoretically can be called during component
> >   master initialization/deinitailization it could be racy,
>
> I'm not sure what you mean but component master
> initialization/deinitailization mean bind and unbind? If so, bind/unbind
> interfaces of all components will never call pm relevant interfaces but the
> the pm relevant interfaces are called by only dpms interface.

exynos_drm_sys_suspend and exynos_drm_sys_resume takes pointer
to drm_device and uses it. It is possible that in the same time drm_driver
is destroyed for some reason it will result in invalid pointer in resume/suspend
callbacks.

The problem is common for componentized drivers and was already reported [1],
but there
is no general solution for it. On the other side probability it will ever happen
seems to be very low.

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/115820

>
> > - exynos_drm_sys_suspend/resume calls exynos_drm_suspend/resume
> >   for historical reasons, these function can be merged together.
>
> Also can you show me more detail?

This is quite simple, I will post patch for it.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
> >
> > [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/48395
> >
> > Regards
> > Andrzej
> >
> >>
> >> Changelog v2:
> >> - Remove patch 5 and 6.
> >>   . commit callback are already removed so isn't required anymore.
> >> - Remove patch 8 which makes dp clock enabled directly from FIMD.
> >>   . Really not mendatory for FIMD uses DP, and it could be different
> >>     according to Board.
> >> - Modified CONFIG_PM_SLEEP to CONFIG_PM.
> >>   . In case of runtime pm, CONFIG_PM macro should be used instead of
> >>     CONFIG_PM_SLEEP.
> >>
> >> Gustavo Padovan (7):
> >>   drm/exynos: do not start enabling DP at bind() phase
> >>   drm/exynos: add pm_runtime to DP
> >>   drm/exynos: add pm_runtime to HDMI
> >>   drm/exynos: add pm_runtime to Mixer
> >>   drm/exynos: add pm_runtime to FIMD
> >>   drm/exynos: add pm_runtime to DECON 5433
> >>   drm/exynos: add pm_runtime to DECON 7
> >>
> >>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  54 ++++++---
> >>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 125 +++++++++----------
> >>  drivers/gpu/drm/exynos/exynos_dp_core.c       | 165 +++++++++++++++++++-------
> >>  drivers/gpu/drm/exynos/exynos_dp_core.h       |   1 +
> >>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  91 ++++++--------
> >>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 ++++++---
> >>  drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++---------
> >>  7 files changed, 352 insertions(+), 265 deletions(-)
> >>
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop.org>
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
>  
>  
