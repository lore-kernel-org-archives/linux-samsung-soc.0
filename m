From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 3/9] drm/panel: Add driver for exynos_dp based panels
Date: Tue, 22 Apr 2014 16:22:39 +0900
Message-ID: <001b01cf5dfb$a4ab54e0$ee01fea0$%han@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:
> 
> This patch adds a simple driver to handle all the LCD and LED
> powerup/down routines needed to support eDP/eDP-LVDS panels
> supported on exynos boards.
> 
> The LCD and LED units are usually powered up via regulators,
> and almost on all boards, we will have a BL_EN pin to enable/
> disable the backlight. Sometimes, we can have LCD_EN switches
> as well. The routines in this driver can be used to control
> panel power sequence on such boards.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> 	Added routine for post_disable, removed few unwanted headers.
> 	Refactored a lot of code.
> 
>  .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++++
>  drivers/gpu/drm/panel/Kconfig                      |    9 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 ++++++++++++++++++++
>  4 files changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
> 
> diff --git a/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> new file mode 100644
> index 0000000..3fbca54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> @@ -0,0 +1,45 @@
> +exynos_DP_panel/DP_to_LVDS_panel

Please fix it as below.

+Exynos DP panel/DP to LVDS panel

[....]

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4ec874d..ea9d5ac 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -30,4 +30,13 @@ config DRM_PANEL_S6E8AA0
>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
> 
> +config DRM_PANEL_EXYNOS_DP
> +	tristate "support for DP panels"

It looks very general. Please fix it as below.

+	tristate "support for Exynos DP panels"

Best regards,
Jingoo Han

> +	depends on OF && DRM_PANEL && DRM_EXYNOS_DP
> +	help
> +	  DRM panel driver for DP panels and LVDS connected via DP bridges
> +	  that need at most a regulator for LCD unit, a regulator for LED unit
> +	  and/or enable GPIOs for LCD or LED units. Delay values can also be
> +	  specified to support powerup and powerdown process.
> +

[.....]
