From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Wed, 28 Aug 2013 14:22:01 +0200
Message-ID: <1499444.qkqi2LXfcl@amdc1227>
References: <1377691386-7085-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61220 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753130Ab3H1MWI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:22:08 -0400
In-reply-to: <1377691386-7085-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>swarren@wwwdotorg.orgmark.rutland@arm.compawel.moll@arm.comian.campbell@citrix.com, galak@codeaurora.org

Hi Yuvaraj,

On Wednesday 28 of August 2013 17:33:06 Yuvaraj Kumar C D wrote:
> This patch adds the device tree node entries for exynos5420 SOC.
> Exynos5420 has a different version of DWMMC controller,so a new
> compatible string is used to distinguish it from the prior SOC's.
> 
> This patch depends on
> 	mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
> 
> changes since v4:
> 	1.Droppped the bypass-smu binding property.
> 	2.Used compatible string "samsung,exynos5250-dw-mshc"
> 	  for controller instance which does not have SMU.
> 
> changes since V3:
> 	1.change fifo-depth size from 0x80 to 0x40
> 	2.Move the below properties
> 		a.card-detect-delay
> 		b.samsung,dw-mshc-ciu-div
> 		c.samsung,dw-mshc-sdr-timing
> 		d.samsung,dw-mshc-ddr-timing
> 	from SOC dts to board dts file as suggested by Doug Anderson
> 
> changes since V2:
> 	1.dropped num-slots property from node as its not required
> 	  if number of card slots available is 1.
> 
> 	2.Move the below properties
> 		a.fifo-depth
> 		b.card-detect-delay
> 		c.samsung,dw-mshc-ciu-div
> 		d.samsung,dw-mshc-sdr-timing
> 		e.samsung,dw-mshc-ddr-timing
> 	from board dts to SOC dts,as these are not board specific properties.
> 
> 	3.Updated the binding document exynos-dw-mshc.txt.
> 
> changes since V1:
> 	1.disable node by status = disabled in SOC file
> 	2.enable node by status = okay in board specific file
> 
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   33
> +++++++++++++++++ arch/arm/boot/dts/exynos5420.dtsi                  |  
> 39 ++++++++++++++++++++ 3 files changed, 74 insertions(+)

This patch looks good to me now, except some minor comments below.

> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt index
> 6d1c098..84cd56f 100644
> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> @@ -16,6 +16,8 @@ Required Properties:
>  	  specific extensions.
>  	- "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
> specific extensions.
> +	- "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
> +	  specific extensions.
> 
>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card
> interface unit (ciu) clock. This property is applicable only for Exynos5
> SoC's and diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index bafba25..3ce5c97
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -31,6 +31,39 @@
>  		};
>  	};
> 
> +	dwmmc0@12200000 {

Node name should not contain instance index. Instead, according to ePAPR 
recommendation, I would opt for a generic name such as mmc, mshc or sdio-
host. mshc is already used on Exynos 4 so it might be a good idea to use it 
for consistency.

[Adding DT maintainers on CC]

Best regards,
Tomasz
