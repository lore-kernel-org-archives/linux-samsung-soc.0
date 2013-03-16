From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC: PATCH 2/2] iio: adc: exynos_adc: Handle timeout and race
 conditions
Date: Sat, 16 Mar 2013 15:41:30 +0100
Message-ID: <5144849A.8050907@metafoo.de>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com>	<51439846.9090201@metafoo.de> <CAD=FV=V+-DwCjGoookySCazazBBYOoRO+=G5Q_WXAw+SrXNc-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=V+-DwCjGoookySCazazBBYOoRO+=G5Q_WXAw+SrXNc-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/16/2013 01:37 AM, Doug Anderson wrote:
> On Fri, Mar 15, 2013 at 2:53 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>> What exactly is the spinlock protecting against here? Concurrent runs of
>> exynos_adc_isr? This is probably not issue in the first place.
>>
>> What you want to protect against is that completion is completed between the
>> call to INIT_COMPLETION() and the start of a new conversion. So the sections
>> that need to be under the spinlock are the complete call here and the point
>> from INIT_COMPLETION until the transfer is started in exynos_read_raw(). Make
>> sure to use spin_lock_irq there.
> 
> ...and at that point I _think_ you won't also need the mutex.
> 
> A reasonable way to test to see if you've got this all correct would be to:
> 
> * Start two processes that are reading from different ADCs that will
> report very different values (maybe add a device tree node for adc1 or
> adc7 and use those since they're not really connected to
> thermistors?).
> 
> * Have your two processes read as fast as they can.  This could just
> be "while true; do cat /sys/class/hwmon/hwmon0/device/temp1_input;
> done"
> 
> * Decrease your timeout and maybe(?) sprinkle some random udelays in
> the irq handler so that the timeouts happen sometimes but not others.
> 
> * Periodically cancel one of the readers with Ctrl-C
> 
> If all is working well then you should always get back the right value
> from the right reader (and get no crashes).
> 


I think you still need the mutex for serialization, otherwise the requests
would just cancel each other out. Btw. what happens if you start a conversion
while another is still in progress? Is it possible to abort a conversion?

- Lars
