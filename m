From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2
 board
Date: Fri, 06 Oct 2017 15:44:18 +0200
Message-ID: <0d5b11a0-bd21-d70b-90ee-8862f7fc7d5b@samsung.com>
References: <1507212431-5801-1-git-send-email-m.purski@samsung.com>
        <CGME20171005140823eucas1p13dbb713c2aa513372694a395bbd25d91@eucas1p1.samsung.com>
        <1507212431-5801-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59143 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751875AbdJFNo0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 09:44:26 -0400
In-reply-to: <1507212431-5801-3-git-send-email-m.purski@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

On 05.10.2017 16:07, Maciej Purski wrote:
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
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
