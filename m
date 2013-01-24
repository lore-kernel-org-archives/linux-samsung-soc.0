From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] iio: adc: add exynos5 adc driver under iio framwork
Date: Wed, 23 Jan 2013 16:42:54 -0800
Message-ID: <CAD=FV=VgrpPSLrwwrzFDFLBXTw+-t3C=UwnS6b53o41hxM_AyQ@mail.gmail.com>
References: <1358775470-21278-1-git-send-email-ch.naveen@samsung.com>
	<1358917086-4148-1-git-send-email-ch.naveen@samsung.com>
	<50FFDD2A.9040102@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FFDD2A.9040102-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Lars,

On Wed, Jan 23, 2013 at 4:52 AM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>> Few doubts regarding the mappings and child device handling.
>> Kindly, suggest me better methods.
>
> The patch looks mostly good now. As for the mappings, the problem is that we
> currently do not have any device tree bindings for IIO. So a proper solution
> would be to add dt bindings for IIO.

Can you explain more how you think this would work?  It seems like
just having child nodes as platform drivers would be OK (to me) and
having them instantiated with of_platform_populate() seems reasonable.

...but the one thing that is missing is a way for children to get
access to the channel properly.

The children have access to the ADC "struct device" (it is their
parent device) and have a channel number (their "reg" field), but
there is no API call to map this to a "struct iio_channel".  Is that
all that's needed in this case?  ...or are you envisioning something
more?


Thanks!  :)


-Doug
