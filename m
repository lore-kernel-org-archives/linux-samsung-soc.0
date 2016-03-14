From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 10/10] ARM: dts: Add PPMU node for exynos3250-artik5 module
Date: Mon, 14 Mar 2016 17:34:58 +0900
Message-ID: <56E677B2.3080304@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-12-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63622 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755248AbcCNIfH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 04:35:07 -0400
In-reply-to: <1457921056-21257-12-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 14.03.2016 11:04, Chanwoo Choi wrote:
> This patch adds PPMU (Platform Performance Monitoring Unit) Device Tree node
> for Exynos3250 based ARTIK5 module. The PPMU node is used to get the
> utilization of DMC0/DMC1/LEFTBUS/RIGHTBUS Block.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

What is the status with your devfreq patches? Instead of this one, there
should be just:
	#include "exynos4412-ppmu-common.dtsi"
(squashed into patch 5/10).

Best regards,
Krzysztof

> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> index 673883fda480..995356708b7d 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -321,6 +321,42 @@
>  	status = "okay";
>  };
>  
> +&ppmu_dmc0 {
> +	status = "okay";
> +	events {
> +		ppmu_dmc0_3: ppmu-event3-dmc0 {
> +			event-name = "ppmu-event3-dmc0";
> +		};
> +	};
> +};
> +
> +&ppmu_dmc1 {
> +	status = "okay";
> +	events {
> +		ppmu_dmc1_3: ppmu-event3-dmc1 {
> +			event-name = "ppmu-event3-dmc1";
> +		};
> +	};
> +};
> +
> +&ppmu_leftbus {
> +	status = "okay";
> +	events {
> +		ppmu_leftbus_3: ppmu-event3-leftbus {
> +			event-name = "ppmu-event3-leftbus";
> +		};
> +	};
> +};
> +
> +&ppmu_rightbus {
> +	status = "okay";
> +	events {
> +		ppmu_rightbus_3: ppmu-event3-rightbus {
> +			event-name = "ppmu-event3-rightbus";
> +		};
> +	};
> +};
> +
>  &tmu {
>  	status = "okay";
>  };
> 
