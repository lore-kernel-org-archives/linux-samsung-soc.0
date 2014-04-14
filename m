From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Mon, 14 Apr 2014 15:54:24 -0700
Message-ID: <CAOesGMh3bpJtphTFz_3ZZXBPTi_RFXv24tKyTPWa=rHq3xkP8Q@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:61587 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752798AbaDNXBo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 19:01:44 -0400
Received: by mail-qa0-f53.google.com with SMTP id w8so8472399qac.26
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 16:01:43 -0700 (PDT)
In-Reply-To: <1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Hi Sachin,

On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Doug Anderson <dianders@chromium.org>
>
> Added nodes for ptn3460 driver to Snow board.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

I'm curious, how are you testing this code on the upstream kernel
before you post the patches?

Especially since Doug was referring to some of these containing parts
that is needed for drivers that are not yet upstreamed.


-Olof
