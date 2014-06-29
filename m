From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv5 0/4] iio: adc: exynos_adc: Support Exynos3250 ADC and
 code clean
Date: Mon, 30 Jun 2014 08:32:41 +0900
Message-ID: <53B0A219.2000301@samsung.com>
References: <1403843406-28229-1-git-send-email-cw00.choi@samsung.com>
 <53AD54EC.2050606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <53AD54EC.2050606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 06/27/2014 08:26 PM, Tomasz Figa wrote:
> Hi Chanwoo,
> 
> On 27.06.2014 06:30, Chanwoo Choi wrote:
>> Changes from v4:
>> - Use 'exynos_adc_data' structure instead of 'exynos_adc_ops' structure
>>   and remove enum variable of ADC version
>> - Fix wrong name of special clock (sclk_tsadc -> sclk_adc)
>> - Add reviewed message by Naveen Krishna Chatradhi
>> - Add functions for ADC clock control
>>
>> Changes from v3:
>> - Add new 'exynos_adc_ops' structure to improve readability according to
>>  Tomasz Figa comment[1]
>>  [1] https://lkml.org/lkml/2014/4/16/238
>> - Add new 'exynos3250-adc-v2' compatible string to support Exynos3250 ADC
>> - Fix wrong compaitlbe string of ADC in Exynos3250 dtsi file
>>
>> Changes from v2:
>> - Check return value of clock function to deal with error exception
>> - Fix minor coding style to improve readability
>>
>> Changes from v1:
>> - Add new "samsung,exynos-adc-v3" compatible to support Exynos3250 ADC
>> - Add a patch about DT binding documentation
>>
>> Chanwoo Choi (4):
>>   iio: adc: exynos_adc: Add exynos_adc_data structure to improve readability
>>   iio: adc: exynos_adc: Control special clock of ADC to support Exynos3250 ADC
>>   iio: devicetree: Add DT binding documentation for Exynos3250 ADC
>>   ARM: dts: Fix wrong compatible string for Exynos3250 ADC
>>
>>  .../devicetree/bindings/arm/samsung/exynos-adc.txt |  26 +-
>>  arch/arm/boot/dts/exynos3250.dtsi                  |   4 +-
>>  drivers/iio/adc/exynos_adc.c                       | 326 +++++++++++++++------
>>  3 files changed, 268 insertions(+), 88 deletions(-)
>>
> 
> For the whole series:
> 
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks for your review.

Best Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
