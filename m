From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Wed, 12 Feb 2014 11:13:35 +0000
Message-ID: <52FB575F.3070104@arm.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-2-git-send-email-kgene.kim@samsung.com> <CAOesGMjE=zOStKoZQhYLhYtL_aWD73DcF4w6STboZPMfHkLtxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:33769 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751167AbaBLLNh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:13:37 -0500
In-Reply-To: <CAOesGMjE=zOStKoZQhYLhYtL_aWD73DcF4w6STboZPMfHkLtxA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Catalin Marinas <Catalin.Marinas@arm.com>

On 11/02/14 23:36, Olof Johansson wrote:
> Hi,
> 
> Besides what Mark Rutland already commented on:
> 
> On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> +/ {
>> +       model = "SAMSUNG GH7";
>> +       compatible = "samsung,gh7";
> 
> Model and compatible in the dtsi should probably always be overridden
> by a dts that includes it, so there's little use in having it here.
> 
>> +       interrupt-parent = <&gic>;
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       cpus {
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>> +
>> +               cpu@000 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,armv8";
>> +                       reg = <0x0 0x000>;
> 
> No need to zero-pad cpu numbers in unit address or reg.
> 
>> +                       enable-method = "spin-table";
>> +                       cpu-release-addr = <0x0 0x8000fff8>;
>> +               };
>> +               cpu@001 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,armv8";
>> +                       reg = <0x0 0x001>;
>> +                       enable-method = "spin-table";
>> +                       cpu-release-addr = <0x0 0x8000fff8>;
>> +               };
>> +               cpu@002 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,armv8";
>> +                       reg = <0x0 0x002>;
>> +                       enable-method = "spin-table";
>> +                       cpu-release-addr = <0x0 0x8000fff8>;
>> +               };
>> +               cpu@003 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,armv8";
>> +                       reg = <0x0 0x003>;
>> +                       enable-method = "spin-table";
>> +                       cpu-release-addr = <0x0 0x8000fff8>;
>> +               };
>> +       };
>> +
>> +       gic: interrupt-controller@1C000000 {
>> +               compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> 
> This looks incorrect -- you should at the very least have a more
> specific one than a15-gic? Marc?

"arm,cortex-a9-gic" is definitely wrong (the A9 GIC doesn't have the
virt extensions). This binding matches what the A15 GIC has, so
"arm,cortex-a15-gic" is probably fine. Main issue here is that the GICv2
driver has no compatible string for anything else.

Should we define something more generic (like "arm,gic-v2")? Or carry on
adding more compatible strings?

	M.

>> +               #interrupt-cells = <3>;
>> +               #address-cells = <0>;
>> +               interrupt-controller;
>> +               reg = <0x0 0x1C001000 0 0x1000>,        /* GIC Dist */
>> +                     <0x0 0x1C002000 0 0x1000>,        /* GIC CPU */
>> +                     <0x0 0x1C004000 0 0x2000>,        /* GIC VCPU Control */
>> +                     <0x0 0x1C006000 0 0x2000>;        /* GIC VCPU */
>> +               interrupts = <1 9 0xf04>;       /* GIC Maintenence IRQ */
>> +       };

-- 
Jazz is not dead. It just smells funny...
