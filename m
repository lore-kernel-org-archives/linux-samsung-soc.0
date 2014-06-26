From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: DTS: Add NTC thermistor nodes to Exynos5250
 based Snow
Date: Thu, 26 Jun 2014 08:46:14 -0700
Message-ID: <CAD=FV=W=e-5LJRacxA-sSUUn8cBB5oCHJkwz=Py7iU2fdERVRA@mail.gmail.com>
References: <1403785148-20792-1-git-send-email-ch.naveen@samsung.com>
	<1403785148-20792-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403785148-20792-3-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Thu, Jun 26, 2014 at 5:19 AM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Exynos5250 based Snow board has 4 NTC thermistors to measure
> temperatures at various points on the board.
>
> IIO based ADC becomes the parent and NTC thermistors are the childs,
> via the HWMON interface.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Posted earlier by Doug Anderson @ https://lkml.org/lkml/2013/3/27/453
>
> This patch depends on (1/4 and 2/4 patches of) patchset posted
> http://www.spinics.net/lists/linux-iio/msg13486.html
> Which were applied on to Guenter Roeck's tree.
>
> cat sysfs entries exported by hwmon for 4 thermistors
> and verified the values on Snow.
>
>  arch/arm/boot/dts/exynos5250-snow.dts |   34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

NAK.

The first chunk of exynos5250-snow devices have the thermistors
populated, but a huge chunk of devices also _don't_ have them
populated.

If I remember my history properly, rev3 and earlier all had
thermistors.  Some of rev4 might have thermistors (I never got a clear
answer).  ...and rev5 definitely doesn't have resistors.  Aside from
thermistors there's no good reason to differentiate rev3 and rev4
(they just have different memory).  The upstream kernel may eventually
need to differentiate rev4 and rev5 since they have a different audio
codec.

See <https://chromium-review.googlesource.com/#/c/170841/> for some
descriptions of the different revisions of snow and how they were
handled in the Chrome OS tree.

See <https://chromium-review.googlesource.com/#/c/186357/> for
thermistors talk.  Patch set #1 actually split out rev3, but we then
decided that we really didn't need to use the thermistors on any of
the revisions so the later patchsets just totally take them out.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
