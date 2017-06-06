From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: exynos drm build failure due to cec_* symbols
Date: Tue, 6 Jun 2017 09:17:42 +0200
Message-ID: <50def393-6391-fd83-c782-a5e57a52af62@xs4all.nl>
References: <CGME20170602135819epcas1p2302294dec8c40b69a19e0b220806eacb@epcas1p2.samsung.com>
 <2d6226cf-4023-2a97-0791-42d3e8dcbdd3@suse.de> <5934B4FE.6060606@samsung.com>
 <20170605085907.GD4902@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:49130 "EHLO
        lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751117AbdFFHRs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 03:17:48 -0400
In-Reply-To: <20170605085907.GD4902@n2100.armlinux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On 05/06/17 10:59, Russell King - ARM Linux wrote:
> On Mon, Jun 05, 2017 at 10:33:50AM +0900, Inki Dae wrote:
>> 2017년 06월 02일 22:58에 Andreas Färber 이(가) 쓴 글:
>>> Hello,
>>>
>>> We're observing the following build failure with v4.12-rc3, latest
>>> linux.git and linux-next.git:
>>>
>>> [ 9825s]   LD      vmlinux.o
>>> [ 9904s]   MODPOST vmlinux.o
>>> [ 9915s] drivers/built-in.o: In function `hdmi_get_modes':
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:866:
>>> undefined reference to `cec_notifier_set_phys_addr_from_edid'
>>> [ 9915s] drivers/built-in.o: In function `hdmi_remove':
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:1923:
>>> undefined reference to `cec_notifier_set_phys_addr'
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:1927:
>>> undefined reference to `cec_notifier_put'
>>> [ 9915s] drivers/built-in.o: In function `hdmi_probe':
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:1889:
>>> undefined reference to `cec_notifier_get'
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:1904:
>>> undefined reference to `cec_notifier_put'
>>> [ 9915s] drivers/built-in.o: In function `hdmi_disable':
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:1509:
>>> undefined reference to `cec_notifier_set_phys_addr'
>>> [ 9915s] drivers/built-in.o: In function `hdmi_detect':
>>> [ 9915s]
>>> /home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/linux-obj/../drivers/gpu/drm/exynos/exynos_hdmi.c:827:
>>> undefined reference to `cec_notifier_set_phys_addr'
>>> [ 9931s] make[2]: ***
>>> [/home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.rc3.51.ga374846/linux-4.12-rc3-51-ga374846/Makefile:997:
>>> vmlinux] Error 1
>>> [ 9931s] make[1]: *** [Makefile:152: sub-make] Error 2
>>> [ 9931s] make: *** [Makefile:24: __sub-make] Error 2
>>>
>>> My guess is the symbols used by the exynos drm module are not exported:
>>>
>>> cec_notifier_set_phys_addr_from_edid
>>> cec_notifier_set_phys_addr
>>> cec_notifier_put
>>> cec_notifier_get
>>>
>>> Can you please look into fixing this?
>>
>> Thanks for reporting.
>>
>> Will check and fix it.
> 
> Please look at Hans' update to the way CEC's dependencies are handled.
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=drm-cec
> 
> These are apparently scheduled for -rc, but Mauro is busy.

They got merged in the media fixes tree, so with luck will appear in 4.12 soon.

Regards,

	Hans
