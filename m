From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: ddr: Add bindings for Samsung LPDDR3 memories
Date: Fri, 6 Sep 2019 12:56:42 +0200
Message-ID: <CAJKOXPfoYxTVvt_bMQOs1=BkHzUuW_WvL9zn0jTGS6LLpv=fhQ@mail.gmail.com>
References: <CGME20190906101407eucas1p15eb0df53374b27497b4793eab24becf6@eucas1p1.samsung.com>
 <20190906101344.3535-1-l.luba@partner.samsung.com> <20190906101344.3535-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906101344.3535-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 6 Sep 2019 at 12:14, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Add description of bindings for Samsung k3qf2f20db LPDDR3 memory.
> Minor fixes in the old documentation.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  .../devicetree/bindings/ddr/lpddr3.txt        | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
> index 3b2485b84b3f..de0905239767 100644
> --- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
> +++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
> @@ -40,10 +40,34 @@ Child nodes:
>    a given speed-bin. Please see Documentation/devicetree/
>    bindings/ddr/lpddr3-timings.txt for more information on "lpddr3-timings"
>
> +Samsung K3QF2F20DB LPDDR3 memory
> +------------------------------------------------------------
> +
> +This binding uses the LPDDR3 binding (described above)
> +
> +Required properties:
> +- compatible:  Should be:
> +               "samsung,K3QF2F20DB"
> +               followed by "jedec,lpddr3"
> +- density  : <u32> representing density in Mb (Mega bits)
> +- io-width : <u32> representing bus width. Possible value 32
> +- #address-cells: Must be set to 1
> +- #size-cells: Must be set to 0

If you decided to repeat all properties again, then it deserves its
own bindings file. However I though about simpler solution - just
document compatible. Exactly the same as AT24 or AT25 EEPROM bindings.
There is not much benefit from copying all these properties.

Best regards,
Krzysztof
