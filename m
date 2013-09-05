From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dt: Exynos5420: populate cpu node enteries to
 8 cpus
Date: Thu, 5 Sep 2013 16:09:24 +0530
Message-ID: <CAGm_ybintHkLEOYUg=RN4gT8iDww2jyVdtbQZ3kvNbOcO8ewVw@mail.gmail.com>
References: <1378376550-27762-1-git-send-email-chander.kashyap@linaro.org>
	<1378376550-27762-3-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:33008 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932340Ab3IEKj0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:39:26 -0400
Received: by mail-wg0-f45.google.com with SMTP id y10so1560092wgg.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 03:39:24 -0700 (PDT)
In-Reply-To: <1378376550-27762-3-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Chander,

On Thu, Sep 5, 2013 at 3:52 PM, Chander Kashyap
<chander.kashyap@linaro.org> wrote:
> Exynos5420 is octacore SoC from samsung.
> Hence populate all the cpu node enteries.
>
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index e97c87b..0bd1a40 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -57,6 +57,34 @@
>                         reg = <0x3>;
>                         clock-frequency = <1800000000>;
>                 };
> +
> +               cpu4: cpu@0x100 {


you are NOT suppose to use '0x' in dt node name.
it should be  cpu4: cpu@100 {


> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x100>;
> +                       clock-frequency = <1000000000>;
> +               };
> +
> +               cpu5: cpu@0x101 {

ditto.


> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x101>;
> +                       clock-frequency = <1000000000>;
> +               };
> +
> +               cpu6: cpu@0x102 {

ditto.

> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x102>;
> +                       clock-frequency = <1000000000>;
> +               };
> +
> +               cpu7: cpu@0x103 {

ditto.

> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x103>;
> +                       clock-frequency = <1000000000>;
> +               };
>         };
>
>         clock: clock-controller@0x10010000 {
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
