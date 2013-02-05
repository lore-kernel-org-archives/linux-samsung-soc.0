From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: add mshc controller node for Exynos4x12 SoCs
Date: Mon, 04 Feb 2013 16:21:58 -0800
Message-ID: <121c01ce0336$d0c74280$7255c780$@samsung.com>
References: <1358764755-21470-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46411 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754594Ab3BEAWO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 19:22:14 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHQ003S20YW9KC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 09:22:10 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHQ0076W10VXL90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 09:22:09 +0900 (KST)
In-reply-to: <1358764755-21470-1-git-send-email-thomas.abraham@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, tobetter@gmail.com, tgih.jun@samsung.com, jh80.chung@samsung.com

Thomas Abraham wrote:
> 
> Commit cea0f256 ("ARM: dts: Add board dts file for ODROID-X") includes a
> node
> to describe the board level properties for mshc controller. But the mshc
> controller node was not added in the Exynos4x12 dtsi file which resulted
> in the following warning when compiling the dtb files.
> 
> Warning (reg_format): "reg" property in /mshc@12550000/slot@0 has invalid
> length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Warning (avoid_default_addr_size): Relying on default #address-cells value
> for /mshc@12550000/slot@0
> Warning (avoid_default_addr_size): Relying on default #size-cells value
for
> /mshc@12550000/slot@0
> 
> Fix this by adding the mshc controller node for Exynos4x12 SoCs.
> 
> Cc: Dongjin Kim <tobetter@gmail.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi
> b/arch/arm/boot/dts/exynos4412.dtsi
> index 78ed377..96f5b66 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -32,4 +32,12 @@
>  		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
>  			     <1 12 0>, <1 12 0>, <1 12 0>, <1 12 0>;
>  	};
> +
> +	mshc@12550000 {
> +		compatible = "samsung,exynos4412-dw-mshc";
> +		reg = <0x12550000 0x1000>;
> +		interrupts = <0 77 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
>  };
> --
> 1.7.5.4

Looks good to me, applied with "Tested-by: Dongjin Kim <tobetter@gmail.com>"

Thanks.

- Kukjin
