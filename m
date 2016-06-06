From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix trigger mode change regression
Date: Mon, 06 Jun 2016 17:45:56 +0100
Message-ID: <2934a74a530dbc5ad3d85065eaed4887@www.loen.fr>
References: <1464760434-16709-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:36709 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752122AbcFFR3X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 13:29:23 -0400
In-Reply-To: <1464760434-16709-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 2016-06-01 06:53, Inki Dae wrote:
> This patch fixes a regression that Display panel doesn't work
> since HW trigger mode was supported.
>
> The trigger mode should be changed on PSR(Panel Self Refresh)
> mode of Panel device according to HW guy's saying. However,
> with previous HW trigger support, trigger mode could been changed
> in normal mode of Panel device.
>
> So this patch makes sure to change the trigger mode after power off
> and on again. Later we need to add PSR relevant codes instead.

I'm afraid this patch doesn't fix the regression I'm seeing on my 
Exynos5250 Chromebook.

I found out that using the 4.6 device tree allows the display to 
function correctly (at least for a while), just enough to see it dying 
before reaching userspace (and it scrolls up way to quickly for me to 
read it). Adding printk_delay results in a hanging system.

Can someone with a servo-board investigate this? I'll try to bisect it 
further, but an actual backtrace would help.

Thanks,

         M.
-- 
Fast, cheap, reliable. Pick two.
