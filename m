From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 7/9] soc: samsung: Update the CHIP ID DT binding
 documentation
Date: Wed, 14 Aug 2019 15:00:50 +0200
Message-ID: <CAJKOXPdfe-ON9wmy30YGoGG_LzwhEuXmcv_-kt07cS-Wd3cG8w@mail.gmail.com>
References: <CGME20190813150858eucas1p1a5fbf425753e4911c50631c3a6d34ffd@eucas1p1.samsung.com>
 <20190813150827.31972-1-s.nawrocki@samsung.com>
 <20190813150827.31972-8-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190813150827.31972-8-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-pm@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, kgene@kernel.org, vireshk@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 13 Aug 2019 at 17:09, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch adds documentation of a new optional "samsung,asv-bin"
> property in the chipid device node and documents requirement of
> "syscon" compatible string.  These additions are needed to support
> Exynos ASV (Adaptive Supply Voltage) feature.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - none
>
> Changes since v1 (RFC):
>  - new patch
> ---
>  .../devicetree/bindings/arm/samsung/exynos-chipid.txt  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
> index 85c5dfd4a720..be3657e6c00c 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
> @@ -1,12 +1,18 @@
> -SAMSUNG Exynos SoCs Chipid driver.
> +SAMSUNG Exynos SoC series CHIPID subsystem
>
>  Required properties:
> -- compatible : Should at least contain "samsung,exynos4210-chipid".
> +- compatible : Should at least contain "samsung,exynos4210-chipid", "syscon".
>
>  - reg: offset and length of the register set
>
> +Optional properties:
> + - samsung,asv-bin : Adaptive Supply Voltage bin selection. This can be used
> +   to determine the ASV bin of an SoC if respective information is missing
> +   in the CHIPID registers or in the OTP memory. Possible values: 0...3.
> +
>  Example:
>         chipid@10000000 {
>                 compatible = "samsung,exynos4210-chipid";

Please update the example with new required compatible.

Best regards,
Krzysztof

>                 reg = <0x10000000 0x100>;
> +               samsung,asv-bin = <2>;
>         };
> --
> 2.17.1
>
