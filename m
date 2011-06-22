From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH V5 5/5] ARM: EXYNOS4: Add platform data for EXYNOS4 FIMD
 and LTE480WV platform-lcd
Date: Wed, 22 Jun 2011 22:33:24 +0200
Message-ID: <4E025194.5040603@gmail.com>
References: <1308724904-31521-1-git-send-email-jg1.han@samsung.com>	<002901cc30c1$5ac6ef70$1054ce50$%szyprowski@samsung.com>	<BANLkTimPjo+WefApQLe=HKbYLCwmo_gGRw@mail.gmail.com> <BANLkTi=iS3H8xYhouvZZwP5_daxoGSBwLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:54466 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758077Ab1FVUdc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 16:33:32 -0400
In-Reply-To: <BANLkTi=iS3H8xYhouvZZwP5_daxoGSBwLA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Kumar N <anand.kn@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, Jonghun Han <jonghun.han@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Inki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

On 06/22/2011 03:25 PM, Anand Kumar N wrote:
> Instead of hardcoding the parent clock in platform/bootloader code ,is
> it not possible to select/set the
> parent clock based on the pixel clk(plat data) having the least delta
> with the 9 src clks.with this change I have checked it for WA101S.

While at first sight this may look as an awesome idea I don't really 
believe it is. There might be other criteria that need to be considered,
like continuous clock availability or frequency stability. 
That said we could possibly have the driver setting sclk_fimd frequency
based on display planes' properties (this was my initial suggestion) 
but sclk_fimd parent should be fixed either by bootloader or board
initialization code.
