From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv6 1/4] iio: adc: exynos_adc: Add exynos_adc_data structure
 to improve readability
Date: Fri, 18 Jul 2014 15:41:27 +0530
Message-ID: <CAHfPSqBDOEH5HurG=rECV=d+MM_YjTEpsiwuTgtNgFgCQ0P2bw@mail.gmail.com>
References: <1405663186-26464-1-git-send-email-cw00.choi@samsung.com>
 <1405663186-26464-2-git-send-email-cw00.choi@samsung.com> <6186153.TIYp5NXPIq@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6186153.TIYp5NXPIq@wuerfel>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, My self <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Arnd,

On 18 July 2014 15:12, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 18 July 2014 14:59:43 Chanwoo Choi wrote:
>> This patchset add 'exynos_adc_data' structure which includes some functions
>> to control ADC operation and specific data according to ADC version (v1 or v2).
>>
>
> This new structure makes a lot of sense for covering the exynos specific
> versions, but it will likely give a little more complexity for the
> older models. We'll have to deal with that later then, no need to
> hold up your patch. Interestingly, the version numbers seem weird. The
> old driver uses
>
>         {
>                 .name           = "s3c24xx-adc",
>                 .driver_data    = TYPE_ADCV1,
>         }, {
>                 .name           = "s3c2443-adc",
>                 .driver_data    = TYPE_ADCV11,
>         }, {
>                 .name           = "s3c2416-adc",
>                 .driver_data    = TYPE_ADCV12,
>         }, {
>                 .name           = "s3c64xx-adc",
>                 .driver_data    = TYPE_ADCV2,
>         }, {
>                 .name           = "samsung-adc-v3",
>                 .driver_data    = TYPE_ADCV3,
>         }
>
> Where TYPE_ADCV3 seems to be the same as the new ADC_V1 used in this
> driver. Do you have an explanation for that?

As per suggestion from Doug Anderson,
I've implemented IIO based ADC driver to work with Exynos5250.
keeping the plat-samsung/adc.c unchanged.

Assuming Exynos5250 is the one using the driver for the first time.
i've named it v1 and so on.

Now, This seems to cause a lot of confusion.

>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
