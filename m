From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: Add iRAM device-tree node for Exynos5433
Date: Tue, 9 Jan 2018 13:46:53 +0100
Message-ID: <CAJKOXPcfxPgU188ukVTMhLUagmaY9o_8VHf2COxzDhNVAxnznA@mail.gmail.com>
References: <CGME20180109075905epcas2p4aa0174854c0796cc7fa75bdf8a273791@epcas2p4.samsung.com>
 <1515484746-10656-1-git-send-email-cw00.choi@samsung.com> <1515484746-10656-7-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515484746-10656-7-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 9, 2018 at 8:59 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds the iRAM device-tree node of Exynos5433 which
> defines the memory map of iRAM as following and it is used for suspend.
> - address: 0x0202_0000 ~ 0x3000_0000
>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 62f276970174..77f4321b247c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -262,6 +262,20 @@
>                         interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
>                 };
>
> +               sysram@02020000 {

Remove leading 0.

Best regards,
Krzysztof

> +                       compatible = "mmio-sram";
> +                       reg = <0x02020000 0x5c000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x02020000 0x5c000>;
> +                       status = "okay";
> +
> +                       smp-sysram@5b000 {
> +                               compatible = "samsung,exynos4210-sysram-ns";
> +                               reg = <0x5b000 0x1000>;
> +                       };
> +               };
> +
>                 chipid@10000000 {
>                         compatible = "samsung,exynos4210-chipid";
>                         reg = <0x10000000 0x100>;
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
