From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Wed, 19 Jul 2017 22:20:09 +0200
Message-ID: <20170719202009.teh2nvsq47i5zpq4@kozik-lap>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
 <87zic0b8hi.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87zic0b8hi.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 19, 2017 at 09:13:29PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> > Hi Krzysztof,
> >
> > Today I tried to compile the latest kernel for Odroid xu4.
> > using exynos_defconfig I build and loaded the kernel.
> > but to my surprise usb 3.0 device and missing.
> >
> > odroid login: root
> > Password:
> > Last login: Wed Jul 19 14:01:44 UTC 2017 on ttySAC2
> > Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.13.0-rc1-xu4ml-27846-g74cbd96 armv7l)
> 
> Dude, you have 27 thousand patches on top of v4.13-rc1??? Try vanilla
> v4.13-rc1 and try a git bisect.

Hi Anand,

Beside Felipe's comment, I do not have XU4. I cannot reproduce it on
XU3-Lite (but there is difference in USB2 and USB3, AFAIR).

$ uname -a
Linux odroidxu3 4.13.0-rc1-00071-ge06fdaf40a5c #1051 SMP PREEMPT Wed Jul 19 22:07:41 CEST 2017 armv7l GNU/Linux
$ lsusb
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Try to follow Felipe's advice of using vanilla kernel from Linus and
bisecting it.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
