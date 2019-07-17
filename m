From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 23/50] ARM: dts: exynos: change lowest OPP in
 bus_disp1_fimd in Exynos5420
Date: Wed, 17 Jul 2019 11:08:11 +0200
Message-ID: <CAJKOXPeTsS_4MGfgT6ZnP8PzeaaP7Du71TxD3cQZXougGgvKXw@mail.gmail.com>
References: <CGME20190715124452eucas1p294d89255359b2036b19213427f558dbf@eucas1p2.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-24-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-24-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The lowest OPP must be aligned to possible value after division of parent
> clock rate. Thus, change it to the value which is true for clock 1200MHz.

I think this is getting slightly too granular. It seems you are
solving the same problem (or very small subset of the same problem) as
in patch 22:
https://patchwork.kernel.org/patch/11043849/

Please combine such changes per IP block, unless you have really
reproducible different issues (e.g. reproducible different performance
problem or OOPS, but not just what clk_summary prints). I imagine that
you align entire subsystem (DISP) buses to real clock frequencies (or
to match real frequencies, or to achieve more granular scaling, or to
get slightly better performance).

Best regards,
Krzysztof
