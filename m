From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2
 board
Date: Thu, 31 Aug 2017 21:36:35 +0200
Message-ID: <20170831193635.wuw7vdanhj3vu46y@kozik-lap>
References: <1504182434-8201-1-git-send-email-m.purski@samsung.com>
 <CGME20170831122749eucas1p2c6712236398e8c19a5eb24641bb0020b@eucas1p2.samsung.com>
 <1504182434-8201-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f175.google.com ([209.85.161.175]:35486 "EHLO
        mail-yw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdHaTgk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 15:36:40 -0400
Content-Disposition: inline
In-Reply-To: <1504182434-8201-3-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, b.zolnierkie@samsung.com

On Thu, Aug 31, 2017 at 02:27:14PM +0200, Maciej Purski wrote:
> Add HDMI and Sil9234 MHL converter to Trats2 board.
> Following in SoC devices have been enabled:
> - HDMI (HDMI signal encoder),
> - Mixer (video buffer scanout device),
> - I2C_5 bus (used for HDMI DDC)
> - I2C_8 bus (used for HDMI_PHY control).
> 
> Based on previous work by:
> Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
> Changes in v2:
> - fix commit message
> - add regulators nodes to model actual physical connections
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 111 ++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)

I think all of my previous comments were missed...

Best regards,
Krzysztof
