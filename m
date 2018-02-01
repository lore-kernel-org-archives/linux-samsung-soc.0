From: Michael Lyle <mlyle@lyle.org>
Subject: Re: [PATCH v2] ARM: dts: exynos-artik5: add support for wlan
Date: Thu, 1 Feb 2018 13:14:09 -0800
Message-ID: <CAJ+L6qejuphMmgX-zid03FoBoP69NLj9ukJ+GKmxD8SBZXx--Q@mail.gmail.com>
References: <20180131074027.387-1-mlyle@lyle.org> <CAJKOXPex=joAvYZem9ROft4aYi8z5Mb4oDce=US182waHtuXew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:43288 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751698AbeBAVOK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 16:14:10 -0500
Received: by mail-qt0-f180.google.com with SMTP id m11so797324qtn.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2018 13:14:10 -0800 (PST)
In-Reply-To: <CAJKOXPex=joAvYZem9ROft4aYi8z5Mb4oDce=US182waHtuXew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, CHANHO PARK <chanho61.park@samsung.com>

Hey, I'm really sorry-- I forgot to commit before diffing the patch
and had sent the v1 patch again.  :(

Couldn't make it work any way except with ldo23 nailed on-- your other
comments I'd already taken care of (except pinctrl should go before
rtc, not after).  Will send out v3 imminently.

Mike
