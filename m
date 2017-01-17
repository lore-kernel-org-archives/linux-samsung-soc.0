From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: Add stmfts touchscreen node for
 TM2 and TM2E
Date: Tue, 17 Jan 2017 11:35:21 -0300
Message-ID: <1aad419a-5873-3eea-c536-aa8a1c187fb9@osg.samsung.com>
References: <20170117135441.31450-1-andi.shyti@samsung.com>
 <CGME20170117135457epcas5p2044e9e5cd9eb6b162bb0acb4e317bdfb@epcas5p2.samsung.com>
 <20170117135441.31450-4-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:35411
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751055AbdAQOf3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 09:35:29 -0500
In-Reply-To: <20170117135441.31450-4-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi@etezian.org>

Hello Andi,

On 01/17/2017 10:54 AM, Andi Shyti wrote:
> TM2 and TM2E devices are provided with a ST-Microelectronics
> Finger Tip S device with small differences:
> 
>  - screen size
>  - TM2E uses the stmfts also as a touchkey for "back" and "menu"
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts         |  5 +++++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts        |  7 +++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index a5c866901e93..689d5c124a49 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -745,6 +745,19 @@
>  	};
>  };
>  
> +&hsi2c_5 {
> +	status = "okay";
> +
> +	touchscreen: stmfts@49 {

Same comment than in patch 1/3, I think "stmfts: touchscreen@49" is better.

Rest looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
