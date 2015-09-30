From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 03/17] drm: bridge: analogix/dp: fix some obvious code
 style
Date: Wed, 30 Sep 2015 14:22:34 +0900
Message-ID: <560B719A.4040309@samsung.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <1442907276-2997-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63951 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbbI3FWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 01:22:55 -0400
In-reply-to: <1442907276-2997-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On 22.09.2015 16:34, Yakir Yang wrote:
> Fix some obvious alignment problems, like alignment and line
> over 80 characters problems, make this easy to be maintained
> later.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v5:
> - Resequence this patch after analogix_dp driver have been split
>   from exynos_dp code, and rephrase reasonable commit message, and
>   remove some controversial style (Krzysztof)
>     -		analogix_dp_write_byte_to_dpcd(
>     - 				dp, DP_TEST_RESPONSE,
>     +		analogix_dp_write_byte_to_dpcd(dp,
>     +				DP_TEST_RESPONSE,
> 				DP_TEST_EDID_CHECKSUM_WRITE);
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Improved commit message more readable, and avoid using some
>   uncommon style like bellow: (Joe Preches)
>     -  retval = exynos_dp_read_bytes_from_i2c(...
>   				  ...);
>     +  retval =
>     +  exynos_dp_read_bytes_from_i2c(......);
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 129 ++++++++++-----------
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  72 ++++++------
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 124 ++++++++++----------
>  3 files changed, 163 insertions(+), 162 deletions(-)
> 

IMHO much better than in previous attempt. The code looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

BTW my opinion is not enough, you still need an ack from Exynos DP
maintainer (or DRM guys).


Best regards,
Krzysztof
