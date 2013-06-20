From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: dts: exynos5420: add dt nodes for hdmi subsystem
Date: Thu, 20 Jun 2013 12:08:28 +0530
Message-ID: <CAK9yfHx+Ekrs1f=zquoSyjozsVwkWd18NLp+yadoSAbn_1008Q@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
 <1371706911-27016-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371706911-27016-3-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 20 June 2013 11:11, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.
>
> Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |   12 ++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 08607df..b3721bd 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -30,4 +30,19 @@
>                         clock-frequency = <24000000>;
>                 };
>         };
> +
> +       hdmi {
> +               hpd-gpio = <&gpx3 7 0>;
> +       };
> +
> +       i2c_2: i2c@12C80000 {
> +               samsung,i2c-sda-delay = <100>;
> +               samsung,i2c-max-bus-freq = <66000>;
> +               status = "okay";
> +
> +               hdmiddc@50 {
> +                       compatible = "samsung,exynos4210-hdmiddc";
> +                       reg = <0x50>;
> +               };
> +       };
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index b0ec047..45aadf9 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -201,4 +201,16 @@
>                 clock-names = "i2c";
>                 status = "disabled";
>         };
> +
> +       hdmi {
> +               compatible = "samsung,exynos4212-hdmi";
> +               reg = <0x14530000 0x70000>;
> +               interrupts = <0 95 0>;
> +       };
> +
> +       mixer: mixer@14450000 {
> +               compatible = "samsung,exynos5420-mixer";
> +               reg = <0x14450000 0x10000>;
> +               interrupts = <0 94 0>;
> +       };

If these are the parent nodes, disable them here and enable in the board files.


-- 
With warm regards,
Sachin
