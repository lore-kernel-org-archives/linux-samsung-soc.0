From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Remove address node from usb parent
 node
Date: Wed, 18 Jan 2017 16:04:27 +0900
Message-ID: <587F137B.6070109@samsung.com>
References: <CGME20170118054410epcas1p4df5c5631e0b13081662eb8fff5e383b3@epcas1p4.samsung.com>
 <1484718408-28933-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1484718408-28933-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj,

This issue already posted by Javier Martinez Canillas[1].
Maybe, he will post v2.

[1] https://lkml.org/lkml/2017/1/10/907
- ("Re: [PATCH v2 3/3] arm64: dts: exynos: Remove unneeded unit names in Exynos5433 nodes")

On 2017년 01월 18일 14:46, Pankaj Dubey wrote:
> Address node does not required to be put after parent't node,
> so remove address node from usb parent node.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 68f764e..0d7a55d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1285,7 +1285,7 @@
>  			status = "disabled";
>  		};
>  
> -		usbdrd30: usb@15400000  {
> +		usbdrd30: usb3-0 {
>  			compatible = "samsung,exynos5250-dwusb3";
>  			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
>  				<&cmu_fsys CLK_SCLK_USBDRD30>;
> @@ -1332,7 +1332,7 @@
>  			status = "disabled";
>  		};
>  
> -		usbhost30: usb@15a00000 {
> +		usbhost30: usbhost3-0 {
>  			compatible = "samsung,exynos5250-dwusb3";
>  			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
>  				<&cmu_fsys CLK_SCLK_USBHOST30>;
> 


-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
