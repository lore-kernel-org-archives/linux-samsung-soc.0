From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5250-snow: add ptn3460 node
Date: Mon, 14 Apr 2014 16:00:28 -0700
Message-ID: <CAD=FV=VrEhnOOErVAHYhPqwtvhRTbsW48otZE3PYywmGTJVecQ@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:51728 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbaDNXA3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 19:00:29 -0400
Received: by mail-vc0-f182.google.com with SMTP id ib6so8548373vcb.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 16:00:29 -0700 (PDT)
In-Reply-To: <1397481367-12652-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, Sean Paul <seanpaul@chromium.org>, daeinki@gmail.com, Olof Johansson <olof@lixom.net>, "akshay.s@samsung.com" <akshay.s@samsung.com>

Sachin,

On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Doug Anderson <dianders@chromium.org>

For this patch in particular giving me authorship is pretty tenuous.
I don't think I was even the author of the majority of the code in the
chromium tree.


> Added nodes for ptn3460 driver to Snow board.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I don't see any problems here but really the graphics people are the
ones that should be commenting.  Added a few folks to the CC list.

For the general GPIOs / pinctrl stuff, though:

Reviewed-by: Doug Anderson <dianders@chromium.org>


...and as Olof points out, please let us know how this was all tested.
