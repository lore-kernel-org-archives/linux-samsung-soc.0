From: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC 0/2] New feature: Framebuffer processors
Date: Tue, 23 Aug 2016 06:05:05 +1000
Message-ID: <CAPM=9tz_Y9vzWcm9=oYpHPiACJbz-MyyqsfbayzdsuFykt06+g@mail.gmail.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:33160 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbcHVUFG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 16:05:06 -0400
Received: by mail-ua0-f195.google.com with SMTP id u13so11729109uau.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2016 13:05:06 -0700 (PDT)
In-Reply-To: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On 22 August 2016 at 19:44, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Dear all,
>
> This is the initial proposal for extending DRM API with generic support for
> hardware modules, which can be used for processing image data from the one
> memory buffer to another. Typical memory-to-memory operations are:
> rotation, scaling, colour space conversion or mix of them. In this proposal
> I named such hardware modules a framebuffer processors.
>
> Embedded SoCs are known to have a number of hardware blocks, which perform
> such operations. They can be used in paralel to the main GPU module to
> offload CPU from processing grapics or video data. One of example use of
> such modules is implementing video overlay, which usually requires color
> space conversion from NV12 (or similar) to RGB32 color space and scaling to
> target window size.
>
> Till now there was no generic, hardware independent API for performing such
> operations. Exynos DRM driver has its own custom extension called IPP
> (Image Post Processing), but frankly speaking, it is over-engineered and not
> really used in open-source. I didn't indentify similar API in other DRM
> drivers, besides those which expose complete support for the whole GPU.

So I'm with the others in that it's a road we've travelled and learned from,
generic accel API don't work very well long term.

What will happen is the next generation exynos will have a command queue
for it's dma engine or whatever and someone will shoehorn that into this API
because this API exists, even if it isn't suitable.

What are the requirements for having this API, what userspace feature is driving
it, compositors?, toolkit rendering?

Dave.
