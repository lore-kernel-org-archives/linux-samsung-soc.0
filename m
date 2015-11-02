From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos7: Enable HS200 mode operation
Date: Mon, 2 Nov 2015 20:58:56 +0900
Message-ID: <CAJKOXPcpyBQ-2MDC6D69-p+038wxfVdS+weBGJy+r+eP6tNB-g@mail.gmail.com>
References: <1446458641-4447-1-git-send-email-alim.akhtar@samsung.com>
	<1446458641-4447-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446458641-4447-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Subject - name of the board at the end (not the name of the SoC):
arm64: dts: Enable HS200 mode operation on exynos7-espresso

2015-11-02 19:04 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
> This patch enables HS200 mode operation on exynos7 based
> espresso board.
> This also remove _broken-cd_ property as per mmc binding documentation

s/remove/removes/

> which say one of the properties between broken-cd and non-removable

s/say/says/

> should be used. And we already use _non-removable_ as emmc mounted
> on board which is a non-removable device.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> index 8ce04a0ec928..7f19b99fc85b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> @@ -405,8 +405,8 @@
>  &mmc_0 {
>         status = "okay";
>         num-slots = <1>;
> -       broken-cd;
>         cap-mmc-highspeed;
> +       mmc-hs200-1_8v;

The "mmc-ddr-1_8v" should also be supported but I guess you did not
add it on purpose?

Best regards,
Krzysztof
