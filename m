From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Tue, 26 Feb 2013 23:11:32 +0100
Message-ID: <3726480.lf0XiLbqs9@flatron>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <CAD025yQxOp1nd8N8K5wYco_o2TkW19fk_3jXHYHfVDnsDLR9VQ@mail.gmail.com> <512D2FBB.5090507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:55003 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644Ab3BZWLf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 17:11:35 -0500
Received: by mail-ee0-f53.google.com with SMTP id e53so2715334eek.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 14:11:33 -0800 (PST)
In-Reply-To: <512D2FBB.5090507@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tom Gall <tom.gall@linaro.org>

On Tuesday 26 of February 2013 22:57:15 Sylwester Nawrocki wrote:
> On 02/26/2013 05:19 AM, Vikas Sajjan wrote:
> > ok thanks. Will modify the documentation as below.
> > 
> > compatible = "samsung, exynos4-fimd"; for Exynos4 SoCs
> > compatible = "samsung, exynos5-fimd" ; for Exynos5 SoCs
> > compatible = "samsung, s3c64xx-fimd" ; for S3C64XX SoCs
> > compatible = "samsung, s3c24xx-fimd" ; for S3C24XX SoCs
> > compatible = "samsung, s5p64x0-fimd" ; for S5P64X0 SoCs
> 
> There should be no wildcards in the compatible property. I guess we can
> just add the two first one above for now and leave other out for when
> someone actually adds support for these SoCs at the drivers.
> 
> I suppose we could,  for example, have something like:
> 
> compatible = "samsung,s3c2410-fimd";                         // for
> s3c2410 compatible = "samsung,s3c2440-fimd", "samsung,s3c2410-fimd"; //
> for s3c2440
> 
> etc. But this really needs to be checked with the documentation
> in each case.
> 
> > compatible = "samsung, s5pc100-fimd" ; for S5PC100 SoCs
> > compatible = "samsung, s5pv210-fimd" ; for S5PV210 SoCs

We should stick to the rule that compatible value should be named after 
first specific SoC model in which this particular IP version was included.

So this is what I would suggest:

compatible = "samsung,s3c2443-fimd"; // for S3C24XX SoCs
compatible = "samsung,s3c6400-fimd"; // for S3C64XX SoCs
compatible = "samsung,s5p6440-fimd"; // for S5P64X0 SoCs
compatible = "samsung,s5pc100-fimd"; // for S5PC100 SoC
compatible = "samsung,s5pv210-fimd"; // for S5PV210 SoC
compatible = "samsung,exynos4210-fimd"; // for Exynos4 SoCs
compatible = "samsung,exynos5250-fimd"; // for Exynos5 SoCs

(All the hardware variants are taken from s3c-fb driver.)

Best regards,
Tomasz
