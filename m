From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: exynos5410: Fill in CPU clock-frequency
Date: Fri, 04 Jul 2014 13:32:09 +0200
Message-ID: <53B690B9.2090906@suse.de>
References: <1403466596-3347-1-git-send-email-afaerber@suse.de> <53A7DCF8.4090108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A7DCF8.4090108@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, Ben Dooks <ben-linux@fluff.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am 23.06.2014 09:53, schrieb Tarek Dakhran:
> On 06/22/2014 11:49 PM, Andreas F=C3=A4rber wrote:
>> It's 1.6 GHz for the Cortex-A15.
>>
>> Avoids warnings like "/cpus/cpu@0 missing clock-frequency property".
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>   arch/arm/boot/dts/exynos5410.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5410.dtsi
>> b/arch/arm/boot/dts/exynos5410.dtsi
>> index 3839c26..9d0b8cc 100644
>> --- a/arch/arm/boot/dts/exynos5410.dtsi
>> +++ b/arch/arm/boot/dts/exynos5410.dtsi
>> @@ -28,24 +28,28 @@
>>               device_type =3D "cpu";
>>               compatible =3D "arm,cortex-a15";
>>               reg =3D <0x0>;
>> +            clock-frequency =3D <1600000000>;
>>  =20
>=20
> Reviewed-by: Tarek Dakhran<t.dakhran@samsung.com>

Ping? Seems really trivial...

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
