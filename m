From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: ddr: Add bindings for Samsung LPDDR3 memories
Date: Wed, 18 Sep 2019 20:51:55 +0200
Message-ID: <CAJKOXPcxG-mMKy5u-b0+xj_sOmrq5yq5-LYJx0Ds6_+yo_=JbA@mail.gmail.com>
References: <CGME20190916100719eucas1p206fe95982b774840b5d6e62ba9c42c79@eucas1p2.samsung.com>
 <20190916100704.26692-1-l.luba@partner.samsung.com> <20190916100704.26692-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916100704.26692-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 16 Sep 2019 at 12:07, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Add compatible for Samsung k3qf2f20db LPDDR3 memory bindings.
> Introduce minor fixes in the old documentation.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  Documentation/devicetree/bindings/ddr/lpddr3.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
> index 3b2485b84b3f..49afe794daaa 100644
> --- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
> +++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
> @@ -1,7 +1,9 @@
>  * LPDDR3 SDRAM memories compliant to JEDEC JESD209-3C
>
>  Required properties:
> -- compatible : Should be  - "jedec,lpddr3"
> +- compatible : should be one of the following:
> +       Generic default - "jedec,lpddr3".

The convention is first compatible, then description. I gave you the
example to base on - at25. Why making it different?

Best regards,
Krzysztof
