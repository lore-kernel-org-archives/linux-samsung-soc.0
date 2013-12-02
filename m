From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V11 2/3] watchdog: s3c2410_wdt: use syscon regmap
 interface to configure pmu register
Date: Mon, 2 Dec 2013 09:32:45 -0800
Message-ID: <CAD=FV=XvTPbkdopAQVQt-ga2HrwwZ1MSWytMTeDAz=M91icy3g@mail.gmail.com>
References: <1385613243-3559-1-git-send-email-l.krishna@samsung.com>
	<1385613243-3559-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385613243-3559-3-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Leela Krishna,

On Wed, Nov 27, 2013 at 8:34 PM, Leela Krishna Amudala
<l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add device tree support for exynos5250 and 5420 SoCs and use syscon regmap interface
> to configure AUTOMATIC_WDT_RESET_DISABLE and MASK_WDT_RESET_REQUEST registers of PMU
> to mask/unmask enable/disable of watchdog in probe and s2r scenarios.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   21 ++-
>  drivers/watchdog/Kconfig                           |    1 +
>  drivers/watchdog/s3c2410_wdt.c                     |  159 ++++++++++++++++++--
>  3 files changed, 171 insertions(+), 10 deletions(-)

Tested on ARM Chromebook in a backport to 3.8.  See
<https://chromium-review.googlesource.com/#/c/177932/3> for this
patch.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
