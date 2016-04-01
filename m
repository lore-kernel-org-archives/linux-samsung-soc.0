From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/11] ARM: dts: exynos: Fix DTC unit name warnings in cros-adc-thermistors
Date: Fri, 1 Apr 2016 10:31:34 -0500
Message-ID: <CAL_JsqJi0w_j2wcb8f60XKOL3MFxkHFZpoyFhT-CCno_chb9Rw@mail.gmail.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39740 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750994AbcDAPb5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 11:31:57 -0400
In-Reply-To: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Fri, Apr 1, 2016 at 1:57 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Fix following DTC warnings in cros-adc-thermistors:
> Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@3 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@4 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@5 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /adc@12D10000/ncp15wb473@6 has a unit name, but no reg property
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/cros-adc-thermistors.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/cros-adc-thermistors.dtsi b/arch/arm/boot/dts/cros-adc-thermistors.dtsi
> index acd4fe1833f2..87e676917603 100644
> --- a/arch/arm/boot/dts/cros-adc-thermistors.dtsi
> +++ b/arch/arm/boot/dts/cros-adc-thermistors.dtsi
> @@ -13,28 +13,28 @@
>  */
>
>  &adc {
> -       ncp15wb473@3 {
> +       ncp15wb473_3 {

Don't use underscores.

>                 compatible = "murata,ncp15wb473";
>                 pullup-uv = <1800000>;
>                 pullup-ohm = <47000>;
>                 pulldown-ohm = <0>;
>                 io-channels = <&adc 3>;

I've not looked at the full binding here, but this case may warrant
adding a reg property as an ADC channel number is what i'd consider an
addressable thing. This is also kind of strange having a phandle to
the parent node.

Rob
