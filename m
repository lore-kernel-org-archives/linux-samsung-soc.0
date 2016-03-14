From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 07/10] ARM: dts: Add thermal zone and cpufreq node for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 16:13:22 +0900
Message-ID: <56E66492.4070003@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-9-git-send-email-cw00.choi@samsung.com>
 <56E662F6.4070200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39487 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbcCNHNl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 03:13:41 -0400
In-reply-to: <56E662F6.4070200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 16:06, Krzysztof Kozlowski wro=
te:
> On 14.03.2016 11:04, Chanwoo Choi wrote:
>> This patch enables the CPU frequency scaling for exynos3250-artik5 m=
odule
>> and adds the thernal zones with cpu cooling device to prevent the ov=
erheat
>> temperature.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 23 +++++++++++++++++++++=
++
>>  1 file changed, 23 insertions(+)
>=20
> The patch looks good but just squash it with 5/10 unless there is som=
e
> benefit by splitting the features for many patches. The benefit would=
 be
> for example submitting the work partially, in steps, following princi=
ple
> release-early-release-often... but this is not the case. You have
> everything ready and tested.

OK. I'll merge this patch with 5/10 patch.

Best Regards,
Chanwoo Choi

>=20
> BR,
> Krzysztof
>=20
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boo=
t/dts/exynos3250-artik5.dtsi
>> index 75b291c10cdc..877e4827df83 100644
>> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> @@ -31,6 +31,25 @@
>>  		compatible =3D "samsung,secure-firmware";
>>  		reg =3D <0x0205F000 0x1000>;
>>  	};
>> +
>> +	thermal-zones {
>> +		cpu_thermal: cpu-thermal {
>> +			cooling-maps {
>> +				map0 {
>> +					/* Corresponds to 500MHz */
>> +					cooling-device =3D <&cpu0 5 5>;
>> +				};
>> +				map1 {
>> +					/* Corresponds to 200MHz */
>> +					cooling-device =3D <&cpu0 8 8>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&cpu0 {
>> +	cpu0-supply =3D <&buck2_reg>;
>>  };
>> =20
>>  &i2c_0 {
>> @@ -296,6 +315,10 @@
>>  	status =3D "okay";
>>  };
>> =20
>> +&tmu {
>> +	status =3D "okay";
>> +};
>> +
>>  &xusbxti {
>>  	clock-frequency =3D <24000000>;
>>  };
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
