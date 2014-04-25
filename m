From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/5] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Fri, 25 Apr 2014 13:27:35 +0530
Message-ID: <535A156F.6060004@linaro.org>
References: <1396967803-28868-1-git-send-email-gautam.vivek@samsung.com> <1396967803-28868-2-git-send-email-gautam.vivek@samsung.com> <534BF28E.7040906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534BF28E.7040906-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/14/2014 08:07 PM, Sylwester Nawrocki wrote:
> On 08/04/14 16:36, Vivek Gautam wrote:
>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> index 28f9edb..6d99ba9 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> @@ -74,3 +74,45 @@ phy-consumer@12340000 {
>>  
>>  Refer to DT bindings documentation of particular PHY consumer devices for more
>>  information about required PHYs and the way of specification.
>> +
>> +Samsung Exynos5 SoC series USB DRD PHY controller
>> +--------------------------------------------------
>> +
>> +Required properties:
>> +- compatible : Should be set to one of the following supported values:
>> +	- "samsung,exynos5250-usbdrd-phy" - for exynos5250 SoC,
>> +	- "samsung,exynos5420-usbdrd-phy" - for exynos5420 SoC.
>> +- reg : Register offset and length of USB DRD PHY register set;
>> +- clocks: Clock IDs array as required by the controller
>> +- clock-names: names of clocks correseponding to IDs in the clock property;
>> +	       Required clocks:
>> +	- phy: main PHY clock (same as USB DRD controller i.e. DWC3 IP clock),
>> +	       used for register access.
>> +	- ref: PHY's reference clock (usually crystal clock), associated by
>> +	       phy name, used to determine bit values for clock settings
>> +	       register.
>> +	Additional clock required for Exynos5420:
>> +	- usb30_sclk_100m: Additional special clock used for PHY operation
>> +			   depicted as 'sclk_usbphy30' in CMU of Exynos5420.
>> +- samsung,syscon-phandle: phandle for syscon interface, which is used to
>> +			  control pmu registers for power isolation.
> 
> Why to append "-phandle" to the property's name ? If this is for PMU
> perhaps make it more explicit and name it: samsung,pmu-syscon or
> samsung,pmureg ?
> 

There are already a couple of nodes (watchdog and sata) using
samsung,syscon-phandle. IMHO, we should keep only property string for
syscon node. Either we keep syscon-phandle here or change sata/watchdog
driver to use the modified property name.

-- 
Tushar Behera
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
