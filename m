From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: Add node references to 5420
Date: Thu, 01 May 2014 19:25:26 +0200
Message-ID: <53628386.4090108@gmail.com>
References: <1398856138-18837-1-git-send-email-arun.kk@samsung.com> <1398856138-18837-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:50315 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795AbaEARZ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 13:25:29 -0400
In-Reply-To: <1398856138-18837-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

Hi Arun,

Looks mostly fine, just some minor nits to improve readability.

On 30.04.2014 13:08, Arun Kumar K wrote:
> Adding references to nodes which do not have it yet
> in exynos5420.dtsi. This is done so as to use reference
> based node updation in board files.

To stick to correct terminology, the handle that lets you reference a 
node is called "label", so this patch adds labels to nodes that don't 
have them yet.

>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |   26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index c3a9a66..2058276 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -125,7 +125,7 @@
>   		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
>   	};
>
> -	codec@11000000 {
> +	codec: codec@11000000 {

IMHO "mfc" would be a more convenient label.

>   		compatible = "samsung,mfc-v7";
>   		reg = <0x11000000 0x10000>;
>   		interrupts = <0 96 0>;
> @@ -169,7 +169,7 @@
>   		status = "disabled";
>   	};
>
> -	mct@101C0000 {
> +	mct: mct@101C0000 {
>   		compatible = "samsung,exynos4210-mct";
>   		reg = <0x101C0000 0x800>;
>   		interrupt-controller;
> @@ -270,7 +270,7 @@
>   		interrupts = <0 47 0>;
>   	};
>
> -	rtc@101E0000 {
> +	rtc: rtc@101E0000 {
>   		clocks = <&clock CLK_RTC>;
>   		clock-names = "rtc";
>   		status = "disabled";
> @@ -430,22 +430,22 @@
>   		status = "disabled";
>   	};
>
> -	serial@12C00000 {
> +	serial_0: serial@12C00000 {

To match with our hardware naming conventions, uart0 would probably be a 
better label. Similarly for remaining serial ports.

With those fixed, feel free to add my Reviewed-by tag.

Best regards,
Tomasz
