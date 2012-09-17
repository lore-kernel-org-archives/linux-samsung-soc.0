From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: s3c2410: add optional pin configuration using
 pinctrl interface
Date: Mon, 17 Sep 2012 12:58:44 +0530
Message-ID: <CAJuYYwQDw1zbprdTW=SC-+DvfcK9RDE-C8bJOzcy39QukRWHBg@mail.gmail.com>
References: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org>
	<1346923381-14144-2-git-send-email-thomas.abraham@linaro.org>
	<2444562.GB3nOHUb9M@amdc1227>
	<CAJuYYwQCQDTnpPR5WABtbozZOgc6_SZRBv3b6D8KY78tzMt-Eg@mail.gmail.com>
	<504E3DBA.3080603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <504E3DBA.3080603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11 September 2012 00:51, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/06/2012 05:06 AM, Thomas Abraham wrote:
>> On 6 September 2012 15:04, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi,
>>>
>>> This patch shows the problem of the need to explicitly migrate all drivers
>>> to pinctrl.
>>>
>>> Maybe we should consider extending the pinctrl subsystem to set the default
>>> state automatically before binding a driver to a device, at least in case
>>> of DT-based platforms?
>>
>> The pinctrl driver allows for activating default pin configuration
>> when the pinctrl driver loads. This is referred to as "hogging". But
>> should hog be used or not is something that needs to be decided. Some
>> of the factors which favor the driver explicitly setting up the pin
>> configuration are
>>
>> 1. After a suspend and resume cycle, the pin configuration registers
>> may be reset to default values. Hence, during resume, the pin
>> configuration has be redone.
>
> I'd think it's the pinctrl driver's responsibility to make hogging work
> correctly across suspend/resume.

Ok. I will add this functionality in the Samsung pinctrl driver.

Thanks,
Thomas.

[...]
