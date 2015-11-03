From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Tue, 03 Nov 2015 14:24:14 +0100
Message-ID: <5638B57E.9070702@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25636 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752813AbbKCNY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 08:24:27 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX800ANVQKPP170@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Nov 2015 13:24:25 +0000 (GMT)
In-reply-to: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hi Inki,

On 11/03/2015 11:47 AM, Inki Dae wrote:
> This patch series adds pm runtime support for Exynos drm.
> 
> Originally, this patch was posted by Gustavo but there was no any
> answer about some comments. So I rebased this patch series on top of
> exynos-drm-next, removed unnecessary patches and modified wrong macro.

I have sent comment to original patchset[1], but for some strange reasons
it went only to mailing lists.
My concerns were as follows:
- exynos_drm has already pm_runtime support via exynos_drm_drv pm ops,
  why should we add per component support?
- component suspend sequence is non deterministic, but in case of
  video pipelines, specification often requires fixed order,
- the patchset adds implicit dependency on PM_SLEEP.


Current solution should work correctly and it was OK last time I have tested it.
I am not sure about atomic requirements, are there special ones?

There are other issues with current solution, rather easy to solve:
- it assumes that exynos-drm device will be suspended first - it should be true,
 as it is created at the end and suspend order is reverse to creation order, but
 I am not sure if we can rely on it - some solution is to add pm callbacks to
 all components, and from those callbacks call one centralized pm routine,
- suspend/resume callbacks theoretically can be called during component
  master initialization/deinitailization it could be racy,
- exynos_drm_sys_suspend/resume calls exynos_drm_suspend/resume
  for historical reasons, these function can be merged together.

[1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/48395

Regards
Andrzej

> 
> Changelog v2:
> - Remove patch 5 and 6.
>   . commit callback are already removed so isn't required anymore.
> - Remove patch 8 which makes dp clock enabled directly from FIMD.
>   . Really not mendatory for FIMD uses DP, and it could be different
>     according to Board.
> - Modified CONFIG_PM_SLEEP to CONFIG_PM.
>   . In case of runtime pm, CONFIG_PM macro should be used instead of
>     CONFIG_PM_SLEEP.
> 
> Gustavo Padovan (7):
>   drm/exynos: do not start enabling DP at bind() phase
>   drm/exynos: add pm_runtime to DP
>   drm/exynos: add pm_runtime to HDMI
>   drm/exynos: add pm_runtime to Mixer
>   drm/exynos: add pm_runtime to FIMD
>   drm/exynos: add pm_runtime to DECON 5433
>   drm/exynos: add pm_runtime to DECON 7
> 
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  54 ++++++---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 125 +++++++++----------
>  drivers/gpu/drm/exynos/exynos_dp_core.c       | 165 +++++++++++++++++++-------
>  drivers/gpu/drm/exynos/exynos_dp_core.h       |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  91 ++++++--------
>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 ++++++---
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++---------
>  7 files changed, 352 insertions(+), 265 deletions(-)
> 
