From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: exynos-audss: Update as per existing framework
Date: Fri, 11 Jul 2014 12:40:24 +0200
Message-ID: <53BFBF18.3080704@samsung.com>
References: <1405071475-31946-1-git-send-email-tushar.b@samsung.com>
 <1405071475-31946-3-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1405071475-31946-3-git-send-email-tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tushar,

On 11/07/14 11:37, Tushar Behera wrote:
> Change exynos-audss clock driver as per existing clock framework from
> the existing module driver framework.

Can you explain what's the actual issue you're trying to solve with that
patch ? What's the problem with this driver being a platform driver ?
It feels we're moving in circles here, see

commit b37a4224104568198b93fb9831224cfe7d83fff8
Author: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date:   Wed Sep 25 14:12:47 2013 -0700

    clk: exynos-audss: convert to platform device

    The Exynos AudioSS clock controller will later be modified to allow
    input clocks to be specified via device-tree in order to support
    multiple Exynos SoCs.  This will introduce a dependency on the core
    SoC clock controller being initialized first so that the AudioSS driver
    can look up its input clocks, but the order in which clock providers
    are probed in of_clk_init() is not guaranteed.  Since deferred probing
    is not supported in of_clk_init() and the AudioSS block is not the core
    controller, we can initialize it later as a platform device.

    Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
    Acked-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
    Reviewed-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
    Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
    Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
    Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I realize of_clk_init() now handles better clock provider dependencies,
nevertheless do we really need all this churn ?

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
