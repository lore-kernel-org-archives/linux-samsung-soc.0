From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: exynos5410: register clocks using common clock
 framework
Date: Tue, 01 Oct 2013 15:44:00 -0600
Message-ID: <524B4220.1070209@wwwdotorg.org>
References: <1380644227-12244-1-git-send-email-v.tyrtov@samsung.com> <1380644227-12244-3-git-send-email-v.tyrtov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380644227-12244-3-git-send-email-v.tyrtov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vyacheslav Tyrtov <v.tyrtov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Naour Romain <romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/01/2013 10:17 AM, Vyacheslav Tyrtov wrote:
> From: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> The EXYNOS5410 clocks are statically listed and registered
> using the Samsung specific common clock helper functions.

> diff --git a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt

> +       [Core Clocks]
> +  [Clock Gate for Special Clocks]
> +   [Peripheral Clock Gates]

These headers/titles for the sections/lists aren't consistently aligned.

> +  [Clock Gate for Special Clocks]
> +
> +  Clock			ID
> +  ----------------------------
> +  sclk_uart0		128
> +  sclk_uart1		129
> +  sclk_uart2		130
> +  sclk_uart3		131
> +  sclk_mmc0		132
> +  sclk_mmc1		133
> +  sclk_mmc2		134
> +
> +   [Peripheral Clock Gates]
> +
> +  Clock			ID
> +  ----------------------------
> +
> +  uart0			257
> +  uart1			258
> +  uart2			259
> +  uart3			260
> +  mct			315
> +  mmc0			351
> +  mmc1			352
> +  mmc2			353

That's not many clocks. I assume you're planning on adding more IDs
later, in a backwards-compatible fashion? I suppose that's OK since it
won't break any existing usage, as long as there's no need to renumber
any existing values.

On that topic, are any of those clock IDs derived from HW, e.g. register
numbers, or bit numbers in an array of registers? Numbering clocks in a
HW-derived fashion would make it easier or more obvious how to add new
clock IDs later while maintaining some consistency and without
introducing the desire to break any ABI.

Finally, how about creating a header file such as
include/dt-bindings/clock/exynos5410.h to define those clock IDs, so
that both *.dts and the clock driver can share the values without having
to manually write them?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
