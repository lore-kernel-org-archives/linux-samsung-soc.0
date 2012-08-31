From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH RESEND 0/6] ARM: EXYNOS: Add support for Trats board using
 device tree
Date: Fri, 31 Aug 2012 11:02:54 +0530
Message-ID: <CAJuYYwSUCNdfMXbMVVULPgTVC=zh=4qQR1YiA29JXvUCj6meGA@mail.gmail.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:35846 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750992Ab2HaFcz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 01:32:55 -0400
Received: by lagy9 with SMTP id y9so2043387lag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Aug 2012 22:32:54 -0700 (PDT)
In-Reply-To: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com

On 30 August 2012 13:01, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch series adds basic device tree support for Samsung Trats board
> along with any necessary prerequisites.
>
> In addition it refactors Exynos4 dts include files to split parts common to
> the whole Exynos4 part from parts specific to Exynos4210 to allow further
> extension of Exynos4210 dts include file and addition of include files for
> other SoCs from Exynos4 line.
>
> Dependencies:
> -> [PATCH v5] mmc: sdhci-s3c: Add device tree support
> http://www.spinics.net/lists/linux-samsung-soc/msg12056.html
> -> [PATCH v5 2/2] regulator: add device tree support for max8997
> http://www.spinics.net/lists/kernel/msg1328117.html

I will follow up on this patch and resubmit it.

Thanks,
Thomas.

[...]
