From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v3] drm/exynos: fix kernel panic issue at drm releasing
Date: Mon, 11 Jan 2016 19:00:04 +0000
Message-ID: <CAPj87rPkwRBKM8mUt2zS-Mr7bZNMqD1PGy01-BUES_84sJqCUw@mail.gmail.com>
References: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
	<1452242760-20298-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36487 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933424AbcAKTAG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 14:00:06 -0500
Received: by mail-wm0-f42.google.com with SMTP id l65so223643173wmf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2016 11:00:05 -0800 (PST)
In-Reply-To: <1452242760-20298-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Inki,

On 8 January 2016 at 08:46, Inki Dae <inki.dae@samsung.com> wrote:
> Changelog v3:
> - initialize only device specific things. Each page flip event object
>   is created by DRM core so DRM core should release the object including
>   incrementing event space.

I'm a bit confused here; we no longer call event->base.destroy(),
because you say that the DRM core should release it. But how does the
DRM core know to release the event? From the core point of view, the
event disappears into the driver, and it is no longer tracked.

As Daniel says though, later versions handle all this in the core in a
much more clean way, so we can remove these from the drivers then.

Cheers,
Daniel
