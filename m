From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks
Date: Mon, 10 Dec 2018 16:33:22 -0600
Message-ID: <20181210223322.GA16266@bogus>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165318eucas1p2dccd5382ee8b9f4da8c3076fb56607ee@eucas1p2.samsung.com>
 <20181204165248.17572-6-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-6-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 04, 2018 at 05:52:48PM +0100, Kamil Konieczny wrote:
> Add imem clocks for exynos5433. This will enable to use crypto Security
> SubSystem (in short SSS) and SlimSSS IP blocks.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 193 +++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos5433.h |  55 +++++++
>  2 files changed, 248 insertions(+)

Lots of trailing whitespace checkpatch errors...
