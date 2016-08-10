From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable bus frequency scaling with
 DEVFREQ/DEVFREQ-Event
Date: Wed, 10 Aug 2016 11:46:05 +0200
Message-ID: <baa00991-8894-7879-1075-28437139c61a@samsung.com>
References: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux@armlinux.org.uk, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux.amoon@gmail.com, linux-kernel@vger.kernel.org, javier@osg.samsung.com, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/15/2016 03:33 AM, Chanwoo Choi wrote:
> This patch enables the bus frequency scaling driver with DEVFREQ and
> DEVFREQ-Event framework. This patches already was merged for Odroid-U3/XU3
> ,Trats2 and Rinato/Monk boards.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index a5aa44c56bfe..37052b115a40 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -219,6 +219,16 @@ CONFIG_CROS_EC_CHARDEV=y
>  CONFIG_COMMON_CLK_MAX77686=y
>  CONFIG_COMMON_CLK_MAX77802=y
>  CONFIG_COMMON_CLK_S2MPS11=y
> +CONFIG_PM_DEVFREQ=y
> +CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> +CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> +CONFIG_DEVFREQ_GOV_POWERSAVE=y
> +CONFIG_DEVFREQ_GOV_USERSPACE=y
> +CONFIG_DEVFREQ_GOV_PASSIVE=y
> +CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
> +CONFIG_PM_DEVFREQ_EVENT=y
> +CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
> +CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y

Applied with small changes in commit message and removal of symbols
already selected (defconfig).

Best regards,
Krzysztof
