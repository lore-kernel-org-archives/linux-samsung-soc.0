Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927540E8C8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823404; cv=none; b=iNy0iHjd8u18KzBm5+HBTl83tLAI1O/YZdFHrf5mbbD+iKX1UST0V+gCoV3C+JevYiNIbGnK7G+r6fb+i0aXEgwmKS9KWR9zvoriqmLKPQwOidQVBQk6s6MsGVD/sqF4PMhcWWAgvdbLLfp05day0jDxtlhNdtP2pAvFHfWg3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823404; c=relaxed/simple;
	bh=4w4cGdT+RgHR/aDEKh+OBCsIxDXLoDWnQ6lNHnaoXiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpDeJHUaMtgtPfRjIwob6/grCHNwIUOwjTvWUPPXKT3GvXsyFmyf+bVGItBdufeXcpqg+KDIt4fuAurEtq8hHjDvtZ27dy3LOOGFsSMgZpXcoKF3mcZATxQPoybICgelvMBm0GDJFAAHPZWW1kb+8ZOcSqqVMtAdPtkB0r+t0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=F8Rw5xWG; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="F8Rw5xWG"
Date: Tue, 30 Jun 2026 14:43:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1782823390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nex/RRO5Ai+er398OAIER7iHNhBcGonnMTqkZOJ75Og=;
	b=F8Rw5xWGpw+DYic48f1q6n6F1n1XyMtM7m+pEBMShkzn1hWP5BCD5kXeD8TOyNkSZ1VCiC
	Zyjb/gV2vWGvaRiTXSE42kC/GVe/Ctm1A9s9qxOA5ft2zBF8DEBKjhXmun8ZLJGiZgk3Ij
	b+tvD/i6cV3rJTSZCEn3wTxMb1GR+yk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] drm/bridge: sii9234: use extcon to detect
 cable attachment
Message-ID: <20260630124301.GA4736@localhost>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
X-Migadu-Flow: FLOW_OUT

Hello,

Friendly ping! This series has been reviewed/tested and still applies
cleanly on drm-misc-next, could it be merged?

Best regards,
Henrik Grimler

On Tue, Jun 02, 2026 at 08:36:47PM +0200, Henrik Grimler wrote:
> Hi,
> 
> This series fixes so HDMI through the sii9234 MHL chip works when
> cable is hotplugged, by making the MHL chip use extcon cable detection
> functions. Patch 3, that actually implements the extcon parts, is heavily
> inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
> cable detection logic to detect MHL") by Maciej Purski.
> 
> Before these changes, HDMI only worked if cable was plugged in before
> booting. If no cable was connected, then wlr-randr still showed HDMI
> as connected, with 0x0 px, which confused at least some UIs (phosh)
> and caused problems:
> https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828
> 
> Tested on exynos4412-i9305.
> 
> Best regards,
> Henrik Grimler
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> Changes in v4:
> - Collect tags
> - Link to v3: https://lore.kernel.org/r/20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se
> 
> Changes in v3:
> - Fix return of dev_err_probe in patch 2 and patch 3, spotted by
>   Dmitry and Marek respectively.
> - Change to depends on EXTCON || !EXTCON instead of select
> - Collect tags for patch 1 (not 3 since there were (minor) changes)
> - Link to v2: https://lore.kernel.org/r/20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se
> 
> Changes in v2:
> - Add dependency on extcon in patch 3. Issue reported by kernel test robot <lkp@intel.com>
> - Link to v1: https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se
> 
> ---
> Henrik Grimler (3):
>       drm/bridge: sii9234: fix some typos in comments and messages
>       drm/bridge: sii9234: use dev_err_probe where applicable
>       drm/bridge: sii9234: use extcon cable detection logic to detect MHL
> 
>  drivers/gpu/drm/bridge/Kconfig   |   1 +
>  drivers/gpu/drm/bridge/sii9234.c | 124 +++++++++++++++++++++++++++++++--------
>  2 files changed, 102 insertions(+), 23 deletions(-)
> ---
> base-commit: a87fef0880c4f52769b5a3c2fc1b2d73aaa04eb3
> change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5
> 
> Best regards,
> -- 
> Henrik Grimler <henrik@grimler.se>
> 
