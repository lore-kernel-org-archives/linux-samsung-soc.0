From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: add support for hdmi-ddc to exynos4412-origen
Date: Sun, 27 Jan 2013 21:37:07 +0100
Message-ID: <51058FF3.6070408@gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <1359110384-28402-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:47909 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755445Ab3A0UhQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jan 2013 15:37:16 -0500
Received: by mail-bk0-f44.google.com with SMTP id j4so1004524bkw.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 12:37:15 -0800 (PST)
In-Reply-To: <1359110384-28402-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi,

On 01/25/2013 11:39 AM, Rahul Sharma wrote:
> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>

Please explain why this patch is needed, in more detail...

> ---
>   arch/arm/boot/dts/exynos4.dtsi          |  1 -
>   arch/arm/boot/dts/exynos4412-origen.dts | 13 +++++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
>   mode change 100644 =>  100755 arch/arm/boot/dts/exynos4412.dtsi
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 07cb7d4..a75e2f5 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -219,7 +219,6 @@
>   		compatible = "samsung,s3c2440-i2c";
>   		reg =<0x138C0000 0x100>;
>   		interrupts =<0 64 0>;
> -		status = "disabled";

No, it's not how it is supposed to be done. If you want to enable
this specific I2C controller on your board, just add status = "okay";
line in its node in the board-specific dts file. Please see below.

>   	};
>
>   	i2c_7: i2c@138D0000 {
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 4eba374..6299f1b 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -59,4 +59,17 @@
>   	serial@13830000 {
>   		status = "okay";
>   	};
> +
> +	i2c_6: i2c@138C0000 {
> +		samsung,i2c-sda-delay =<100>;
> +		samsung,i2c-max-bus-freq =<66000>;
> +
> +		pinctrl-0 =<&i2c6_bus>;
> +		pinctrl-names = "default";

		status = "okay";

> +		hdmiddc@50 {
> +			compatible = "samsung,exynos4-hdmiddc";
> +			reg =<0x50>;
> +		};
> +	};
>   };
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> old mode 100644
> new mode 100755

Are you sure you need to add all these execute permissions ?
Do you think these values are more sane than the previous ones ?
I'm afraid there is something going wrong with the file permissions
in your environment...

--

Thanks,
Sylwester
