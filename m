From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: SMP not working on Odroid XU3
Date: Thu, 14 May 2015 13:50:00 +0900
Message-ID: <CAJKOXPcaAOanurwWy8nN8Yqh14J4KuHaj7NPJALqJOGKSO_5pQ@mail.gmail.com>
References: <848ucrvou4.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f49.google.com ([209.85.216.49]:39002 "EHLO
	mail-vn0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbbENEuB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 00:50:01 -0400
Received: by vnbg1 with SMTP id g1so2730080vnb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2015 21:50:00 -0700 (PDT)
In-Reply-To: <848ucrvou4.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: linux-samsung-soc@vger.kernel.org

2015-05-14 12:07 GMT+09:00 Peter Chubb <peter.chubb@nicta.com.au>:
> Hi,
>         Is there any info on the web at present as to what's supposed
>         to work and what doesn't in the upstream kernel?

I think there isn't.

>         I'm currently seeing only two out of eight processors come up
>         at boot time using the samsung-linux tree, both A7s.  All
>         eight come up in HYP mode using the Hardkernel linux tree.

That is strange, I would expect the opposite - six out of eight should
come up on current next and mainline.

>
>         There's one obvious error in arch/arm/mach-exynos/firmware.c -- the
>         address in the samsung,secure-firmware node isn't saved
>         anywhere or used anywhere.  Instead the SMC communication area
>         is taken from the samsung,exynos4210-sysram-ns node.

exynos5420.dtsi and sysram-ns.

Best regards,
Krzysztof
