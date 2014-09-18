From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Thu, 18 Sep 2014 17:53:40 -0600
Message-ID: <CAD8Lp44n3xArQ-xvZsFdYn13x80Dqv1oCY=dLm1UPxKr8XbyJQ@mail.gmail.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35265 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbaIRXxl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 19:53:41 -0400
Received: by mail-wi0-f171.google.com with SMTP id d1so1078054wiv.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2014 16:53:40 -0700 (PDT)
In-Reply-To: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Sep 10, 2014 at 10:37 AM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> The default mux and divider clocks are specified in device tree
> so that the FIMC devices in Exynos4210 and Exynos4x12 SoCs are
> clocked from recommended clock source and with maximum supported
> frequency. If needed these settings could be overrode in board
> specific dts files, however they are in practice optimal in most
> cases.

Another consideration for this patch.

fimc-core.c already has probe-time code that tries to set the clock
frequency, using a clock-frequency property in the DT, and falling
back to a hardcoded value in the driver. Maybe it is best to just set
the clock rate from one place.

Daniel
