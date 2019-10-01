From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: timer: Use defines instead of
 numbers in Exynos MCT examples
Date: Tue, 1 Oct 2019 08:39:39 -0500
Message-ID: <20191001133939.GA13715@bogus>
References: <20190930154418.4884-1-krzk@kernel.org>
 <20190930154418.4884-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190930154418.4884-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 30 Sep 2019 17:44:18 +0200, Krzysztof Kozlowski wrote:
> Make the examples in Exynos Multi Core Timer bindings more readable and
> bring them closer to real DTS by using defines for interrupt flags.
> Fix also GIC interrupt type in example for Exynos4412 (from SPI to PPI).
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use GIC_PPI where applicable.
> 
> Rebased on top of:
> https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=177667&state=*
> ---
>  .../timer/samsung,exynos4210-mct.yaml         | 37 ++++++++++++++-----
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 

Applied, thanks.

Rob
