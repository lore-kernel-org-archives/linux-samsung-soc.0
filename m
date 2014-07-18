From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv6 2/4] iio: adc: exynos_adc: Control special clock of ADC
 to support Exynos3250 ADC
Date: Sat, 19 Jul 2014 01:48:18 +0900
Message-ID: <CAGTfZH1jOEj8D6kJSd=-dgpSiU=sxs5W2TM=-rNtsZb-SkRD9Q@mail.gmail.com>
References: <1405663186-26464-1-git-send-email-cw00.choi@samsung.com>
	<32226622.5gSmvBRKvZ@wuerfel>
	<CAGTfZH3vz9MLN+1fPM22zKE64oMNDgcib3is0nfzZhhLkmdNvw@mail.gmail.com>
	<10264770.8SXiIS8qhq@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10264770.8SXiIS8qhq@wuerfel>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, naveen krishna <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 19, 2014 at 1:31 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Saturday 19 July 2014 01:11:53 Chanwoo Choi wrote:
>>
>>   Exynos3250/Exynos4/Exynos5 has 'adc' clock as following:
>>   - 'adc' clock: bus clock for ADC
>>
>>   Exynos3250 has additional 'sclk_adc' clock as following:
>>   - 'sclk_adc' clock: special clock for ADC which provide clock to internal ADC
>
> The bus clock is often named "apb_pclk", but it's too late to change
> that now, and it's not clear if the device is actually on APB.
>
> The problem with "sclk_adc" is that it's very close to the name used
> in the clock provider, with is CLK_SCLK_TSADC. Please try to avoid
> the ambiguity here and make it clear that they are not referring
> to the same thing. "internal" or "special" might be good if you want
> to avoid "sclk".

OK, thanks for your feedback.
I'll try to find proper name.

Chanwoo Choi
