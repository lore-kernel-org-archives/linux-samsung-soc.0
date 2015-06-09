From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RESEND] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Tue, 09 Jun 2015 21:32:19 +0900
Message-ID: <5576DCD3.2010709@samsung.com>
References: <1433678028-8441-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433678028-8441-1-git-send-email-linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 07.06.2015 o 20:53, Anand Moon pisze:
> Enable regulator for usbdrd3_0 and usbdrd3_1.
> Looking at the schematic pin diagram for MAX77802
> USB3_0 and USB3_1 is regulated by LDO9 and LD011.
> 
> Fix the boot message of failed.
> [    3.503539] exynos-dwc3 usb@12000000: Looking up vdd33-supply from device tree
> [    3.503556] exynos-dwc3 usb@12000000: Looking up vdd33-supply property in node /usb@12000000 failed
> [    3.503568] usb@12000000 supply vdd33 not found, using dummy regulator
> [    3.509154] exynos-dwc3 usb@12000000: Looking up vdd10-supply from device tree
> [    3.509170] exynos-dwc3 usb@12000000: Looking up vdd10-supply property in node /usb@12000000 failed
> [    3.509181] usb@12000000 supply vdd10 not found, using dummy regulator
> [    3.917548] exynos-dwc3 usb@12400000: Looking up vdd33-supply from device tree
> [    3.917565] exynos-dwc3 usb@12400000: Looking up vdd33-supply property in node /usb@12400000 failed
> [    3.917578] usb@12400000 supply vdd33 not found, using dummy regulator
> [    3.922731] exynos-dwc3 usb@12400000: Looking up vdd10-supply from device tree
> [    3.922747] exynos-dwc3 usb@12400000: Looking up vdd10-supply property in node /usb@12400000 failed
> 
> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Thanks, applied with minor adjustments in commit message (joined first
three sentences into one paragraph, changed description of dmesg).

I'll send later to Kukjin for 4.3 (unless he picks it also).

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
