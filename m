From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 11 Jan 2017 17:40:09 +0900
Message-ID: <5875EF69.1070803@samsung.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas1p4b29b1308a0b8088afd46a475770d4b00@epcas1p4.samsung.com>
 <1484116439-7275-4-git-send-email-hoegeun.kwon@samsung.com>
 <f292435b-8faa-d2e9-17f6-99a4d00173c5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <f292435b-8faa-d2e9-17f6-99a4d00173c5-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



2017년 01월 11일 16:46에 Andrzej Hajda 이(가) 쓴 글:
> On 11.01.2017 07:33, Hoegeun Kwon wrote:
>> From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> This patch add the panel device tree node for S6E3HA2 display
>> controller to TM2 dts.
>>
>> Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Tested-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> index ddba2f8..6d362f9 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> @@ -18,6 +18,18 @@
>>  	compatible = "samsung,tm2", "samsung,exynos5433";
>>  };
>>  
>> +&dsi {
>> +	panel@0 {
>> +		compatible = "samsung,s6e3ha2";
>> +		reg = <0>;
>> +		vdd3-supply = <&ldo27_reg>;
>> +		vci-supply = <&ldo28_reg>;
>> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
>> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
> The same here (as in 1st comment) , te-gpios should be dropper - decon
> uses hw-trigger.

Reasonable to remove te-gpios property but this change would make MIPI-DSI driver probing to be failed so MIPI-DSI driver should be fixed together.

Thanks.

> 
> Regards
> Andrzej
>> +	};
>> +};
>> +
>>  &hsi2c_9 {
>>  	status = "okay";
>>  
> 
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
