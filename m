From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] iio: adc: exynos_adc: Handle timeout issues
Date: Mon, 15 Apr 2013 09:01:39 -0700
Message-ID: <CAD=FV=XnpWPFcDoQ1Pi+SkuWiemiY+6Z6ecQN+eDpfs4fW8+qw@mail.gmail.com>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com>
	<1365048389-6364-1-git-send-email-naveenkrishna.ch@gmail.com>
	<CAHfPSqAVUVdFwtMxJYCGaPv_+iO_GEc9_UGNXwuSj9uu_fB81g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHfPSqAVUVdFwtMxJYCGaPv_+iO_GEc9_UGNXwuSj9uu_fB81g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Fri, Apr 12, 2013 at 9:36 PM, Naveen Krishna Ch
<naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Can some one review this and get this fix into the tree.

I think the ball is in your court.  Lars responded to your RFC patch
here and requested that you do a reset of the bus in the case of being
interrupted.

https://lkml.org/lkml/2013/4/5/91

I made a comment about perhaps just using non-interruptable and then
shortening the timeout and Lars thought that would be OK.  ...but I've
since thought about it and I think Lars' suggestion is best.

The reason I no longer like my suggestion of just using a 1ms
non-interruptable tiemout is that I'm slightly worried about running
into some case where the interrupt gets blocked for a while and then
we get timeouts for no reasons.  Perhaps I'm worrying over nothing,
but Lars' suggestion doesn't have this issue.

-Doug
