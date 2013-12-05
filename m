From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt: exynos5250: Enable support for generic USB 3.0 phy
Date: Thu, 5 Dec 2013 13:47:45 +0530
Message-ID: <CAFp+6iH8Sobgjrxj4jmXwhLOCaJSRqe3v6wSFm7wU0vQu5qyDg@mail.gmail.com>
References: <1386151747-3209-1-git-send-email-gautam.vivek@samsung.com>
	<1386151747-3209-3-git-send-email-gautam.vivek@samsung.com>
	<2442031.907VFG2eGN@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2442031.907VFG2eGN@amdc1032>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


On Wed, Dec 4, 2013 at 6:20 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hi,
>
> Does the old phy-samsung-usb3 driver currently work on Exynos5250?  If yes,
> then this patch should be merged with patch #1 to preserve bisectability.

Yes, the old phy-samsung-usb3 driver works well on Exynos5250 currently.
Ok, will merge it with patch #1
[PATCH v2 1/4] phy: Add new Exynos5 USB 3.0 PHY driver

Thanks for pointing out.

>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
> On Wednesday, December 04, 2013 03:39:05 PM Vivek Gautam wrote:
>> Update device tree bindings for DWC3 controller and
>> USB 3.0 phy present on Exynos 5250 SoC, to start using
>> the phy driver based on generic phy framework.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |   16 ++++++----------
>>  1 files changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index 9db5047..7444717 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -475,22 +475,18 @@
>>                       compatible = "synopsys,dwc3";
>>                       reg = <0x12000000 0x10000>;
>>                       interrupts = <0 72 0>;
>> -                     usb-phy = <&usb2_phy &usb3_phy>;
>> +                     phys = <&usb3_phy>;
>> +                     phy-names = "usb3-phy";
>>               };
>>       };
>>
>>       usb3_phy: usbphy@12100000 {
>>               compatible = "samsung,exynos5250-usb3phy";
>>               reg = <0x12100000 0x100>;
>> -             clocks = <&clock 1>, <&clock 286>;
>> -             clock-names = "ext_xtal", "usbdrd30";
>> -             #address-cells = <1>;
>> -             #size-cells = <1>;
>> -             ranges;
>> -
>> -             usbphy-sys {
>> -                     reg = <0x10040704 0x8>;
>> -             };
>> +             clocks = <&clock 286>, <&clock 1>;
>> +             clock-names = "phy", "usb3phy_refclk";
>> +             samsung,syscon-phandle = <&pmu_syscon>;
>> +             #phy-cells = <0>;
>>       };
>>
>>       usb@12110000 {
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
