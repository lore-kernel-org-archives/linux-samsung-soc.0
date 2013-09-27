From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 3/4] watchdog: s3c2410_wdt: parse watchdog dt node to
 read PMU registers adresses
Date: Fri, 27 Sep 2013 22:23:23 +0530
Message-ID: <CAK9yfHxBnj39w=YrBw-PyT-Anpprx8Zn4d0O6BPp__qNGH4Xhg@mail.gmail.com>
References: <1380276986-24131-1-git-send-email-l.krishna@samsung.com>
	<1380276986-24131-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380276986-24131-4-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27 September 2013 15:46, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch parses the watchdog node to read pmu wdt sys registers addresses
> and do mask/unmask enable/disable of WDT in probe and s2r scenarios.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   24 ++++-
>  drivers/watchdog/s3c2410_wdt.c                     |   94 ++++++++++++++++++--
>  2 files changed, 108 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> index 2aa486c..f78b802 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -5,10 +5,30 @@ after a preset amount of time during which the WDT reset event has not
>  occurred.
>
>  Required properties:
> -- compatible : should be "samsung,s3c2410-wdt"
> +- compatible : should be "samsung,s3c2410-wdt" or "samsung,s3c5250-wdt"

It would also be helpful to mention the SoCs along with the compatibles strings.

>  - reg : base physical address of the controller and length of memory mapped
> -       region.
> +       region and additional (addresses and length of memory mapped regions
> +       of) PMU registers for masking/unmasking WDT only in case of Exynos5250 and 5420.
>  - interrupts : interrupt number to the cpu.
> +- reset-mask-bit: bit number in the PMU registers to program mask/unmask WDT (required only
> +       in case of Exynos5250 and 5420).
>
>  Optional properties:
>  - timeout-sec : contains the watchdog timeout in seconds.
> +
> +Examples:
> +
> +watchdog {

watchdog@101D0000

> +       compatible = "samsung,s3c2410-wdt";
> +       reg = <0x101D0000 0x100>;
> +       interrupts = <0 42 0>;
> +       status = "disabled";
> +};
> +
> +watchdog {

ditto

> +        compatible = "samsung,s3c5250-wdt";
> +        reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
