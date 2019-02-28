From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: exynos: Add ADC clock ID to
 Exynos5410
Date: Thu, 28 Feb 2019 12:23:11 -0600
Message-ID: <20190228182311.GA18866@bogus>
References: <20190212175052.6310-1-krzk@kernel.org>
 <20190212175052.6310-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212175052.6310-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 18:50:50 +0100, Krzysztof Kozlowski wrote:
> Add ID for TSADC clock to Exynos5410.  Choose the same value of ID as in
> Exynos5420 to make it simpler/compatible in future (although clock
> driver code is not shared).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/dt-bindings/clock/exynos5410.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
