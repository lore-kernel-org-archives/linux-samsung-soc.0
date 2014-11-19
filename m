From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip support
Date: Wed, 19 Nov 2014 11:19:33 -0800
Message-ID: <7hwq6ruhfe.fsf@deeprootsystems.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
	<CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
	<546C646C.4060303@collabora.co.uk>
	<20141119105527.GA5396@luxor.wired.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:41336 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755100AbaKSTTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 14:19:36 -0500
Received: by mail-pa0-f52.google.com with SMTP id eu11so832671pac.39
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 11:19:36 -0800 (PST)
In-Reply-To: <20141119105527.GA5396@luxor.wired.org> (Paolo Pisati's message
	of "Wed, 19 Nov 2014 11:55:27 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, gustavo Padovan <gustavo.padovan@collabora.co.uk>

Paolo Pisati <p.pisati@gmail.com> writes:

> On Wed, Nov 19, 2014 at 10:35:40AM +0100, Javier Martinez Canillas wrote:
>> Hello Ajay,
>> 
>> On 11/18/2014 07:20 AM, Ajay kumar wrote:
>> > On Sat, Nov 15, 2014 at 3:24 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>> >> This series is based on master branch of Linus tree at:
>> >> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> 
>> I applied your series on top of 3.18-rc5 + linux-next's commit:
>> 
>> 0ef76ae ("ARM: exynos_defconfig: Enable options for display panel support").
>> 
>> I think you should had mentioned what other patches are needed as a
>> dependency since I spent quite a bit of time figuring out why the
>> ps8622 bridge driver probe was always deferred due of_drm_find_panel()
>> failing and then I noticed that a patch from linux-next was needed:
>> 
>> e35e305 ("drm/panel: simple: Add AUO B116XW03 panel support")
>> 
>> With that commit the ps8622 drm bridge driver probe succeed but I still
>> don't have display working on an Exynos5240 Peach Pit, the kernel log shows:
>> 
>> platform 145b0000.dp-controller: Driver exynos-dp requests probe deferral
>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>> exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops exynos_dp_ops): -517
>> exynos-drm exynos-drm: master bind failed: -517
>> platform 145b0000.dp-controller: Driver exynos-dp requests probe deferral
>
> do you have this in your dmesg?
>
> ...
> exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap
> ...
>
> to get a working framebuffer out of linus 318rc4 on my peach pi, i had
> to cherry pick these 3 patches:
>
> arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> drm/exynos: dp: Remove support for unused dptx-phy

Excellent, thank you for pointing these out.  I've been struggling to
get the display working on v3.18-rc and had missed these.

> ARM: exynos_defconfig: Enable options for display panel support
>
> Check if you have those.

With the 3 patches you mention, the display is working on my peach-pi as
well.

Thanks,

Kevin
