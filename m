From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/3] drm/exynos: Add device tree support for IPP driver
Date: Mon, 22 Apr 2013 17:23:41 +0200
Message-ID: <517555FD.7020909@samsung.com>
References: <1366192384-18829-1-git-send-email-s.nawrocki@samsung.com>
 <CAAQKjZOWQpNbEf+VA2oYCp1s3BG3zC7FVU9xj7zdKNQmJpGN8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38961 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753134Ab3DVPXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 11:23:45 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN000PVXEZWZB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 16:23:42 +0100 (BST)
In-reply-to: <CAAQKjZOWQpNbEf+VA2oYCp1s3BG3zC7FVU9xj7zdKNQmJpGN8w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

Hi Inki,

On 04/20/2013 06:11 PM, Inki Dae wrote:
> Hi Sylwester,
> 
> DRM FIMC driver could be more cleaned up with this patch series. And your third
> patch
> And just minor issue. The second patch has build warnings like below,
> 
> WARNING: static const char * array should probably be static const char * const
> #111: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:89:
> +static const char * fimc_clock_names[] = {
> 
> ERROR: "foo * bar" should be "foo *bar"
> #111: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:89:

Oops, sorry. I'll fix those for v3.

> This is a minor issue so I can fix them. And as you already know, now drm fimc
> driver should be more cleaned up. Your patch set looks good to me but I'd like
> to take more opinions from others.

Thanks,
Sylwester
