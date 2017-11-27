From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: correct trats2 panel reset line
Date: Mon, 27 Nov 2017 19:12:42 +0100
Message-ID: <20171127181242.qaqlxpj6tnfyf3ei@kozik-lap>
References: <CGME20171121112435epcas4p25f529481eebd076f0fde78c500b04395@epcas4p2.samsung.com>
 <20171121112424.GA6650@lineageos.org>
 <59887245-ed25-ac1b-3bd4-b72c8fd1dd74@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37316 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdK0SMq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 13:12:46 -0500
Received: by mail-wm0-f54.google.com with SMTP id v186so36770330wma.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Nov 2017 10:12:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <59887245-ed25-ac1b-3bd4-b72c8fd1dd74@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Simon Shields <simon@lineageos.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Nov 21, 2017 at 04:06:38PM +0100, Marek Szyprowski wrote:
> Hi Simon,
> 
> On 2017-11-21 12:24, Simon Shields wrote:
> > trats2 uses gpf2-1 as the panel reset GPIO. gpy4-5 was only used
> > on early revisions of the board.
> > 
> > Fixes: 420ae8451a22 ("ARM: dts: exynos4412-trats2: add panel node")
> > Signed-off-by: Simon Shields <simon@lineageos.org>
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> It looks that this has been accidentally copy/pasted from the previous
> dts used for early version of the development board. I've checked the
> Trats2 schematic and indeed gpf2-1 is the correct pin for panel reset
> line.

Thanks for testing.

Thanks, applied.

Best regards,
Krzysztof
