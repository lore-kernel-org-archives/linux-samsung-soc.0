From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] clk: s2mps11: Fix matching when built as module and DT node
 contains compatible
Date: Wed, 25 Jul 2018 16:48:32 -0700
Message-ID: <153256251231.48062.2127272830110571402@swboyd.mtv.corp.google.com>
References: <20180725155517.4872-1-krzk@kernel.org>
 <20180725155517.4872-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180725155517.4872-2-krzk@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2018-07-25 08:55:15)
> When driver is built as module and DT node contains clocks compatible
> (e.g. "samsung,s2mps11-clk"), the module will not be autoloaded because
> module aliases won't match.
> =

> The modalias from uevent: of:NclocksT<NULL>Csamsung,s2mps11-clk
> The modalias from driver: platform:s2mps11-clk
> =

> The devices are instantiated by parent's MFD.  However both Device Tree
> bindings and parent define the compatible for clocks devices.  In case
> of module matching this DT compatible will be used.
> =

> The issue will not happen if this is built-in (no need for module
> matching) or when clocks DT node does not contain compatible (not
> correct from bindings perspective but working for driver).
> =

> Note when backporting to stable kernels: adjust the list of device ID
> entries.
> =

> Cc: <stable@vger.kernel.org>
> Fixes: 53c31b3437a6 ("mfd: sec-core: Add of_compatible strings for clock =
MFD cells")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
