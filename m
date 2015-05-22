From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable display on Trats2 board
Date: Fri, 22 May 2015 11:09:57 +0200
Message-ID: <555EF265.30608@collabora.co.uk>
References: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/22/2015 02:48 AM, Krzysztof Kozlowski wrote:
> Enable the Exynos DSI and S6E8AA0 panel for full X11 display on Trats2.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index d034c96c039b..e7ccec487422 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -135,9 +135,11 @@ CONFIG_DRM_BRIDGE=y
>  CONFIG_DRM_PTN3460=y
>  CONFIG_DRM_PS8622=y
>  CONFIG_DRM_EXYNOS=y
> +CONFIG_DRM_EXYNOS_DSI=y
>  CONFIG_DRM_EXYNOS_FIMD=y
>  CONFIG_DRM_EXYNOS_DP=y
>  CONFIG_DRM_PANEL=y
> +CONFIG_DRM_PANEL_S6E8AA0=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_FB=y
>  CONFIG_FB_MODE_HELPERS=y
> 

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
