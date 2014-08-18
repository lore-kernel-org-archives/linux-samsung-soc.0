From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/5] drm/exynos: mipi-dsi: add Exynos3 SoC support
Date: Mon, 18 Aug 2014 11:22:20 +0200
Message-ID: <53F1C5CC.4030803@samsung.com>
References: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
 <1408350093-26220-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408350093-26220-2-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08/18/2014 10:21 AM, Inki Dae wrote:
> This patch adds Exynos3250/3472 SoCs support.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
--
Regards
Andrzej
> ---
>  .../devicetree/bindings/video/exynos_dsim.txt      |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> index 31036c6..e74243b 100644
> --- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> @@ -2,6 +2,7 @@ Exynos MIPI DSI Master
>  
>  Required properties:
>    - compatible: value should be one of the following
> +		"samsung,exynos3250-mipi-dsi" /* for Exynos3250/3472 SoCs */
>  		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
>  		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
>    - reg: physical base address and length of the registers set for the device
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 9a186c0..a8c0c4f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -304,6 +304,12 @@ struct exynos_dsi {
>  #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>  #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>  
> +static struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
> +	.plltmr_reg = 0x50,
> +	.has_freqband = 1,
> +	.has_clklane_stop = 1,
> +};
> +
>  static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>  	.plltmr_reg = 0x50,
>  	.has_freqband = 1,
> @@ -315,6 +321,8 @@ static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>  };
>  
>  static struct of_device_id exynos_dsi_of_match[] = {
> +	{ .compatible = "samsung,exynos3250-mipi-dsi",
> +	  .data = &exynos3_dsi_driver_data },
>  	{ .compatible = "samsung,exynos4210-mipi-dsi",
>  	  .data = &exynos4_dsi_driver_data },
>  	{ .compatible = "samsung,exynos5410-mipi-dsi",
