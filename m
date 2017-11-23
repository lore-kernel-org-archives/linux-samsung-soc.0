From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Cleanup Security Subsystem nodes for
 Exynos5
Date: Thu, 23 Nov 2017 19:12:38 +0100
Message-ID: <20171123181238.eqsaumhfsrlkuwng@kozik-lap>
References: <CAJKOXPcOKRGg2robtWS9apVrXzZVHgugb_n3JBBsVeSEkvJnFg@mail.gmail.com>
 <CGME20171123180559eucas1p2c07a9d1de1e00e725b9fcda657d44be5@eucas1p2.samsung.com>
 <87vai0dg5a.fsf%l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40097 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753195AbdKWSMm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 13:12:42 -0500
Received: by mail-wm0-f68.google.com with SMTP id b189so18204477wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2017 10:12:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <87vai0dg5a.fsf%l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

On Thu, Nov 23, 2017 at 07:05:53PM +0100, Łukasz Stelmach wrote:
> It was <2017-11-23 czw 17:16>, when Krzysztof Kozlowski wrote:
> > On Thu, Nov 23, 2017 at 3:34 PM, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
> >> Move Security Subsystem nodes to exynos5.dtsi. Adjust clock entries for
> >> Exynos 5250 and Exynos 54xx.
> >
> > From the code I can figure it out, but the commit msg should say why
> > you are doing this. Actually the "why" is more important then "what"
> > because I can easily see "what" the patch is doing.
> 
> Marek, can you tell us more? It was your idea ;-)

I believe that the purpose is to remove duplicated definitions of SSS
nodes. They are exactly the same between Exynos5250 and Exynos5420 so
moving them to common file gets rid of duplicated code.

Subject could be also rewritten in that way.

Best regards,
Krzysztof
