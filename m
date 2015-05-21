From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH v5 09/12] drm/exynos: remove exported functions from
 exynos_drm_plane
Date: Thu, 21 May 2015 12:33:57 -0300
Message-ID: <20150521153357.GB1641@joana>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
 <1432220576-18532-11-git-send-email-gustavo@padovan.org>
 <d7371b0c9e0e68b22cc66325d9b84625@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55664 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755910AbbEUPeF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 11:34:05 -0400
Content-Disposition: inline
In-Reply-To: <d7371b0c9e0e68b22cc66325d9b84625@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com

2015-05-21 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> Hi,
> 
> like I said before, this clashes with my commit 'drm/exynos: plane: honor
> buffer offset for dma_addr' (5d878bdb51bd7915ba3def8b531238c67624aa58),
> which is currently sitting in airlied's drm-fixes.

Inki has to merge his -fixes tree into exynos-drm-next to solve this.
It is the only way I can rebase on top of your commit and solve the
conflict.
Anyway, I just figured that exynos-drm-next was updated from yesterday
to today so this v5 doesn't apply on today's tree. I'll send a v6 once
Inki merges "drm/exynos: plane: honor buffer offset for dma_addr" into
exynos-drm-next.

Inki, can you please do that? so we can proceed with atomic and
hopefully have it ready for 4.2 merge window.

	Gustavo
