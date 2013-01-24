From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] iio: adc: add exynos5 adc driver under iio framwork
Date: Thu, 24 Jan 2013 19:19:57 +0100
Message-ID: <51017B4D.7000105@metafoo.de>
References: <1358775470-21278-1-git-send-email-ch.naveen@samsung.com> <1358917086-4148-1-git-send-email-ch.naveen@samsung.com> <50FFDD2A.9040102@metafoo.de> <CAD=FV=VgrpPSLrwwrzFDFLBXTw+-t3C=UwnS6b53o41hxM_AyQ@mail.gmail.com> <510104BD.2020500@metafoo.de> <CAD=FV=VRKqeRxvcV1-aQCbu0FoTpMiVVXoNiVEx5SxLe3N_tgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VRKqeRxvcV1-aQCbu0FoTpMiVVXoNiVEx5SxLe3N_tgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/24/2013 05:12 PM, Doug Anderson wrote:
> Lars,
> 
> Thank you for your comments / thoughts...
> 

Hi,

> 
> On Thu, Jan 24, 2013 at 1:54 AM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>> adc: adc@12D10000 {
>>
>>         #io-channel-cells = <1>;
>>         io-channel-output-names = "adc1", "adc2", ...;
>>
>>         ncp15wb473@0 {
>>                 compatible = "ntc,ncp15wb473";
>>                 ...
>>                 io-channels = <&adc 0>; // First ADC channel
> 
> I'm not an expert, but I think the typical way is:
> * No need to include a handle to &adc.  It's logically our parent.  In
> a similar way i2c devices don't specify their parent bus--they are
> just listed under it.
> * The "0" should be specified with reg = <0>

The relationship between the IIO sensor device and the consumer device is
not always a parent child relationship. In this case it makes sense to have
the ADC as the parent for the thermistors. But for other cases this may not
be true. E.g. take a touchscreen or power monitoring platform device which
uses the IIO device to do measurements.

> 
> To implement this I'd imagine that we'll need a new API call, right?
> In this case the thermistor driver won't know the name of the channel.
>  It can find the ADC (the struct device and probably other things) and
> knows a channel index.  Am I understanding properly?

This can be done by adding a new api call, but it would be best if both dt
and non-dt based consumers can use the same function. I outlined one
possible solution how this can be done in the previous mail to Naveen.

- Lars
