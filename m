From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT v4 6/8] ARM: dts: exynos: Remove MCT subnode for interrupt
 map on Exynos5250
Date: Tue, 24 Sep 2019 09:01:11 +0200
Message-ID: <CAJKOXPck6GhOk-ewByb=UtQsX7_NxVH=Aci77ODEAh3YfJKmiQ@mail.gmail.com>
References: <20190923161411.9236-1-krzk@kernel.org> <CGME20190923161450epcas4p32dfa1273d244c1392c7bfb4c352f2d3e@epcas4p3.samsung.com>
 <20190923161411.9236-6-krzk@kernel.org> <7ad1898d-3aa7-db49-78c1-c42b34568c60@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ad1898d-3aa7-db49-78c1-c42b34568c60@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 24 Sep 2019 at 08:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 23.09.2019 18:14, Krzysztof Kozlowski wrote:
> > Multi Core Timer node has interrupts routed to two different parents -
> > GIC and combiner.  This was modeled with a interrupt-map within a
> > subnode but can be expressed in an easier and more common way, directly
> > in the node itself.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Works fine on Arndale and Snow boards.

Thanks for testing!
