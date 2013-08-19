From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH v2 4/5] [media] exynos-mscl: Add DT bindings for M-Scaler
 driver
Date: Mon, 19 Aug 2013 21:57:38 +0900
Message-ID: <033401ce9cdb$af145800$0d3d0800$%dae@samsung.com>
References: <1376909932-23644-1-git-send-email-shaik.ameer@samsung.com>
 <1376909932-23644-5-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1376909932-23644-5-git-send-email-shaik.ameer@samsung.com>
Content-language: ko
Sender: linux-media-owner@vger.kernel.org
To: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com
Cc: s.nawrocki@samsung.com, posciak@google.com, arun.kk@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Shaik Ameer Basha
> Sent: Monday, August 19, 2013 7:59 PM
> To: linux-media@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Cc: s.nawrocki@samsung.com; posciak@google.com; arun.kk@samsung.com;
> shaik.ameer@samsung.com
> Subject: [PATCH v2 4/5] [media] exynos-mscl: Add DT bindings for M-Scaler
> driver
> 
> This patch adds the DT binding documentation for the exynos5
> based M-Scaler device driver.
> 
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  .../devicetree/bindings/media/exynos5-mscl.txt     |   34
> ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/exynos5-
> mscl.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/exynos5-mscl.txt
> b/Documentation/devicetree/bindings/media/exynos5-mscl.txt
> new file mode 100644
> index 0000000..5c9d1b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/exynos5-mscl.txt
> @@ -0,0 +1,34 @@
> +* Samsung Exynos5 M-Scaler device
> +
> +M-Scaler is used for scaling, blending, color fill and color space
> +conversion on EXYNOS5 SoCs.
> +
> +Required properties:
> +- compatible: should be "samsung,exynos5-mscl"

If Exynos5410/5420 have same IP,
"samsung,exynos5410-mscl" for M Scaler IP in Exynos5410/5420"

Else,
Compatible: should be one of the following:
(a) "samsung,exynos5410-mscl" for M Scaler IP in Exynos5410"
(b) "samsung,exynos5420-mscl" for M Scaler IP in Exynos5420"

> +- reg: should contain M-Scaler physical address location and length.
> +- interrupts: should contain M-Scaler interrupt number
> +- clocks: should contain the clock number according to CCF
> +- clock-names: should be "mscl"
> +
> +Example:
> +
> +	mscl_0: mscl@0x12800000 {
> +		compatible = "samsung,exynos5-mscl";

"samsung,exynos5410-mscl";

> +		reg = <0x12800000 0x1000>;
> +		interrupts = <0 220 0>;
> +		clocks = <&clock 381>;
> +		clock-names = "mscl";
> +	};
> +
> +Aliases:
> +Each M-Scaler node should have a numbered alias in the aliases node,
> +in the form of msclN, N = 0...2. M-Scaler driver uses these aliases
> +to retrieve the device IDs using "of_alias_get_id()" call.
> +
> +Example:
> +
> +aliases {
> +	mscl0 =&mscl_0;
> +	mscl1 =&mscl_1;
> +	mscl2 =&mscl_2;
> +};
> --
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
