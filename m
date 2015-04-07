From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Get current parent clock for power
 domain on/off
Date: Tue, 07 Apr 2015 11:48:47 +0200
Message-ID: <5523A7FF.2030700@collabora.co.uk>
References: <1428053635-10855-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428053635-10855-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 04/03/2015 11:33 AM, Krzysztof Kozlowski wrote:
> Using a fixed (by DTS) parent for clocks when turning on the power domain
> may introduce issues in other drivers. For example when such driver
> changes the parent during runtime and expects that he is the only place
> of such change.
> 
> Do not rely on DTS providing the fixed parent for such clocks. Instead
> before switching domain off, grab a current parent of a clock with
> clk_get_parent().
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Changes since v1:
> 1. Drop "pclk" bindings entirely as suggested by Andrzej Hajda.
>    This was significant change so I did not add Javier's
>    reviewed/tested tags.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

on an Exynos5420 Peach Pit Chromebook:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
