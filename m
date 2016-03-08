From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] ARM: dts: add "simple-bus" where "arm,amba-bus" is
 used alone
Date: Tue, 8 Mar 2016 09:58:24 +0100
Message-ID: <CAMuHMdWwCdFSN7tAMa7ffjhSFD2DppV4SrzFB0pmshYvA2RYmw@mail.gmail.com>
References: <1457415977-3401-1-git-send-email-yamada.masahiro@socionext.com>
	<CAL_JsqJvT+4efH-+_EhehzwhHZsrYTX8pa1NLsg_Wn4YReN4Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJvT+4efH-+_EhehzwhHZsrYTX8pa1NLsg_Wn4YReN4Ag@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "arm@kernel.org" <arm@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, David Brown <david.brown@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Wei Xu <xuwei5@hisilicon.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 8, 2016 at 9:49 AM, Rob Herring <robh+dt@kernel.org> wrote:
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

It may have a side-effect: currently "arm.amba-bus" is only treated equivalent
to  "simple-bus" if CONFIG_ARM_AMBA is enabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
