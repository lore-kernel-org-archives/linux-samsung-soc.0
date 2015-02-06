From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/3] ARM: dts: exynos5420: add async-bridge clocks
 to disp1 power domain
Date: Fri, 06 Feb 2015 12:27:48 +0100
Message-ID: <54D4A534.8060004@collabora.co.uk>
References: <54D48701.10105@collabora.co.uk> <1423220154-5333-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423220154-5333-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liquid.Acid-hi6Y0CQ0nG0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andrzej,

On 02/06/2015 11:55 AM, Andrzej Hajda wrote:
> FIMD and MIXER IPs in disp1 power domain have async-bridges (to GSCALER),
> therefore their clocks should be enabled during power domain switch.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Hi,
> 
> This is 2nd version of the patch. After decrypting manual and discussion
> with Marek I guess this set of clocks is more apropriate - async-bridges
> are present in MIXER and FIMD, so their clocks should be enabled.
>

I just tested this version on my Exynos5420 Peach Pit and the power domain
failed error does not happen anymore even after enabling and disabling the
HDMI display several times.

Thanks a lot for fixing this since the dependency was not clear to me from
reading the manual.

> The 1st version worked for me due to fact I have forgot to remove
> clk_ignore_unused kernel boot option during tests ;)
>

Yes, that has bitten me too many times as well :)

> Regards
> Andrzej
> ---

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
