From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos4: Remove obsolete MIPI DPHY 'reg'
 property
Date: Sat, 23 May 2015 11:20:06 +0900
Message-ID: <555FE3D6.7030009@kernel.org>
References: <1432174713-23368-1-git-send-email-k.kozlowski@samsung.com> <CABxcv=mKLGVWj2swi63-AkdF_-D5eVM=-785dJ8WjUNC-D1zpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39214 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755688AbbEWCUN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 22:20:13 -0400
In-Reply-To: <CABxcv=mKLGVWj2swi63-AkdF_-D5eVM=-785dJ8WjUNC-D1zpg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 05/21/15 16:23, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On Thu, May 21, 2015 at 4:18 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> Since e4b3d38088df ("phy: exynos-video-mipi: Fix regression by adding
>> support for PMU regmap") the Exynos PMU driver provides regmap to access
>> the MIPI DPHY registers. The MIPI DPHY node uses a phandle to syscon to
>> get this regmap. The 'reg' field is obsolete.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 1c74c1296ab7..6e7f0b4afa84 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -78,7 +78,6 @@
>>
>>         mipi_phy: video-phy@10020710 {
>>                 compatible = "samsung,s5pv210-mipi-video-phy";
>> -               reg = <0x10020710 8>;
>>                 #phy-cells = <1>;
>>                 syscon = <&pmu_system_controller>;
>>         };
> 
> Indeed, is even removed from the DT binding so this is clearly a left over.
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
Thanks, applied this series.

- Kukjin
