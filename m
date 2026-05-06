Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D712B94
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049335; cv=none; b=IQi+OGJ5gzDQ5Dom5tedAEmJmaFvIIrQ7uErdzOrkBr0z+LsPODcfe3OIs8YnR5Qecx0aLtxomryNr258c7ybmcjOvnvOV6gSKFfgYe2t5r9PDtQCB6aMi0iEBiCmfT+FG6so/gdgH2uUIFA1FR2eSUWa+kR2Yp1RrPEpD9kPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049335; c=relaxed/simple;
	bh=PvWvtMNWchCwwWtP5r6JLFvbcxZpGuZvgCjoTHDmIac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=JQGOPQQd63TO0+KKGVCGlXvvAXPJ9mHj0XSptNB/mpQk1lJrppZJD+3GC68Um32Pg55wN3uY9kBNZuM58iua7VrWh9/EMdeNtTe9+znv1mx5BM4sGE/T6bG1B6deDoy+Uxl9lfLcPCXS5Lpwin/R9nCIXAGJrm0i+yVcP10/HUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jxDoomzg; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jxDoomzg"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260506063525euoutp02a171970959a92f19819f8d2f74204157~s5nDbmdpY1483514835euoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:35:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260506063525euoutp02a171970959a92f19819f8d2f74204157~s5nDbmdpY1483514835euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778049325;
	bh=Uj+QchjM1TjaqqN5H20BKQY/O8GeHx9yl6VKOOJcP5Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jxDoomzgWnwlDvZ9xVJImT5gCkCKA/ASI4o2s+9y+hPBQdbcN9fOfescQKJ8Dntmu
	 i4+bxXm80oDwkjVFGT1m4nHv4s7T5xvAgsKYCTR/BrCWewYsdwyxxia/HQa3z6setC
	 Vu+k9V1oKUYuvFGNKd1gr76Eyd2qa+F+3aVSVN90=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063524eucas1p2e642628db1f6ac58096790da6f502e48~s5nDJldkh1757617576eucas1p29;
	Wed,  6 May 2026 06:35:24 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063523eusmtip246f21b2b475e3cbfa4443ee0d0673545~s5nCKdIkG2580125801eusmtip2I;
	Wed,  6 May 2026 06:35:23 +0000 (GMT)
Message-ID: <b9765ddd-bb8a-458f-85d4-159d3cc5fe5b@samsung.com>
Date: Wed, 6 May 2026 08:35:23 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/5] drm/exynos: fbdev: Use client buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260423094452.32665-1-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260506063524eucas1p2e642628db1f6ac58096790da6f502e48
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260423095139eucas1p149a0e97f62e8bf353a65466ca26cbff9
X-EPHeader: CA
X-CMS-RootMailID: 20260423095139eucas1p149a0e97f62e8bf353a65466ca26cbff9
References: <CGME20260423095139eucas1p149a0e97f62e8bf353a65466ca26cbff9@eucas1p1.samsung.com>
	<20260423094452.32665-1-tzimmermann@suse.de>


On 23.04.2026 11:37, Thomas Zimmermann wrote:
> A client buffer holds the DRM framebuffer for an in-kernel DRM
> client. Until now, exynos created an internal ad-hoc framebuffer for
> its fbdev emulation, while by-passing the regular interfaces used by
> user-space compositors.
>
> Convert exynos' fbdev emulation to use client buffers. Replacing the
> existing code with a client buffer allows for stream-lining exynos code
> and later also the fbdev helpers. The new framebuffer will be registered
> against the client's file and will support handles for GEM objects. It
> is then just another framebuffer within the DRM ecosystem.
>
> If all driver's fbdev-emulation helpers can be converted to use client
> buffers, the emulation's framebuffer handling as a whole can possibly be
> moved into shared helpers.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Patch 1 first fixes a long-standing bug.
>
> Patches 2 to 4 convert exynos' fbdev emulation to client buffers. It
> still allocates a GEM object buffer tailored towards fbdev emulation,
> but size calculations now use common DRM helpers.
>
> Patch 5 cleans up symbol visibility in exynos' fb code.
>
> Thomas Zimmermann (5):
>   drm/exynos: fbdev: Remove offset into screen_buffer
>   drm/exynos: fbdev: Inline exynos_drm_fbdev_update()
>   drm/exynos: fbdev: Calculate buffer geometry with format helpers
>   drm/exynos: fbdev: Use a DRM client buffer
>   drm/exynos: Make exynos_drm_framebuffer_init() an internal interface
>
>  drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fb.h    |   7 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 100 ++++++++++------------
>  3 files changed, 47 insertions(+), 62 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

