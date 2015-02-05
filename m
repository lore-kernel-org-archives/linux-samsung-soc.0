From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Fix power domains handling on exynos542x
Date: Thu, 05 Feb 2015 15:45:08 +0100
Message-ID: <54D381F4.2080701@collabora.co.uk>
References: <1423139739-19881-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423139739-19881-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liquid.Acid-hi6Y0CQ0nG0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andrzej,

Thanks a lot for finally finding what was causing the HDMI issue.

On 02/05/2015 01:35 PM, Andrzej Hajda wrote:
> Hi,
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
> The patchset is based on '[PATCH v5 0/9] Enable HDMI support on Exynos platforms' [1].
> 

It also depends on '[PATCH 0/2] Add HDMI support for Exynos5420 platform' [2].

> It was successfully tested on OdroidXU3.
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/42743

Your patches looks good to me so please feel free to add:

Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

I also tested on an Exynos5420 Peach Pit Chromebook and both the "Power
domain power-domain disable failed" message and the system crash are gone.

Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Best regards,
Javier

[2]: https://lkml.org/lkml/2015/1/20/235
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
