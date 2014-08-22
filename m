From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v7] ARM: dts: Prepare node labels for exynos5250
Date: Fri, 22 Aug 2014 13:37:49 +0200
Message-ID: <53F72B8D.1080305@suse.de>
References: <53DCD74B.8090400@gmail.com> <1408539764-5835-1-git-send-email-afaerber@suse.de> <080101cfbdf6$c8fd1f30$5af75d90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57380 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751947AbaHVLhz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 07:37:55 -0400
In-Reply-To: <080101cfbdf6$c8fd1f30$5af75d90$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'Vincent Palatin' <vpalatin@chromium.org>, 'Doug Anderson' <dianders@chromium.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Tomasz Figa' <t.figa@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>

Am 22.08.2014 12:49, schrieb Kukjin Kim:
> Andreas F=C3=A4rber wrote:
>>
>> Allows them to be extended by reference.
>>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v6 -> v7:
>>  * Dropped uart* labels (Tomasz Figa)
>>
>>  v6: Split off from Snow/SMDK cleanups (Doug Anderson)
>>
>>  arch/arm/boot/dts/exynos5250.dtsi | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/e=
xynos5250.dtsi
>> index 492e1eff37bd..42eafd19cfb2 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -218,7 +218,7 @@
>>  		clock-names =3D "fimg2d";
>>  	};
>>
>> -	codec@11000000 {
>> +	mfc: codec@11000000 {
>>  		compatible =3D "samsung,mfc-v6";
>>  		reg =3D <0x11000000 0x10000>;
>>  		interrupts =3D <0 96 0>;
>> @@ -227,7 +227,7 @@
>>  		clock-names =3D "mfc";
>>  	};
>>
>> -	rtc@101E0000 {
>> +	rtc: rtc@101E0000 {
>>  		clocks =3D <&clock CLK_RTC>;
>>  		clock-names =3D "rtc";
>>  		status =3D "disabled";
>> @@ -261,7 +261,7 @@
>>  		clock-names =3D "uart", "clk_uart_baud0";
>>  	};
>>
>> -	sata@122F0000 {
>> +	sata: sata@122F0000 {
>>  		compatible =3D "snps,dwc-ahci";
>>  		samsung,sata-freq =3D <66>;
>>  		reg =3D <0x122F0000 0x1ff>;
>> @@ -573,7 +573,7 @@
>>  		#phy-cells =3D <1>;
>>  	};
>>
>> -	usb@12110000 {
>> +	ehci: usb@12110000 {
>=20
> I'm not sure which one is recommended between above and "ehci: ehci@1=
2110000 {"
>=20
>>  		compatible =3D "samsung,exynos4210-ehci";
>>  		reg =3D <0x12110000 0x100>;
>>  		interrupts =3D <0 71 0>;
>> @@ -588,7 +588,7 @@
>>  		};
>>  	};
>>
>> -	usb@12120000 {
>> +	ohci: usb@12120000 {
>=20
> Same as above...

A quick git-grep in v3.16.1 shows both ways used in arch/arm/boot/dts/:
 usb@: 232
 xhci@: 0
 ehci@: 41
 ohci@: 60
 uhci@: 7

>>  		compatible =3D "samsung,exynos4210-ohci";
>>  		reg =3D <0x12120000 0x100>;
>>  		interrupts =3D <0 71 0>;
>> @@ -725,7 +725,7 @@
>>  		clock-names =3D "gscl";
>>  	};
>>
>> -	hdmi {
>> +	hdmi: hdmi {
>=20
> Should be
>=20
> +	hdmi: hdmi@14530000 { ?

Actually, without applying this patch and my follow-up cleanups strictl=
y
using these new labels, we can't rename any of the nodes here, since it
would break the derived .dts files. It was specifically requested in v5
to make this patch here separate from subsequent uses of the new labels
for the benefit of cherry-picking.

So since you don't seem to disagree with the label names that I add
here, I consider renaming nodes outside the scope of this patch.

+1 for reflecting the reg address in the unit address of the hdmi node
as a follow-up to the refactorings, if that does not break any driver
assumptions.

Regards,
Andreas

>>  		compatible =3D "samsung,exynos4212-hdmi";
>>  		reg =3D <0x14530000 0x70000>;
>>  		interrupts =3D <0 95 0>;
>> @@ -751,14 +751,14 @@
>>  		#phy-cells =3D <0>;
>>  	};
>>
>> -	dp-controller@145B0000 {
>> +	dp: dp-controller@145B0000 {
>>  		clocks =3D <&clock CLK_DP>;
>>  		clock-names =3D "dp";
>>  		phys =3D <&dp_phy>;
>>  		phy-names =3D "dp";
>>  	};
>>
>> -	fimd@14400000 {
>> +	fimd: fimd@14400000 {
>>  		clocks =3D <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
>>  		clock-names =3D "sclk_fimd", "fimd";
>>  	};
>> --
>> 2.0.4

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
