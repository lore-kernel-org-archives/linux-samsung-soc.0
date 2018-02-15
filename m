From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: exynos: Add support for HDMI audio on
 exynos5433-tm2
Date: Thu, 15 Feb 2018 19:32:57 +0100
Message-ID: <20180215183257.lvtyzixgzwfcl7fq@kozik-lap>
References: <20180212163147.11561-1-s.nawrocki@samsung.com>
 <CGME20180212163212epcas2p15a43c33e24b6c800544637ca0b030cb6@epcas2p1.samsung.com>
 <20180212163147.11561-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180212163147.11561-3-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 12, 2018 at 05:31:47PM +0100, Sylwester Nawrocki wrote:
> This patch updates the sound node of the exynos5433-tm2 board
> and adds clock tree configuration in order to support HDMI sound.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v2:
>  - nodes sorted alphabetically, changed the assigned clock
>    frequencies.
> 
> Changes since v1:
>  - dropped unnecessary assigned-clock* properties for AUD PLL
>    in cmu_top node,
>  - changed default AUD PLL frequency so it is within recommended
>    252...400 MHz range.
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 52 ++++++++++++++++++++--
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  1 +
>  2 files changed, 49 insertions(+), 4 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
