From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Use define for s3c-rtc clock id
Date: Thu, 2 Apr 2015 12:16:58 +0200
Message-ID: <CAJKOXPf=aia+aeud-7V1YrDA1rhG3eyJrH_tcY-aEKTbVTTUGQ@mail.gmail.com>
References: <1427728889-29158-1-git-send-email-k.kozlowski@samsung.com>
	<551A1D27.6000301@samsung.com>
	<CABxcv=moU4xO=BNj6r4_O-VeL_OuAjCuoWiB9xsKWw9NjFTr9g@mail.gmail.com>
	<064c01d06b7f$aed30cf0$0c7926d0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <064c01d06b7f$aed30cf0$0c7926d0$@kernel.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-03-31 8:55 GMT+02:00 Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> Javier Martinez Canillas wrote:
>>
>> On Tue, Mar 31, 2015 at 6:05 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On 03/31/2015 12:21 AM, Krzysztof Kozlowski wrote:
>> >> Use a define instead of raw number as a ID for "rtc_src" clock.
>> >>
>> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >>
>> >> ---
>> >>
>> >> Patch depends on new file "dt-bindings/clock/samsung,s2mps11.h" from:
>> >> http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg43136.html
>> >> ---
>> >>  arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
>> >> index 3905824cac58..d2cbc95364de 100644
>> >> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>> >> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>> >> @@ -16,6 +16,7 @@
>> >>  #include "exynos3250.dtsi"
>> >>  #include <dt-bindings/input/input.h>
>> >>  #include <dt-bindings/gpio/gpio.h>
>> >> +#include <dt-bindings/clock/samsung,s2mps11.h>
>> >>
>> >>  / {
>> >>       model = "Samsung Rinato board";
>> >> @@ -605,7 +606,7 @@
>> >>  };
>> >>
>> >>  &rtc {
>> >> -     clocks = <&cmu CLK_RTC>, <&s2mps14_osc 0>;
>> >> +     clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>> >>       clock-names = "rtc", "rtc_src";
>> >>       status = "okay";
>> >>  };
>> >>
>> >
>> > Looks good to me.
>> >
>> > Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>>
> Thanks for you guys' review. Applied.

Thanks Kukjin! I forgot to do this also for exynos3250-monk board.
I'll send another patch for it but you may squash them if you want.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
