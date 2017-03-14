From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/8] ARM: dts: s3c64xx: Enable watchdog on all S3C64xx
 boards
Date: Tue, 14 Mar 2017 14:30:29 +0100
Message-ID: <1633762.1QWnRjdako@amdc3058>
References: <20170311172527.16368-1-krzk@kernel.org>
 <4386279.iJpUOasmTG@amdc3058>
 <CAJKOXPeCK1cjY78+PfcTprTnyXJ1k9zcUj8nW7onG8y0TWGzzQ@mail.gmail.com>
 <CGME20170314133035epcas1p47a04430402688bbb6baebad69b8e5b24@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPeCK1cjY78+PfcTprTnyXJ1k9zcUj8nW7onG8y0TWGzzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, March 14, 2017 03:04:28 PM Krzysztof Kozlowski wrote:
> On Tue, Mar 14, 2017 at 2:58 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Hi,
> >
> > On Saturday, March 11, 2017 07:25:23 PM Krzysztof Kozlowski wrote:
> >> Watchdog module does not have external dependencies so it can be safely
> >> enabled in s3c64xx.dtsi thus making it available for all S3C64xx-based
> >> boards.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Please first fix the driver w.r.t. infinite interrupt in soft mode
> > issue and only then enable it on more hardware.  IOW this patch
> > should be placed after patch #7 in the series.
> 
> The soft-interrupt mode is not the default one so this should not
> cause any issues by default but I got your point. Makes sense. The
> pity is the timing. There wasn't much interest in the patchset (no
> comments since 24 of Feb) so I merged it yesterday evening. Does it
> brake any platform/board?

OK, let it be as it as it doesn't break the default setup.

However please consider the fact that posting revised patches
(v2 was posted *yesterday*) for a review and then merging them
the same day is not a good practice..

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
