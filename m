From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] clk: s2mps11: Use existing defines from bindings for
 clock IDs
Date: Tue, 14 Aug 2018 14:37:39 -0600
Message-ID: <20180814203739.GA27965@rob-hp-laptop>
References: <20180807161713.28073-1-krzk@kernel.org>
 <20180807161713.28073-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807161713.28073-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue,  7 Aug 2018 18:17:13 +0200, Krzysztof Kozlowski wrote:
> The clock IDs must match between DeviceTree bindings and the driver.
> There is already a header file used by DeviceTree sources so include it
> in the driver to remove duplicated symbols.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/clk-s2mps11.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
