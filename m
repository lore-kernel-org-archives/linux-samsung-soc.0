From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Sat, 26 Apr 2014 01:55:16 +0200
Message-ID: <535AF5E4.1080708@gmail.com>
References: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com> <1398409152-14770-2-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:51304 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbaDYXzT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 19:55:19 -0400
In-Reply-To: <1398409152-14770-2-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org

Hi Chanho,

On 25.04.2014 08:59, Chanho Park wrote:
> This patch adds a PMU(Power Management Unit) syscon node. This
> should be required for USB Phy syscon regmap I/F.
>
> Cc: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>   Documentation/devicetree/bindings/arm/samsung/pmu.txt | 2 ++
>   arch/arm/boot/dts/exynos4.dtsi                        | 5 +++++
>   arch/arm/boot/dts/exynos4x12.dtsi                     | 4 ++++
>   3 files changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> index f1f1552..e2797d1 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> @@ -2,6 +2,8 @@ SAMSUNG Exynos SoC series PMU Registers
>
>   Properties:
>    - compatible : should contain two values. First value must be one from following list:
> +		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
> +		   - "samsung,exynos4x12-pmu" - for Exynos4212/4412 SoC,

Actually there are differences between PMUs of 4212 and 4412 (mostly 
count of CPU-related registers), so they should have separate compatible 
strings. I have missed this in previous version of this patch, sorry.

Best regards,
Tomasz
