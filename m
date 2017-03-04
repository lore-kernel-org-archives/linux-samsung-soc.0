From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/7] Fix the parse_dt of exynos dsi and remove the OF
 graph
Date: Sat, 4 Mar 2017 10:23:13 +0200
Message-ID: <20170304082313.c6muov76oiwl23tr@kozik-lap>
References: <CGME20170302102112epcas5p476b30508bbaffbf1fe9781b941cd418f@epcas5p4.samsung.com>
 <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <20170303002206.zh56dsx7iuysg374@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170303002206.zh56dsx7iuysg374@gangnam.samsung>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, airlied@linux.ie, catalin.marinas@arm.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, inki.dae@samsung.com, javier@osg.samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, will.deacon@arm.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 03, 2017 at 09:22:06AM +0900, Andi Shyti wrote:
> Hi Hoegeun,
> 
> > Hoegeun Kwon (7):
> >   arm64: dts: exynos: Add the burst and esc clock frequency properties
> >     for exynos5433 dts
> >   arm: dts: Add the burst and esc clock frequency properties for
> >     exynos3250 dts
> >   arm: dts: Add the burst and esc clock frequency properties for
> >     exynos4412 dts
> >   arm: dts: Add the burst and esc clock frequency properties for
> >     exynos4210 dts
> >   drm/exynos: dsi: Fix the parse_dt function
> >   arm64: dts: exynos: Remove the OF graph from DSI node
> >   arm: dts: Remove the OF graph from DSI node
> 
> for all of them:
> 
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Andi,

Thanks for review. It is much welcomed.

I am trying not loose such review tags but it might happen because:
1. Patchwork does not store them,
2. Mail does not sit in inbox for long (inbox zero),
so if it is possible the most convenient for me is to reply with review
to each email.

> 
> although I would have squashed patch 2, 3 and 4, but no need to
> resend, unless someone else agrees.

Yes, these are small additions to the same arch so they could be
indeed squashed. I don't mind keeping them separated though.

Best regards,
Krzysztof
