From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clock: exynos: Put CLK_UART3 in order
Date: Thu, 28 Feb 2019 12:22:41 -0600
Message-ID: <20190228182241.GA18048@bogus>
References: <20190212175052.6310-1-krzk@kernel.org>
 <20190212175052.6310-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212175052.6310-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 18:50:49 +0100, Krzysztof Kozlowski wrote:
> Order the CLK_UART3 by ID.  No change in functionality.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/dt-bindings/clock/exynos5410.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
