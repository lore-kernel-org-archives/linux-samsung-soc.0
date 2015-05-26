From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@outlook.com>
Subject: Re: [PATCH RESEND] ARM: dts: exynos4412: Enable AX88760 USB hub on
 Origen board
Date: Tue, 26 May 2015 17:08:31 +0900
Message-ID: <BLU436-SMTP64BEEAC702E695B18320ACE2CC0@phx.gbl>
References: <1428944566-17132-1-git-send-email-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1428944566-17132-1-git-send-email-matthew@mattleach.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthew Leach <matthew@mattleach.net>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

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
