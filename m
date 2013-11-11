From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 2/3] ARM: dts: update watchdog device nodes for Exynos5250 and Exynos5420
Date: Mon, 11 Nov 2013 05:06:00 -0800 (PST)
Message-ID: <10330347.YPtX4Jly4T@flatron>
References: <1384173897-16106-1-git-send-email-l.krishna@samsung.com> <1384173897-16106-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384173897-16106-3-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Leela,

On Monday 11 of November 2013 18:14:56 Leela Krishna Amudala wrote:
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
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    7 -------
>  arch/arm/boot/dts/exynos5250.dtsi |    6 +++++-
>  arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
>  3 files changed, 14 insertions(+), 8 deletions(-)

This patch should go as the last in this series, because otherwise it
would change DTS files to use compatible values that are not yet
supported.

The patch itself is fine, so

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
