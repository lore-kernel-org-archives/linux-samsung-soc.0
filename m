From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFT] arm64 dts: exynos: Fix invalid GIC interrupt flags in
 exynos7
Date: Sat, 17 Sep 2016 18:30:57 +0200
Message-ID: <20160917163057.GA5859@kozik-lap>
References: <1474056073-8071-1-git-send-email-krzk@kernel.org>
 <CGME20160917113730epcas3p42e26e92f5e72fa42e89967798dbbbecf@epcas3p4.samsung.com>
 <57DD2AA8.9060507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57DD2AA8.9060507-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Sep 17, 2016 at 05:06:08PM +0530, Alim Akhtar wrote:
> Hi Krzysztof,
> 
> On 09/17/2016 01:31 AM, Krzysztof Kozlowski wrote:
> >Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts and
> >generates an error:
> >	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)
> >
> >The GIC requires shared interrupts to be edge rising or level high.
> >Platform declares support for both.  Choose level high everywhere.
> >
> >Reported-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> >Reported-by: Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> >Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >---
> 
> This patch does resolve the error reported in commit.
> Have booted on exynos7 board, things looks fine (have not done a extensive
> testing though).
> With the _Typo_ fixed as pointed by you, feel free to add
> 
> Tested-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> On another note, please cc me if case you want to check/verify something on
> exynos7 platform. I almost missed this patch.

Great, thanks! I'll remember that.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
