From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: drm/exynos: fimd: vrefresh is zero
Date: Thu, 05 May 2016 11:22:41 +0200
Message-ID: <572B10E1.4060704@samsung.com>
References: <5725259C.9020206@math.uni-bielefeld.de>
 <CADnq5_N_SnzU3Cpc9+w8FJXvmpa=oRKcwNzHrTQwY21ksCbh_A@mail.gmail.com>
 <5727648D.7050603@math.uni-bielefeld.de>
 <20160502202257.GW14148@phenom.ffwll.local>
 <5727B8E6.6050106@math.uni-bielefeld.de>
 <CAKMK7uGPx5Pdio2cr+zBTX1NrMr9+nk1MY7bJqziLGNvS93gwA@mail.gmail.com>
 <572B0E7C.6010408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45044 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756429AbcEEJW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 May 2016 05:22:57 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6P00N8D6263820@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 May 2016 10:22:54 +0100 (BST)
In-reply-to: <572B0E7C.6010408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On 05/05/2016 11:12 AM, Andrzej Hajda wrote:
> 
> Regarding the initial question, mode->vrefresh is set in
> drm_helper_probe_single_connector_modes. I guess division by zero could
> be caused by lack of clock in timings provided by dts timing node.
> As I remember in the past dts timings were passed without provided
> clock, in such case driver calculated mode->clock for some default value
> of vrefresh (60Hz for fimd if I remember correctly). Later validation
> code was added and the clock should be always provided.
> DTS files were updated after some time and the recalculation code was
> removed from fimd driver. So it is possible you are a victim of this change.

One more thing, I have looked at Exynos DTS files in mainline. In case
of exynos5*.dts files clock-frequency is set to 50000, it is of course
insanely low value and vrefresh calculated for such timings will be 0.
So please verify if clock-frequency is not too low in your case.

Regards
Andrzej

> 
> Regarding usage by drivers, from a quick look it seems to be used for
> something more than debugging by:
> - amdgpu,
> - exynos,
> - adv7511,
> - intel_dp(?),
> - mdp5_cmd_encoder(?),
> - nouveau,
> - omap(?),
> - tilcdc.
> 
> Regards
> Andrzej
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
