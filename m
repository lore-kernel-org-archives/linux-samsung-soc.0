From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Wed, 7 Nov 2012 18:55:03 +0530
Message-ID: <CAFp+6iGFwTAvhamhoQszBL8QUau64XtDWGR1yX0azbuw1iWgVA@mail.gmail.com>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
	<1352215729-11703-2-git-send-email-gautam.vivek@samsung.com>
	<20121106164304.GD3993@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121106164304.GD3993-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


On Tue, Nov 6, 2012 at 10:13 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, Nov 06, 2012 at 08:58:49PM +0530, Vivek Gautam wrote:
>> Adding DWC3 device tree node for Exynos5250 along with the
>> device address and clock support needed for the controller.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
>>  arch/arm/mach-exynos/clock-exynos5.c    |   24 ++++++++++++++++++++++++
>>  arch/arm/mach-exynos/include/mach/map.h |    1 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
>>  drivers/usb/Kconfig                     |    1 +
>>  5 files changed, 34 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index cf6a02d..52bca54 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -68,6 +68,12 @@
>>               interrupts = <0 96 0>;
>>       };
>>
>> +     dwc3 {
>
> shouldn't this be usb@12000000 ??
>
Kept this in accordance with controller's name, similar to the change
in following:
http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg12800.html

Needs to be changed ?

>> +             compatible = "samsung,exynos-dwc3";
>> +             reg = <0x12000000 0x10000>;
>> +             interrupts = <0 72 0>;
>> +     };
>> +
>>       rtc {
>>               compatible = "samsung,s3c6410-rtc";
>>               reg = <0x101E0000 0x100>;
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
>> index a88e0d9..ee094ee 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -740,6 +740,11 @@ static struct clk exynos5_init_clocks_off[] = {
>>               .enable         = exynos5_clk_ip_fsys_ctrl ,
>>               .ctrlbit        = (1 << 18),
>>       }, {
>> +             .name           = "usbdrd30",
>> +             .parent         = &exynos5_clk_aclk_200.clk,
>> +             .enable         = exynos5_clk_ip_fsys_ctrl,
>> +             .ctrlbit        = (1 << 19),
>> +     }, {
>>               .name           = "usbotg",
>>               .enable         = exynos5_clk_ip_fsys_ctrl,
>>               .ctrlbit        = (1 << 7),
>> @@ -1004,6 +1009,16 @@ struct clksrc_sources exynos5_clkset_group = {
>>       .nr_sources     = ARRAY_SIZE(exynos5_clkset_group_list),
>>  };
>>
>> +struct clk *exynos5_clkset_usbdrd30_list[] = {
>> +     [0] = &exynos5_clk_mout_mpll.clk,
>> +     [1] = &exynos5_clk_mout_cpll.clk,
>
> looks like [0] and [1] indexes are unnecessary ?!? Not sure about
> mach-exynos' preferred array initialization style, though ;-)
>
These are in sync with code-style in mach-exynos/clock-exynos5.c
Probably this is how it is used with mach-exynos.

>> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
>> index 4c90b51..0454b8a 100644
>> --- a/drivers/usb/Kconfig
>> +++ b/drivers/usb/Kconfig
>> @@ -53,6 +53,7 @@ config USB_ARCH_HAS_EHCI
>>  # some non-PCI HCDs implement xHCI
>>  config USB_ARCH_HAS_XHCI
>>       boolean
>> +     default y if ARCH_EXYNOS5
>
> NAK, this should be done on your arch/arm/mach-exynos/Kconfig. Just
> select USB_ARCH_HAS_XHCI.
>
Oops !! Sure, will move this to arch/arm/mach-exynos/Kconfig.

> --
> balbi



--
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
