From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Cleanup Security Subsystem nodes for Exynos5
Date: Thu, 23 Nov 2017 17:16:05 +0100
Message-ID: <CAJKOXPcOKRGg2robtWS9apVrXzZVHgugb_n3JBBsVeSEkvJnFg@mail.gmail.com>
References: <CGME20171123143456eucas1p13a29e8e0c0c0bf63a3875e458cc76d72@eucas1p1.samsung.com>
 <20171123143435.30747-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751415AbdKWQQI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 11:16:08 -0500
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com [209.85.128.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF50121921
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2017 16:16:07 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id o14so18039204wrf.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2017 08:16:07 -0800 (PST)
In-Reply-To: <20171123143435.30747-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Thu, Nov 23, 2017 at 3:34 PM, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
> Move Security Subsystem nodes to exynos5.dtsi. Adjust clock entries for
> Exynos 5250 and Exynos 54xx.

>From the code I can figure it out, but the commit msg should say why
you are doing this. Actually the "why" is more important then "what"
because I can easily see "what" the patch is doing.

Code itself looks ok.

Best regards,
Krzysztof
