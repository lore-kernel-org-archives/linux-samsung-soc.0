From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V9 3/3] ARM: dts: update watchdog device nodes for
 Exynos5250 and Exynos5420
Date: Mon, 25 Nov 2013 14:46:42 -0800
Message-ID: <CAD=FV=UxMp-JE3WFKJucLFmR5TD8kYP=NVR_mazcdZ6iwjwc3A@mail.gmail.com>
References: <1384768189-2839-1-git-send-email-l.krishna@samsung.com>
	<1384768189-2839-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384768189-2839-4-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Leela Krishna,

On Mon, Nov 18, 2013 at 1:49 AM, Leela Krishna Amudala
<l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> In Exynos5 series SoCs, PMU has registers to enable/disable mask/unmask
> watchdog timer which is not the case with s3c series SoCs so, there is a
> need to have different compatible names for watchdog to handle these pmu
> registers access.
>
> Hence this patch removes watchdog node from Exynos5.dtsi common file and
> make it separate by updating existing node in Exynos5250 and adding new node
> to Exynos5420. This patch also makes the watchdog node enabled by default
>
> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    7 -------
>  arch/arm/boot/dts/exynos5250.dtsi |    6 +++++-
>  arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
>  3 files changed, 14 insertions(+), 8 deletions(-)

I've got this locally running in our tree
<https://chromium-review.googlesource.com/#/c/177933/> based on your
patch.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
