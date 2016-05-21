From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: samsung: Suppress unbinding to prevent theoretical
 attacks
Date: Fri, 20 May 2016 22:30:30 -0400
Message-ID: <b71ecdbc-8650-a246-5e53-94eb620737ba@osg.samsung.com>
References: <1463469974-13340-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463469974-13340-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/17/2016 03:26 AM, Krzysztof Kozlowski wrote:
> Although unbinding a driver requires root privileges but it still might
> be used theoretically in certain attacks (by triggering NULL pointer
> exception or memory corruption if driver does not provide proper remove
> callbacks or core does not handle it).
> 
> Samsung clock drivers are essential for system operation so their
> removal is not expected. More over, the Exynos3250 ISP clock driver does
> not implement remove() driver callback and it is not buildable as
> modules.
> 
> Suppress the unbind interface for Exynos3250 ISP and S3C2410 DCLK clock
> drivers.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
