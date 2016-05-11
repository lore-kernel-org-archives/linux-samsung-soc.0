From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/4] drm/exynos: use generic code for managing zpos plane
 property
Date: Wed, 11 May 2016 13:54:39 +0200
Message-ID: <57331D7F.5080000@samsung.com>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
 <1462962308-13410-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28089 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbcEKLyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 07:54:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7000CVDH35NL40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 May 2016 12:54:41 +0100 (BST)
In-reply-to: <1462962308-13410-3-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, vincent.abriou@st.com, fabien.dessenne@st.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On 05/11/2016 12:25 PM, Benjamin Gaignard wrote:
> This patch replaces zpos property handling custom code in Exynos DRM
> driver with calls to generic DRM code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Ekhm? From=Benjamin, SoB=Marek... why did you change the author?

Best regards,
Krzysztof
