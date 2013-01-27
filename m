From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Sun, 27 Jan 2013 21:54:26 +0100
Message-ID: <51059402.2030405@gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:58899 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756118Ab3A0Uyf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jan 2013 15:54:35 -0500
Received: by mail-ee0-f46.google.com with SMTP id e49so988640eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 12:54:33 -0800 (PST)
In-Reply-To: <1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

On 01/25/2013 11:39 AM, Rahul Sharma wrote:
> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>

Please provide proper commit text.

> Conflicts:
> 	arch/arm/mach-exynos/mach-exynos4-dt.c

And make sure things like this are removed when submitting patches.

> ---
>   arch/arm/boot/dts/exynos4.dtsi         | 7 +++++++
>   arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
>   2 files changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index e1347fc..6c2c79d 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -289,4 +289,11 @@
>   			interrupts =<0 34 0>;
>   		};
>   	};
> +
> +	hdmi {
> +		compatible = "samsung,exynos4-hdmi14";

What "-hdmi14" signifies here ? And to which Exynos4 SoC revisions this
compatible property is supposed to apply ?

> +		reg =<0x12D00000 0x70000>;
> +		interrupts =<0 95 0>;
> +		hpd-gpio =<&gpx3 7 0xf 1 3>;
> +	};

New bindings need to be documented in Documentation/devicetree/bindings/.

--

Thanks,
Sylwester
