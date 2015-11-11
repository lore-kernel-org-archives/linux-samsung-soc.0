From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing) subsystem
Date: Wed, 11 Nov 2015 22:30:50 +0000
Message-ID: <CACvgo50ZoZ-uM4JMvn+1GY=E08_CNZpV0tDfE33L54_hqGVqXw@mail.gmail.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34064 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753043AbbKKWau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2015 17:30:50 -0500
Received: by ioir85 with SMTP id r85so7187432ioi.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2015 14:30:50 -0800 (PST)
In-Reply-To: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello Marek,

On 10 November 2015 at 13:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Dear All,
>
> This patch series introduces a new life into Exynos IPP (Image Post
> Processing) subsystem by integrating it (transparently for userspace
> applications) with Exynos DRM core plane management. This means that all
> CRTC drivers transparently get support for standard features of IPP
> subsystem like rotation and scaling.
>
> Support for features not supported natively by CRTC drivers is
> implemented with a help of temporary framebuffers, where image data is
> processed by IPP subsystem before performing the scanout by a CRTC driver.
>
> This patchset is a first version of this 'new feature' and I would like
> get some comments on the proposed approach. I plan to continue working
> on enhancing Exynos DRM drivers and especially do the cleanup the IPP
> subsystem.
>
> Most of the new features are added by the last 2 patches. All other
> patches are bugfixes in various Exynos DRM subdrivers and significant
> core rewrite - introducing a subclass of drm_plane_state was needed and
> all drivers have been converted to use it. Some initial cleanups in IPP
> subsystem were also needed to let Exynos core to call it internally from
> the driver core. This part will be cleaned even more in the future.
>
>
> My solution has been tested on Exynos4412-based Odroid U3 and
> Exynos5420-based Odroid XU3. To check rotation, cropping and scaling
> I've developed a simple test application, which use atomic mode
> setting/page flipping API. You can download it here:
>
> https://git.linaro.org/?p=people/marek.szyprowski/atomictest.git
>
Can I interest you in up-streaming this code into place such as libdrm
? This way other developers can benefit from your tool.

Admittedly I've not looked at the tool but it seems to me that it
duplicates some of the functionality we already in modetest (+atomic).
The latter of which send by your colleague Hyungwon Hwang [1] (and I
seemingly forgot do a final review/push). If you can share a few
cycles worth of review and/or importing your app.

Thanks
Emil

[1] http://lists.freedesktop.org/archives/dri-devel/2015-September/090748.html
