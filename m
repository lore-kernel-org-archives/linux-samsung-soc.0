From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] arm: exynos5: Enable PM generic domain support in
 Kconfig
Date: Tue, 4 Dec 2012 14:37:42 +0530
Message-ID: <CAJuYYwTJGQW3QhubqkmURmA0TedxHeFdo8+rB0Q=eHGvGQ_jTw@mail.gmail.com>
References: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
 <1354018957-17752-3-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1354018957-17752-3-git-send-email-prasanna.ps@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27 November 2012 17:52, Prasanna Kumar <prasanna.ps@samsung.com> wrote:
> From: Prasanna Kumar <prasanna.ps@samsung.com>
>
> This patch adds support to enable PM generic domains
> under Exynos5 family
>
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

> ---
>  arch/arm/mach-exynos/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 945ce49..c07a29c 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -63,6 +63,7 @@ config SOC_EXYNOS5250
>         depends on ARCH_EXYNOS5
>         select S5P_PM if PM
>         select S5P_SLEEP if PM
> +       select PM_GENERIC_DOMAINS if PM
>         select S5P_DEV_MFC
>         select SAMSUNG_DMADEV
>         help
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
