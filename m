From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/5] arm: dts: Remove the OF graph from DSI node for
 exynos3250 dts
Date: Mon, 20 Feb 2017 15:09:04 +0200
Message-ID: <CAJKOXPd+dXFO4BD3ivyLPtRaWK8q3-Brv_U23ekVoFdX-v7ERA@mail.gmail.com>
References: <CGME20170209012717epcas5p2e48b2bc891e65f8860b22e6de4c18de7@epcas5p2.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com> <1486603601-26826-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752383AbdBTNJ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 08:09:28 -0500
In-Reply-To: <1486603601-26826-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Thu, Feb 9, 2017 at 3:26 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> The OF graph is not needed because the panel is a child of dsi. So
> Remove the ports node and move burst and esc clock frequency
> properties to the parent (DSI node).
>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
>

Please use scripts/get_maintainers.pl to get the list of people and
maling lists to CC.

Best regards,
Krzysztof
