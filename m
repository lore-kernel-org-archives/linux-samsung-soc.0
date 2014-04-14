From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device init/deinit
Date: Mon, 14 Apr 2014 10:54:42 +0200
Message-ID: <534BA252.7060208@samsung.com>
References: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
 <CAAQKjZMz56YjHtjBrEwOkxbyvdp1t9o9rCU9cFiR7GZOXVsKCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53098 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbaDNIy4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 04:54:56 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N40005OWJFFID90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Apr 2014 09:54:51 +0100 (BST)
In-reply-to: <CAAQKjZMz56YjHtjBrEwOkxbyvdp1t9o9rCU9cFiR7GZOXVsKCw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 04/12/2014 04:18 PM, Inki Dae wrote:
> Hi Andrzej,
>
> Thanks for your contributions.
>
> 2014-04-11 23:11 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> Hi Inki,
>>
>> This patchset refactors drm device initialization. Details are described
>> in respective patches. It is an alternative to DT supernode concept.
>>
>> The first patch uses linker sections to get rid of ifdef macros, it is not
> That's a good idea. :) We could avoid ugly #ifdef ~ #endif with this way.
>
>> essential for 2nd patch but it makes code more readable. Similar approach
>> is used by irqchip, clks and clk_sources.
> But 2nd patch doesn't seem reasnoable to me. Your approach is same as
> existing one conceptually. I think we need to handle drm driver in a
> different way from irqchip, clks and clk_sources.
>
> DRM driver means one integrated graphics card but in most embedded
> systems, graphics and display relevant devices have separated hardware
> resources. So we would need abstractional integrated hardware,
> display-subsystem, super device. That is why I are trying to use super
> device approach, and conceptually it would be right solution. It
> wouldn't be not good to combine those separated hardware somehow using
> specific codes.

Conceptually both approaches are the same: we have number of devices
which should be ready before we can start super-device and if any device
is to be removed super-device should be removed before.
The difference is in 'details':
- super-node approach have list of components provided explicitly in DT
special node,
- in this approach list of components is constructed from devices
present in the
system.

Creating special DT node with information which is available anyway seems
to be redundant and against DT rules.

Regarding the old approach, I would not compare it with the current ones
as it has two main flaws:
- it is not aware of deferred probing, or more precisely it assumes that
driver registration
instantly triggers device probing (it happens to be true) and no probe
of drm component
will happen later (and this is false assumption, eg. deferred probe),
- it do not remove super-device in case of removal of any of components.

Regards
Andrzej

>
> I have updated and tested super device approach with existing dt
> support so there wouldn't be any dt broken issue. I will post next
> version of this patch series soon, maybe tomorrow or the day after
> tomorrow.
>
> Thanks,
> Inki Dae
>
>> The patchset is based on exynos-drm-next branch.
>>
>> Regards
>> Andrzej
>>
>>
>> Andrzej Hajda (2):
>>   drm/exynos: refactor drm drivers registration code
>>   drm/exynos: initialize drm master only when all exynos drm devices are
>>     ready
>>
>>  drivers/gpu/drm/exynos/Makefile             |   2 +
>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  37 ++--
>>  drivers/gpu/drm/exynos/exynos_drm.lds.S     |   9 +
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c     | 279 +++++++++++++---------------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  20 +-
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  42 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  35 ++--
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  38 ++--
>>  drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  17 +-
>>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  30 +--
>>  drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  18 +-
>>  drivers/gpu/drm/exynos/exynos_drm_rotator.c |  27 ++-
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  18 +-
>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  53 ++++--
>>  drivers/gpu/drm/exynos/exynos_mixer.c       |  14 +-
>>  15 files changed, 360 insertions(+), 279 deletions(-)
>>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm.lds.S
>>
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
