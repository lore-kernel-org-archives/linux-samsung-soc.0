From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: adc: exynos_adc: Add support for S3C24xx ADC
Date: Mon, 28 Jul 2014 20:03:33 +0900
Message-ID: <53D62E05.3080803@samsung.com>
References: <1405995074-3271-1-git-send-email-cw00.choi@samsung.com>
 <1405995074-3271-3-git-send-email-cw00.choi@samsung.com>
 <53D562AD.4090706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <53D562AD.4090706-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/28/2014 05:35 AM, Hartmut Knaack wrote:
> Chanwoo Choi schrieb:
>> This patch add support for s3c2410/s3c2416/s3c2440/s3c2443 ADC. The s3c24xx
>> is alomost same as ADCv1. But, There are a little difference as following:
>> - ADCMUX register address to select channel
>> - ADCDAT mask (10bit or 12bit ADC resolution according to SoC version)
> Hi, just some style issues: better separate things like 10bit with a space to 10 bit, there are some instances of this type in your code. Another issue inline.

OK I'll fix it.

>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/samsung/exynos-adc.txt | 10 ++-
>>  drivers/iio/adc/exynos_adc.c                       | 89 +++++++++++++++++++++-
>>  2 files changed, 96 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> index b6e3989..fe34c76 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>> @@ -11,11 +11,19 @@ New driver handles the following
>>  
>>  Required properties:
>>  - compatible:		Must be "samsung,exynos-adc-v1"
>> -				for exynos4412/5250 controllers.
>> +				for exynos4412/5250 and s5pv210 controllers.
>>  			Must be "samsung,exynos-adc-v2" for
>>  				future controllers.
>>  			Must be "samsung,exynos3250-adc" for
>>  				controllers compatible with ADC of Exynos3250.
>> +			Must be "samsung,s3c2410-adc" for
>> +				the ADC in s3c2410 and compatibles
>> +			Must be "samsung,s3c2416-adc" for
>> +				the ADC in s3c2416 and compatibles
>> +			Must be "samsung,s3c2440-adc" for
>> +				the ADC in s3c2440 and compatibles
>> +			Must be "samsung,s3c2443-adc" for
>> +				the ADC in s3c2443 and compatibles
>>  			Must be "samsung,s3c6410-adc" for
>>  				the ADC in s3c6410 and compatibles
>>  - reg:			Contains ADC register address range (base address and
>> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
>> index 05bdd2f12..7d28032 100644
>> --- a/drivers/iio/adc/exynos_adc.c
>> +++ b/drivers/iio/adc/exynos_adc.c
>> @@ -51,6 +51,9 @@
>>  #define ADC_V1_MUX(x)		((x) + 0x1c)
>>  #define ADC_V1_CLRINTPNDNUP(x)	((x) + 0x20)
>>  
>> +/* S3C2410 ADC registers definitions */
>> +#define ADC_S3C2410_MUX(x)	((x) + 0x18)
>> +
>>  /* Future ADC_V2 registers definitions */
>>  #define ADC_V2_CON1(x)		((x) + 0x00)
>>  #define ADC_V2_CON2(x)		((x) + 0x04)
>> @@ -67,6 +70,8 @@
>>  
>>  /* Bit definitions for S3C2410 ADC */
>>  #define ADC_S3C2410_CON_SELMUX(x) (((x) & 7) <<3)
>> +#define ADC_S3C2410_DATX_MASK	0x3FF
>> +#define ADC_S3C2416_CON_RES_SEL	(1 << 3)
> Since it is done this way in this driver, better use (1u << 3) here.

OK, I'll fix it.

Best Regards,
Chanwoo Choi
