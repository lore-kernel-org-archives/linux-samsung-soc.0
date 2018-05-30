From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 09/10] ARM: dts: exynos5250: add DSI node
Date: Wed, 30 May 2018 16:32:57 +0200
Message-ID: <CAJKOXPdRxLxw6+AC5moC4327W5GMgBN0q3a9odq=adsFGxmdqA@mail.gmail.com>
References: <CGME20180530121629eucas1p2cc1a8c3f5a8e704f4d6f3cf75834cf00@eucas1p2.samsung.com>
 <1527682561-1386-1-git-send-email-m.purski@samsung.com> <1527682561-1386-10-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527682561-1386-10-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 30, 2018 at 2:16 PM, Maciej Purski <m.purski@samsung.com> wrote:
> From: Andrzej Hajda <a.hajda@samsung.com>
>
> The patch adds common part of DSI node for Exynos5250 platforms
> and a required mipi-phy node.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Thanks for changes. I'll take both DTS patches after bindings get
accepted and after upcomming merge window.

Best regards,
Krzysztof
