From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC: PATCH 2/2] iio: adc: exynos_adc: Handle timeout and race conditions
Date: Fri, 5 Apr 2013 07:56:14 -0700
Message-ID: <CAD=FV=XHKn_vqv7-rqpraJy_V2kyBfo98WdMsAJ5eXhADc_rmA@mail.gmail.com>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com>
	<51439846.9090201@metafoo.de>
	<CAD=FV=V+-DwCjGoookySCazazBBYOoRO+=G5Q_WXAw+SrXNc-A@mail.gmail.com>
	<5144849A.8050907@metafoo.de>
	<CAD=FV=VBYHyD6yXBrM1BV3gazDFT0oHgvJM0+5LU1w4AO16Yzg@mail.gmail.com>
	<515E90FD.10006@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515E90FD.10006-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Lars,

On Fri, Apr 5, 2013 at 1:53 AM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
> Since we sleep inside the protected section we need to use a mutex.

Ah, good point.

> It's not the timeout case I'm worried about, but the case where the transfer
> is interrupted by the user. Even though it is rather unlikely for the
> problem to occur we should still try to avoid it, this is one of these
> annoying heisenbugs that happen once in a while and nobody is able to
> reproduce them.

Yes, of course.  Then we can also get extra confidence that the reset
logic works well by stressing out this case...  :)

This makes me think, though.  Given how fast we expect the ADC
transaction to finish, would there be any benefit to making the wait
non-interruptible and then shortening the timeout a whole lot.  If we
shortened to 1ms then we're really not "non-interruptible" for very
long and there's less chance of subtle bugs in the way that reset
works.

-Doug
