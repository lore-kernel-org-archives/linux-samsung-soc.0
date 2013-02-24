From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Sun, 24 Feb 2013 01:58:35 +0100
Message-ID: <31669750.ZZOiY1AEPv@flatron>
References: <201302231855.47560.heiko@sntech.de> <5027662.bpQdq7jhyn@flatron> <CACRpkdaFv=V8M_Ztb5-hrYm6YnXiG6fg6Z13y3NVFdszBk=7ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaFv=V8M_Ztb5-hrYm6YnXiG6fg6Z13y3NVFdszBk=7ZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sunday 24 of February 2013 01:47:49 Linus Walleij wrote:
> On Sun, Feb 24, 2013 at 1:38 AM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 
wrote:
> > The driver must know whether pin control is available, because it has
> > to fall back to legacy GPIO-based pin configuration if it is not.
> > This means that we must either check for NULL (which probably is not
> > right, since returned handle is considered to be opaque) or pin
> > control core must return an error code specific to this situation,
> > e.g. -ENODEV.
> OK so pass a flag like a bool in your platform data from the
> machine like go into <linux/platform_data/i2c-s3c2410.h>
> and add:
> 
> struct s3c2410_platform_i2c {
>         bool  use_that_old_gpio_interface;
>         (...)
> };
> 
> Instead of trying to semi-guess if the pinctrl framework is there?
> 
> Surely you know this when setting up the pdata from your machine?

Cases 2) and 3) are both DT-enabled cases, where there is no pdata coming 
from board-specific code.

In case of this particular driver, a check for presence of "gpios" 
property will be enough, because this driver does not use GPIO pins 
normally - they are just used for pin configuration, when legacy method 
has to be used.

However it will not work in case of drivers that also need some GPIO pins 
unrelated to the pins that have to be configured to dedicated functions.

Note that we are talking here about a temporary solution. The legacy DT-
based pin configuration will go away after all the DT-enabled platforms 
using this driver get migrated to pin control and so will the need to 
check if pin control is available.

Best regards,
Tomasz
