From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 3/3] ARM: dts: Add node for GPIO keys on SMDK5420
Date: Tue, 15 Apr 2014 21:06:35 +0200
Message-ID: <534D833B.8030607@gmail.com>
References: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com> <1395900785-11334-4-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:47851 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbaDOTGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 15:06:39 -0400
Received: by mail-ee0-f43.google.com with SMTP id e53so8093866eek.30
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 12:06:38 -0700 (PDT)
In-Reply-To: <1395900785-11334-4-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, joshi@samsung.com, sajjan.linux@gmail.com, Abhilash Kesavan <a.kesavan@samsung.com>

Hi,

On 27.03.2014 07:13, Vikas Sajjan wrote:
> From: Abhilash Kesavan <a.kesavan@samsung.com>
>
> Add support for the suspend/resume button (SW7) on SMDK5420 using
> gpio-keys driver.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5420-smdk5420.dts |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 6910485..5ae0dd4 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -158,6 +158,17 @@
>   		};
>   	};
>
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		wakeup {

Is wakeup the label of this key on the PCB? The "label" property below 
would suggest otherwise. This should probably be called key-sw7 or 
something like this.

Moreover, is this the only GPIO key on the board? If there are also 
SW0-SW6, you should add them too.

> +			label = "SW7";
> +			gpios = <&gpx0 0 1>;
> +			linux,code = <143>;	/* KEY_WAKEUP */

Why not use KEY_WAKEUP defined in include/dt-bindings/input/input.h 
directly?

Best regards,
Tomasz
