From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is enabled during suspend
Date: Tue, 31 Mar 2015 14:02:04 -0700
Message-ID: <7hiodg98z7.fsf@deeprootsystems.com>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
	<1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk>
	<CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
	<551976F1.1000605@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36257 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753716AbbCaVCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 17:02:07 -0400
Received: by padcy3 with SMTP id cy3so30628655pad.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2015 14:02:07 -0700 (PDT)
In-Reply-To: <551976F1.1000605@collabora.co.uk> (Javier Martinez Canillas's
	message of "Mon, 30 Mar 2015 18:16:49 +0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

[...]

> Unfortunately I don't fully understand why this clock needs to be
> enabled. It would be good if someone at Samsung can explain in more
> detail what the real problem really is.

+1

Maybe Abhilash can shed some light here?

We really should know *why* this is needed because having the fix in the
clock driver just doesn't seem right.  It seems like the DMA driver
should be managing this clock.

Kevin
