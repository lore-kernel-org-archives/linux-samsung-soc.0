From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: Exynos5250: Enabling ehci-s5p driver
Date: Thu, 6 Dec 2012 16:08:46 +0530
Message-ID: <CAFp+6iGWngzZN-C3UrvXwT=6PNZqYfrpAjD1_8DTS257v7cJFw@mail.gmail.com>
References: <1352357665-7435-1-git-send-email-gautam.vivek@samsung.com>
	<1352357665-7435-2-git-send-email-gautam.vivek@samsung.com>
	<20121206101645.4C28E3E05A4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121206101645.4C28E3E05A4@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 6, 2012 at 3:46 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, 08 Nov 2012 12:24:24 +0530, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Adding EHCI device tree node for Exynos5250 along with
>> the device base adress and gpio line for vbus.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/usb/exynos-usb.txt         |   25 ++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++
>>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
>>  5 files changed, 38 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> new file mode 100644
>> index 0000000..833f5cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> @@ -0,0 +1,25 @@
>> +Samsung Exynos SoC USB controller
>> +
>> +The USB devices interface with USB controllers on Exynos SOCs.
>> +The device node has following properties.
>> +
>> +EHCI
>> +Required properties:
>> + - compatible: should be "samsung,exynos-ehci" for USB 2.0
>
> Ditto here. Please be specific in compatible strings.  "samsung,exynos5250-ehci"
>
> Otherwise the binding looks fine to me.
>

Again here, the compatible string is added as per
"drivers/usb/host/ehci-s5p.c", since same driver works across exynos.
Please suggest do we need driver side change also to accomodate this ?

> g.
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss



-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
