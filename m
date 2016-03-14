From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/10] ARM: dts: Add rtc and adc dt node for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 16:21:08 +0900
Message-ID: <56E66664.3020405@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-10-git-send-email-cw00.choi@samsung.com>
 <56E66462.9000402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <56E66462.9000402-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 16:12, Krzysztof Kozlowski wro=
te:
> On 14.03.2016 11:04, Chanwoo Choi wrote:
>> This patch adds the RTC (Real Time Clock) and ADC (Analog Digital Co=
nverter)
>> Device Tree node for exynos3250-artik5 module. The RTC is used for w=
akeup
>> source and the ADC is used to read the analog data such as battery t=
emperature.
>>
>> ADC need to connect the some H/W device such as battery. So, this pa=
tch just
>> adds the default setting (clock, regulator).
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boo=
t/dts/exynos3250-artik5.dtsi
>> index 877e4827df83..673883fda480 100644
>> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> @@ -48,6 +48,12 @@
>>  	};
>>  };
>> =20
>> +&adc {
>> +	vdd-supply =3D <&ldo7_reg>;
>> +	assigned-clocks =3D <&cmu CLK_SCLK_TSADC>;
>> +	assigned-clock-rates =3D <6000000>;
>> +};
>=20
> No thermistors, status non-okay. What is provided here?

The some device are not connected for ADC line on artik5-eval board.
This dt node just initialize the basic setting (clock,regulator) ADC of=
 exynos3250 SoC.
(I'll change the board name from artik5-devel to artik5-eval on v2 patc=
hset)

The vdd-supply for ADC is already fixed on artik5 module.

>=20
>> +
>>  &cpu0 {
>>  	cpu0-supply =3D <&buck2_reg>;
>>  };
>> @@ -319,6 +325,12 @@
>>  	status =3D "okay";
>>  };
>> =20
>> +&rtc {
>> +	clocks =3D <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>> +	clock-names =3D "rtc", "rtc_src";
>> +	status =3D "okay";
>> +};
>=20
> Same comment as for previous patch - just squash it. Splitting brings=
 no
> benefits and makes it more difficult to see bigger picture.

Okay. I'll merge it with 5/10 patch.

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
