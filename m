From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 02/15] drivers/base: add restrack framework
Date: Mon, 15 Dec 2014 09:28:41 +0100
Message-ID: <548E9BB9.806@samsung.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-3-git-send-email-a.hajda@samsung.com>
 <20141212165230.GP11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <20141212165230.GP11764@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Turquette <mturquette@linaro.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Inki Dae <inki.dae@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, boris.brezillon@
List-Id: linux-samsung-soc@vger.kernel.org

On 12/12/2014 05:52 PM, Mark Brown wrote:
> On Wed, Dec 10, 2014 at 04:48:20PM +0100, Andrzej Hajda wrote:
>> restrack framework allows tracking presence of resources with dynamic life
>> time. Typical example of such resources are all resources provided by device
> I don't know about anyone else but I'm having a hard time reading the
> restrack name, it looks like a misspelling of restack to me.

Any alternative names?

>
> At a high level my biggest questions here are the relationship between
> this and the component code and usability.  The usability concern I have
> is that I see no diagnostics or trace here at all.  This means that if a
> user looks at their system, sees that the device model claims the driver
> for a device bound to the device but can't see any sign of the device
> doing anything they don't have any way of telling why that is other than
> to look in the driver code, see what resources it was trying to depend
> on and then go back to the running system to try to understand which of
> those resources hasn't appeared.

I will move the code for provider matching to frameworks,
so it will be easy to add just dev_info after every failed attempt
of getting resource, including deferring. This is the simplest solution
and it should be similar in verbosity to deferred probing.

Maybe other solution is to provide debug_fs (or device) attribute showing
restrack status per device.

>
>> +int restrack_up(unsigned long type, const void *id, void *data)
>> +int restrack_down(unsigned long type, const void *id, void *data)
> Again I'm not sure that the up and down naming is meaningful in the
> context of this interface.
>
>> +static void restrack_itb_cb(struct track_block *itb, void *data, bool on)
>> +{
> itb_cb?

Ups I forgot to rename few variables from my previous attempt.
itb - stayed for interface tracker block.

Regards
Andrzej


