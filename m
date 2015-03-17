From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 0/4] Fix power domains handling on exynos542x
Date: Wed, 18 Mar 2015 02:14:34 +0900
Message-ID: <550860FA.9040408@kernel.org>
References: <1426167431-24470-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426167431-24470-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, Liquid.Acid-hi6Y0CQ0nG0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/12/15 22:37, Andrzej Hajda wrote:
> Hi Kukjin,
> 
Hi,

> This is resend of my patchset with added (Reviewed|Tested)-by tags and removed RFC
> prefix.
> 
> Exynos chipsets since 542x have asynchronous bridges connecting different IPs.
> These bridges should be operational during power domain switching, ie associated
> clocks cannot be gated.
> This patchset adds binding to provide such clocks per power domain and adds code
> which enables them during domain on/off operation.
> 
> This patchset fixes power domain issues with disp1 domain and HDMI (some of them)
> on Odroid XU3:
> - disp1 power domain can be turned off,
> - no more "imprecise external abort" faults.
> 
> The patchset is based on samsung-fixes-dt tag from kgene/linux-samsung.
> 
> It was successfully tested on OdroidXU3.
> 
Thanks, applied whole this series.

- Kukjin

> Andrzej Hajda (4):
>   arm/exynos: add asynchronous bridge clock bindings
>   arm/exynos/pm_domains: add support for async-bridge clocks
>   ARM: dts: exynos5420: add async-bridge clocks to disp1 power domain
>   ARM: dts: exynos5420: add async-bridge clocks to gsc power domain
> 
>  .../bindings/arm/exynos/power_domain.txt           |  3 +++
>  arch/arm/boot/dts/exynos5420.dtsi                  |  8 +++++--
>  arch/arm/mach-exynos/pm_domains.c                  | 27 ++++++++++++++++++----
>  3 files changed, 32 insertions(+), 6 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
