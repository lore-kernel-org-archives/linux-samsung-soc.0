From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Properly use the "noirq" variants of suspend/resume
Date: Tue, 24 Jun 2014 00:31:37 +0200
Message-ID: <53A8AAC9.8030407@gmail.com>
References: <1403155273-1057-1-git-send-email-dianders@chromium.org>	<7h8uosyc3k.fsf@paris.lan>	<CAD=FV=XxNVmF+N5HF4SnZoJRJvkSUkpEx6ct4v2gtmAQ9n28-Q@mail.gmail.com>	<7hwqcbs166.fsf@paris.lan>	<CAD=FV=Uz9O0i2gmuk2+BHa-Tksvyxv0+MTi2UEjVREAMNCK7Ug@mail.gmail.com>	<7h7g4brx6w.fsf@paris.lan>	<CAD=FV=VmPMf6tCNmKJ1o5J7PyAXoU8fb6+s+Fkv18FH2WaQp7A@mail.gmail.com>	<53A4CADA.4030002@gmail.com>	<CAD=FV=VkxA01eEFiXSp+c+GDuVJi7TctAdnyrMggk1gRw6BStQ@mail.gmail.com>	<7ha993p8v4.fsf@paris.lan> <CAD=FV=U0P2kyfnxdU2E1Gm8TdD_cFd6brmtQ7-gpajNJuKmWSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=U0P2kyfnxdU2E1Gm8TdD_cFd6brmtQ7-gpajNJuKmWSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, naveen krishna <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 24.06.2014 00:27, Doug Anderson wrote:
> Kevin,
> 
> On Mon, Jun 23, 2014 at 3:19 PM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:
>>
>> [...]
>>
>>> On Fri, Jun 20, 2014 at 4:59 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>
>>>> I'm not sure noirq is going to work correctly, at least not with current
>>>> callbacks. I can see a call to clk_prepare_enable() there which needs to
>>>> acquire a mutex.
>>>
>>> Nice catch, thanks!  :)
>>>
>>> OK, looking at that now.  Interestingly this doesn't seem to cause us
>>> problems in our ChromeOS 3.8 tree.  I just tried enabling:
>>>   CONFIG_DEBUG_ATOMIC_SLEEP=y
>>>
>>> ...and confirmed that I got it on right:
>>>
>>> # zgrep -i atomic /proc/config.gz
>>> CONFIG_DEBUG_ATOMIC_SLEEP=y
>>>
>>> I can suspend/resume with no problems.  My bet is that it works fine because:
>>>
>>> * resume_noirq is not considered "atomic" in the sense enforced by
>>> CONFIG_DEBUG_ATOMIC_SLEEP (at least not in 3.8--I haven't tried on
>>> ToT)
>>
>> The reason is because "noirq" in the suspend/resume path actually means
>> no *device* IRQs for that specific device.
>>
>> It's often assumed that the "noirq" callbacks are called with *all*
>> interrupts disabled, but that's not the case.  Only the IRQs for that
>> specific device are disabled when its noirq callbacks run.
> 
> Ah, so even with my fix of moving to noirq we could still be broken if
> the system decided to enable interrupts for the device before the i2c
> controller get resumed then we'd still be SOL.
> 
> ...oh, but if it matches probe order then maybe we're guaranteed for
> that not to happen?  We know that we will probe the i2c bus before the
> devices on it, right?

If the mentioned device is a child of the I2C controller then the
parent-child relation determines the order. Otherwise (e.g. another,
non-I2C interrupt source that just triggers some operation on an I2C
device like voltage regulator) we're doomed. ;)

Best regards,
Tomasz
