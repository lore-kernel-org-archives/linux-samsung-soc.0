From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH, RESEND] drm: exynos: avoid unused function warning
Date: Tue, 06 Sep 2016 16:08:44 +0200
Message-ID: <d20955a1-f7b4-895e-55ce-34784d39e0be@samsung.com>
References: <20160906133027.2206326-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160906133027.2206326-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Ingi Kim <ingi2.kim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/06/2016 03:30 PM, Arnd Bergmann wrote:
> When CONFIG_PM is not set, we get a warning about an unused function:
>
> drivers/gpu/drm/exynos/exynos_drm_gsc.c:1219:12: error: 'gsc_clk_ctrl' defined but not used [-Werror=unused-function]
>  static int gsc_clk_ctrl(struct gsc_context *ctx, bool enable)
>             ^~~~~~~~~~~~
>
> This removes the two #ifdef checks in this file and instead marks the
> functions as __maybe_unused, which is a more reliable way of doing the
> same, allowing better build coverage and avoiding the warning above.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
--
Regards
Andrzej
