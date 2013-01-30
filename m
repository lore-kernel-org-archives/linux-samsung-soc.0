From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: Exynos5250: Enabling samsung-usbphy driver
Date: Wed, 30 Jan 2013 13:49:14 +0530
Message-ID: <CAFp+6iGfLWpnq5AXjCVieaDUU94bJFaLAkSWPTz0Sj3=ec_56g@mail.gmail.com>
References: <1358868680-5757-1-git-send-email-gautam.vivek@samsung.com>
	<1358868680-5757-2-git-send-email-gautam.vivek@samsung.com>
	<076f01cdfea7$8e752d90$ab5f88b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <076f01cdfea7$8e752d90$ab5f88b0$@samsung.com>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Wed, Jan 30, 2013 at 10:36 AM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Vivek Gautam wrote:
>>
>> Adding usbphy node for Exynos5250 along with the
>> necessary device data to be parsed.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
>>  1 files changed, 15 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> b/arch/arm/boot/dts/exynos5250.dtsi
>> index 30485de..610e338 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -275,6 +275,21 @@
>>               #size-cells = <0>;
>>       };
>>
>> +     usbphy@12130000 {
>
> Please put above node by order of address.
>

Sure will do that. Actually thought the listing was as per IPs.

>> +             compatible = "samsung,exynos5250-usbphy";
>> +             reg = <0x12130000 0x100>;
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +
>> +             usbphy-sys {
>> +                           /* USB device and host PHY_CONTROL registers
> */
>
> Please add the binding documentation instead of comment here.
>

Bindings documentation already added at
"Documentation/devicetree/bindings/usb/samsung-usbphy.txt"
merged in 'usb-next'.

>> +                     reg = <0x10040704 0x8>,
>> +                           /* USB2.0 PHY configuration register */
>> +                           <0x10050230 0x4>;
>> +             };
>> +     };
>> +
>>       amba {
>>               #address-cells = <1>;
>>               #size-cells = <1>;
>> --
>> 1.7.6.5
>




-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
