From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: DTS: Add NTC thermistor nodes as child nodes to ADC
Date: Wed, 25 Jun 2014 09:37:14 +0200
Message-ID: <CABxcv=mTo9Qus+ZY-BSrcanfwvOF1KRc1rcQkq0pnBg12ftF-w@mail.gmail.com>
References: <1403612356-23685-1-git-send-email-ch.naveen@samsung.com>
	<1403612356-23685-5-git-send-email-ch.naveen@samsung.com>
	<CAD=FV=Wmi73S4c5TPUqnNyycQ5xX5SbYy_ES-cbbJF2Hr0tqvQ@mail.gmail.com>
	<CAHfPSqAAWFtCQQrKBhLFuE2OuO_fwmUOhcOX9zKk8eMRMNSVvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHfPSqAAWFtCQQrKBhLFuE2OuO_fwmUOhcOX9zKk8eMRMNSVvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Naveen,

On Wed, Jun 25, 2014 at 7:04 AM, Naveen Krishna Ch
<naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Doug,
>
> On 25 June 2014 03:24, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Naveen,
>>
>> On Tue, Jun 24, 2014 at 5:19 AM, Naveen Krishna Chatradhi
>> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Exynos5420 based Peach PIT and Exynos5800 based PI boards have
>>> 4 NTC thermistors to measure temperatures at various points on the
>>> board.
>>>
>>> IIO based ADC becomes the parent and NTC thermistors are the childs,
>>> via the HWMON interface.
>>>
>>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> ---
>>> This patch needs
>>> 1. MAX77802 PMIC device tree nodes (for ldo9)
>>>    https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg31430.html
>>> 2. Uses the DT documentation for NTC thermistors updated with vendor-prefix
>>>
>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   32 ++++++++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>
>> * You forgot: status="okay" for the ADC.  One might question how this
>> patch was tested.
>
> Will correct it.
>
>>
>> * Please also include this change for pi.
>
> MAX77802 device node was not added for Peach_PI (exynos5800-peach-pi.dts).
> I guess, Javier have a plan to send.
>

That's correct. I didn't include the changes to Peach Pi since I only
have a Pit to test but I'll add it on the next version so you can have
that patch as a dependency and use the MAX77802 LD9 regulator.

> I will edit the commit message to remove Peach_PI for now.
>
> Also, we have few similar nodes on Peach PI  and Peach PIT.
> Any plans or discussion on merging the common nodes ?
>
>>
>> * We just got through the painful process of sorting this .dts file.
>> Please sort "&adc" alphabetically.  Kukjin: please confirm that you
>> will keep an eye on patches and make sure that they are sorted OK.
>>
>>
>> Other than those problems this seems to work fine to me.
>>
>> -Doug
>
> Thanks for the Review.
>
>
> --
> Shine bright,
> (: Nav :)

Best regards,
Javier
