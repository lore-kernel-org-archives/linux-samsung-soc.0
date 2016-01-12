From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v3] drm/exynos: fix kernel panic issue at drm releasing
Date: Tue, 12 Jan 2016 09:55:48 +0000
Message-ID: <CAPj87rN1sjGZgZFkUVt_2AydQytQbXzvfMzeJ6sfDPsSN4+baA@mail.gmail.com>
References: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
	<1452242760-20298-2-git-send-email-inki.dae@samsung.com>
	<CAPj87rPkwRBKM8mUt2zS-Mr7bZNMqD1PGy01-BUES_84sJqCUw@mail.gmail.com>
	<56949C5E.1000902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38191 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932987AbcALJzt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2016 04:55:49 -0500
Received: by mail-wm0-f41.google.com with SMTP id b14so310743901wmb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jan 2016 01:55:48 -0800 (PST)
In-Reply-To: <56949C5E.1000902@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Inki,

On 12 January 2016 at 06:25, Inki Dae <inki.dae@samsung.com> wrote:
> 2016=EB=85=84 01=EC=9B=94 12=EC=9D=BC 04:00=EC=97=90 Daniel Stone =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> On 8 January 2016 at 08:46, Inki Dae <inki.dae@samsung.com> wrote:
>>> Changelog v3:
>>> - initialize only device specific things. Each page flip event obje=
ct
>>>   is created by DRM core so DRM core should release the object incl=
uding
>>>   incrementing event space.
>>
>> I'm a bit confused here; we no longer call event->base.destroy(),
>> because you say that the DRM core should release it. But how does th=
e
>> DRM core know to release the event? From the core point of view, the
>> event disappears into the driver, and it is no longer tracked.
>
> DRM core would need something to track the events. I think basically,=
 someone who created one object should also destroy the object.

You're right, but this doesn't exist until Daniel Vetter's rather
larger patchset which is still pending merge.

>> As Daniel says though, later versions handle all this in the core in=
 a
>> much more clean way, so we can remove these from the drivers then.
>
> So I think it's not reasonable for specific driver to destroy the obj=
ect created by core although there is a memory leak. However, the memor=
y leak would be more critical than temporary codes.
> Ok, I will merge this patch with more comments which will say the obj=
ect will be destroyed by core part later.

Also, by stealing the event out of crtc_state->event and moving it to
exynos_crtc->event, you can argue that we have quite explictly removed
the responsibility from the core. ;)

Thanks for handling this!

Cheers,
Daniel
