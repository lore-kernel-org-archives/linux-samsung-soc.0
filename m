From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] ARM: dts: add "simple-bus" where "arm,amba-bus" is
 used alone
Date: Wed, 9 Mar 2016 13:32:12 +0900
Message-ID: <CAK7LNARcnsgqzsRFStUiWsFQZG8GiJRbxARDbtd51+RaVs97pQ@mail.gmail.com>
References: <1457415977-3401-1-git-send-email-yamada.masahiro@socionext.com>
	<CAL_JsqJvT+4efH-+_EhehzwhHZsrYTX8pa1NLsg_Wn4YReN4Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJvT+4efH-+_EhehzwhHZsrYTX8pa1NLsg_Wn4YReN4Ag@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "arm@kernel.org" <arm@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, David Brown <david.brown@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Wei Xu <xuwei5@hisilicon.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org"linux-arm-kernel@lists.infradead.org" <linux-ar>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob,


2016-03-08 17:49 GMT+09:00 Rob Herring <robh+dt@kernel.org>:
> On Mon, Mar 7, 2016 at 11:46 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The compatible string "simple-bus" is well defined in ePAPR, while
>> I see no documentation for the "arm,amba-bus" in ePAPR or under
>> Documentation/devicetree/.
>>
>> DT is also used by other projects than Linux kernel.  It is not a
>> good idea to rely on such an unofficial binding.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v2:
>>   - Rephrase the git-log
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/axm55xx.dtsi b/arch/arm/boot/dts/axm55xx.dtsi
>> index ea288f0..8da4582 100644
>> --- a/arch/arm/boot/dts/axm55xx.dtsi
>> +++ b/arch/arm/boot/dts/axm55xx.dtsi
>> @@ -107,7 +107,7 @@
>>                 };
>>
>>                 amba {
>> -                       compatible = "arm,amba-bus";
>> +                       compatible = "arm,amba-bus", "simple-bus";
>
> As I mentioned in the last version, I think you should remove
> arm,amba-bus and just have simple-bus. I don't believe anything relies
> on having arm,amba-bus.

Sorry about this.

V3 is here now:
https://patchwork.kernel.org/patch/8542031/




-- 
Best Regards
Masahiro Yamada
