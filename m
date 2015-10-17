From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5250: Add DISP1 clocks
Date: Sat, 17 Oct 2015 11:55:50 +0200
Message-ID: <56221B26.2050407@osg.samsung.com>
References: <1444905084-22540-1-git-send-email-tomeu.vizoso@collabora.com>
 <1444905084-22540-2-git-send-email-tomeu.vizoso@collabora.com>
 <56203AD3.2050905@samsung.com> <20151016124935.20687.4394@quantum>
 <20151016172651.GB23912@codeaurora.org>
 <CAAObsKAjZX8XxTAFVKq4BCSZSrKG5xQPTue+z+xnJDD8QwK88Q@mail.gmail.com>
 <56218B2D.9040007@kernel.org>
 <CAJKOXPf5Dnh36rrY6Vet13EHKB3gJuU0VnAfsyYnvWTx92O_GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPf5Dnh36rrY6Vet13EHKB3gJuU0VnAfsyYnvWTx92O_GA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/17/2015 10:53 AM, Krzysztof Kozlowski wrote:
> 2015-10-17 8:41 GMT+09:00 Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:

[snip]

>>>
>> So...how can I take 2nd patch of this series in samsung(arm-soc) tree?
>> And this series shouldn't be for fixes for 4.3?...Mike how do you think?
> 
> Stephen acked it so I thought everything will go through samsung-soc.
> 
> Dear Kukjin,
> Indeed this can go as fix for current cycle... but in the same time
> this does not fix any specific regression. Tomeu did not describe when
> issue happened for the first time so I assumed it was like that
> always. It's up to you.
>

Sorry for not answering about this series before but I've been in contact
with Tomeu over IRC before he posted it and since you already added your
Reviewed-by tag, I didn't feel the need do to it.

This is a regression for 4.3 since S2R was working correctly for 4.2 in
Snow, I tested after fixing resume with commit 6fd4899a54a5 ("irqchip:
exynos-combiner: Save IRQ enable set on suspend") and the display was
always enabled on resume.

I don't have access to a Snow anymore to bisect but I think the regression
was introduced by some of the changes in 4.3 to migrate the Exynos DRM to
Atomic Mode Settings. But probably that just exposed a latent bug and it
was working out of luck since I had the same issue than Tomeu in Exynos5420
and was fixed in the same way with commits:

885601002998 ("clk: exynos5420: Add IDs for clocks used in DISP1 power domain")
ea08de16eb1b ("ARM: dts: Add DISP1 power domain for exynos5420")

> Both patches (with Stephen's ack) are in my recent pull request but as
> usual feel free to cherry pick. I'll drop them from next branch then.
> 
> Best regards,
> Krzysztof
> --

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
