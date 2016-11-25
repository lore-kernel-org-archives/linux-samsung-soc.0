From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos-audss: Replace syscore PM with
 platform device PM
Date: Fri, 25 Nov 2016 10:12:09 -0300
Message-ID: <dce8ffa9-7392-774c-c3b9-791aa5a2ffb0@osg.samsung.com>
References: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 11/25/2016 06:39 AM, Marek Szyprowski wrote:
> Exynos AUDSS clock driver has beem already converted to platform driver, so

s/beem/been

> remove the dependency on the syscore ops - the last remaining non-platform
> driver feature. Platform device's system sleep PM provides all needed
> infrastructure for replacing syscore-based PM, so do it now.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
