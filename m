From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add hdmi regulators for exynos5800 based
 peach-pi board
Date: Thu, 26 Jun 2014 15:15:45 +0530
Message-ID: <CAPdUM4NMD_ggwsOSexZkwUahLScFtHUD-9vhN0p8jJZyKVxk9g@mail.gmail.com>
References: <1403760382-12533-1-git-send-email-rahul.sharma@samsung.com>
	<CABxcv=ncVTiFX+YYguyk0XJDC6WTYnvJeivzf-4wOLwETmzK9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABxcv=ncVTiFX+YYguyk0XJDC6WTYnvJeivzf-4wOLwETmzK9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 26 June 2014 13:11, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:
> Hello Rahul,
>
> On Thu, Jun 26, 2014 at 7:26 AM, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Adding regulators for HDMI for exynos5800 based Peach-pi board.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Based on Kukjin's for-next branch.
>> Depends on:
>> 1) PMIC addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg33166.html
>> 2) tps65090 addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg32464.html
>>
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> index 2c2c137..30d1a26 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -127,6 +127,10 @@
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&hdmi_hpd_irq>;
>>         ddc = <&i2c_2>;
>> +       hdmi-en-supply = <&tps65090_fet7>;
>> +       vdd-supply = <&ldo8_reg>;
>> +       vdd_osc-supply = <&ldo10_reg>;
>> +       vdd_pll-supply = <&ldo8_reg>;
>
> You had a line break between the ddc and the supplies on your patch
> for Peach pit, can you please add it here as well?
>
> I think that is more readable and also we may later factor out common
> DTS fragments on these two boards in .dtsi include files so is better
> to keep the diff as small as possible.
>
>>  };
>>
>>  &hsi2c_7 {
>> --
>> 1.7.9.5
>>
>
> With that trivial change:

Sure. Thanks Javier.

>
> Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>
> Best regards,
> Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
