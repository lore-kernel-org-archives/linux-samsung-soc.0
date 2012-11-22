From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: exynos: add UART3 to DEBUG_LL ports
Date: Thu, 22 Nov 2012 15:50:26 +0900
Message-ID: <0f5a01cdc87d$a7326f60$f5974e20$%kim@samsung.com>
References: <1353451739-6317-1-git-send-email-dianders@chromium.org>
 <1353516865-2502-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1353516865-2502-1-git-send-email-dianders@chromium.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Doug Anderson' <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson wrote:
> 
> From: Olof Johansson <olof@lixom.net>
> 
> Add support for using UART3 for DEBUG_LL on exynos.
> 
> [dianders: added depend on ARCH_EXYNOS.]
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> 
> ---
> Changes in v2:
> - Matched Olof's commit message.
> - Added ARCH_EXYNOS to depend list.
> 
>  arch/arm/Kconfig.debug        |   11 +++++++++++
>  arch/arm/plat-samsung/Kconfig |    1 +
>  2 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 33a8930..f54f170 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -355,6 +355,17 @@ choice
>  		  The uncompressor code port configuration is now handled
>  		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> 
> +	config DEBUG_S3C_UART3
> +		depends on PLAT_SAMSUNG && ARCH_EXYNOS
> +		bool "Use S3C UART 3 for low-level debug"
> +		help
> +		  Say Y here if you want the debug print routines to direct
> +		  their output to UART 3. The port must have been
initialised
> +		  by the boot-loader before use.
> +
> +		  The uncompressor code port configuration is now handled
> +		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> +
>  	config DEBUG_SOCFPGA_UART
>  		depends on ARCH_SOCFPGA
>  		bool "Use SOCFPGA UART for low-level debug"
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 59401e1..d342ed0 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -502,5 +502,6 @@ config DEBUG_S3C_UART
>  	default "0" if DEBUG_S3C_UART0
>  	default "1" if DEBUG_S3C_UART1
>  	default "2" if DEBUG_S3C_UART2
> +	default "3" if DEBUG_S3C_UART3
> 
>  endif
> --
> 1.7.7.3

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
