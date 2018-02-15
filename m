From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Update I2S0 device node in
 exynos5433.dtsi
Date: Thu, 15 Feb 2018 19:32:34 +0100
Message-ID: <20180215183234.sbr5uvobjyynfpdj@kozik-lap>
References: <20180212163147.11561-1-s.nawrocki@samsung.com>
 <CGME20180212163207epcas1p19d0fd84633edda6f61a7b760b85e1c91@epcas1p1.samsung.com>
 <20180212163147.11561-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180212163147.11561-2-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 12, 2018 at 05:31:46PM +0100, Sylwester Nawrocki wrote:
> The i2s0 node name is changed to a more generic "i2s" and missing
> (optional) properties are added. The #sound-dai-cells property is
> required for HDMI audio support on TM2 board.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v2:
>  - none.
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
