From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 0/7] Add G2D nodes to Exynos4 machines
Date: Thu, 7 Mar 2013 09:12:24 +0530
Message-ID: <CAK9yfHyQ=2EjRKknhN7nKUygnryKfWZ2A61w1+WRtrzLaF3SBA@mail.gmail.com>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:56006 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756742Ab3CGDmZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 22:42:25 -0500
Received: by mail-oa0-f54.google.com with SMTP id n12so28153oag.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 19:42:24 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

Hi Kukjin,

Can you please look into this series as it is pending since quite some time.

On 18 February 2013 10:32, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This patch series is based on Kukjin Kim's next/dt-exynos branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tree.
>
> Changes since v1:
> * Removed power-domain entry in patch 1/7 as the driver currently
>   does not use it.
> * Addressed review comments from Sylwester Nawrocki and Tomasz Figa
>   in patch 7/7.
>
> Sachin Kamat (7):
>   ARM: dts: Add G2D node to exynos4210.dtsi
>   ARM: dts: Add G2D node to SMDKV310
>   ARM: dts: Add G2D node to exynos4210-origen
>   ARM: dts: Add G2D node to exynos4x12.dtsi
>   ARM: dts: Add G2D node to SMDK4412
>   ARM: dts: Add G2D node to exynos4412-origen
>   ARM: dts: Add Samsung G2D DT bindings documentation
