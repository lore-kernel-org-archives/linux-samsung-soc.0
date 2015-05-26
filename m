From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@outlook.com>
Subject: Re: [PATCH RESEND] ARM: dts: exynos4412: Enable AX88760 USB hub on
 Origen board
Date: Tue, 26 May 2015 17:08:31 +0900
Message-ID: <BLU437-SMTP416B1C52FF19BD228DA610E2CC0@phx.gbl>
References: <1428944566-17132-1-git-send-email-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu004-omc1s9.hotmail.com ([65.55.116.20]:56876 "EHLO
	BLU004-OMC1S9.hotmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751972AbbEZINg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 May 2015 04:13:36 -0400
In-Reply-To: <1428944566-17132-1-git-send-email-matthew@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

2015-04-14 2:02 GMT+09:00 Matthew Leach <matthew@mattleach.net>:
> Enable the Origen's usb phy and ohci devices in the device tree.  Also
> add the "samsung,vbus-gpio" property to enable the GPX3(5) gpio pin so
> the AX88760 hub is powered.
>
> Signed-off-by: Matthew Leach <matthew@mattleach.net>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index bd8b730..c810ca3 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -531,4 +531,19 @@
>                         clock-frequency = <24000000>;
>                 };
>         };
> +
> +       exynos-usbphy@125B0000 {

Could you use label notation here?
&exynos_usbphy {
...
}

Best regards,
Krzysztof
