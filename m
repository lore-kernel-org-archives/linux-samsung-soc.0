From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module on
 EXYNOS5440
Date: Sat, 5 Jan 2013 14:54:18 -0800
Message-ID: <CAOesGMiXUJ2+a8znVnzyzx_u1cqg57zxwff3jObTH3yxn_MC8w@mail.gmail.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357172423-8217-1-git-send-email-kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 2, 2013 at 4:20 PM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Fix the incorrect compatible property value of pin-controller module
> EXYNOS5440 SoC.
>
> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> [kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org: fixed it in gpio together for exynos5440]
> Signed-off-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    2 +-
>  drivers/gpio/gpio-samsung.c       |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 024269d..25f0fa6 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -86,7 +86,7 @@
>         };
>
>         pinctrl {
> -               compatible = "samsung,pinctrl-exynos5440";
> +               compatible = "samsung,exynos5440-pinctrl";
>                 reg = <0xE0000 0x1000>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index 953737d..cac4b45 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3026,7 +3026,7 @@ static __init int samsung_gpiolib_init(void)
>         static const struct of_device_id exynos_pinctrl_ids[] = {
>                 { .compatible = "samsung,pinctrl-exynos4210", },
>                 { .compatible = "samsung,pinctrl-exynos4x12", },
> -               { .compatible = "samsung,pinctrl-exynos5440", },
> +               { .compatible = "samsung,exynos5440-pinctrl", },

Uugh. There's something to be said about consistency, even if it's
possibly not 100% correct. Is it really worth it to have 5440 be the
only one with the "right" naming here?


-Olof
