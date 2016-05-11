From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/4] drm/exynos: use generic code for managing zpos plane
 property
Date: Wed, 11 May 2016 14:52:56 +0200
Message-ID: <57332B28.3000904@samsung.com>
References: <1462969881-2447-1-git-send-email-benjamin.gaignard@linaro.org>
 <1462969881-2447-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35417 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932103AbcEKMxB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:53:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7000EAKJSAJ870@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 May 2016 13:52:58 +0100 (BST)
In-reply-to: <1462969881-2447-3-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, vincent.abriou@st.com, fabien.dessenne@st.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On 05/11/2016 02:31 PM, Benjamin Gaignard wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This patch replaces zpos property handling custom code in Exynos DRM
> driver with calls to generic DRM code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Your signed-off-by is missing.

Best regards,
Krzysztof
