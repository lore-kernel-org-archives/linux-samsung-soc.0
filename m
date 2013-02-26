From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Tue, 26 Feb 2013 22:57:15 +0100
Message-ID: <512D2FBB.5090507@gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org> <511E1008.6010308@samsung.com> <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com> <5122A119.7070501@gmail.com> <CAD025yRmvSpnM9RJJvN+FM00Rgz8Bt5msmEYcyFVxNTEKsM2xg@mail.gmail.com> <CAD025yTb5yfXWpzCnCg7KY9NsTw1wfsLFU6y32aD=WXe23xiwg@mail.gmail.com> <5127E533.4060702@gmail.com> <CAD025yQxOp1nd8N8K5wYco_o2TkW19fk_3jXHYHfVDnsDLR9VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:44526 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754265Ab3BZV5U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 16:57:20 -0500
Received: by mail-ee0-f41.google.com with SMTP id c13so2729855eek.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 13:57:19 -0800 (PST)
In-Reply-To: <CAD025yQxOp1nd8N8K5wYco_o2TkW19fk_3jXHYHfVDnsDLR9VQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tom Gall <tom.gall@linaro.org>

On 02/26/2013 05:19 AM, Vikas Sajjan wrote:
> ok thanks. Will modify the documentation as below.
>
> compatible = "samsung, exynos4-fimd"; for Exynos4 SoCs
> compatible = "samsung, exynos5-fimd" ; for Exynos5 SoCs
> compatible = "samsung, s3c64xx-fimd" ; for S3C64XX SoCs
> compatible = "samsung, s3c24xx-fimd" ; for S3C24XX SoCs
> compatible = "samsung, s5p64x0-fimd" ; for S5P64X0 SoCs

There should be no wildcards in the compatible property. I guess we can
just add the two first one above for now and leave other out for when
someone actually adds support for these SoCs at the drivers.

I suppose we could,  for example, have something like:

compatible = "samsung,s3c2410-fimd";                         // for s3c2410
compatible = "samsung,s3c2440-fimd", "samsung,s3c2410-fimd"; // for s3c2440

etc. But this really needs to be checked with the documentation
in each case.

> compatible = "samsung, s5pc100-fimd" ; for S5PC100 SoCs
> compatible = "samsung, s5pv210-fimd" ; for S5PV210 SoCs
