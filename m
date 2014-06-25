From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: DTS: Add NTC thermistor nodes as child nodes to ADC
Date: Wed, 25 Jun 2014 10:00:57 -0700
Message-ID: <CAD=FV=VnHZY3vC6y3B-3xXMnYCV+UVrCcgT5y73FJEuKdot_Sw@mail.gmail.com>
References: <1403612356-23685-1-git-send-email-ch.naveen@samsung.com>
	<1403612356-23685-5-git-send-email-ch.naveen@samsung.com>
	<CAD=FV=Wmi73S4c5TPUqnNyycQ5xX5SbYy_ES-cbbJF2Hr0tqvQ@mail.gmail.com>
	<CAHfPSqAAWFtCQQrKBhLFuE2OuO_fwmUOhcOX9zKk8eMRMNSVvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHfPSqAAWFtCQQrKBhLFuE2OuO_fwmUOhcOX9zKk8eMRMNSVvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Tue, Jun 24, 2014 at 10:04 PM, Naveen Krishna Ch
<naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Also, we have few similar nodes on Peach PI  and Peach PIT.
> Any plans or discussion on merging the common nodes ?

There was some discussion about this in another thread with Javier.
We were thinking of doing more "config fragments" like I did for the
keyboard.  See <https://lkml.org/lkml/2014/6/24/337> for context.

If someone wants to try to break some config fragments out feel free
to send up patches.  Until that is done let's at least keep pit and pi
as close to the same as possible (try to add features to both and try
to make sure that "diff" between the two looks good).

-Doug
