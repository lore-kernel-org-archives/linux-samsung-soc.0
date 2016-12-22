From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos542x: mark some clocks as critical
Date: Thu, 22 Dec 2016 10:07:26 -0300
Message-ID: <f9860a1a-139d-ea76-371d-ddfb4eb09ef1@osg.samsung.com>
References: <CGME20161222094441epcas5p330bb16763e02149a275c30eb644b0e7c@epcas5p3.samsung.com>
 <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 12/22/2016 06:44 AM, Marek Szyprowski wrote:
> Some parent clocks of the Exynos542x clock blocks, which have separate
> power domains (like DISP, MFC, MSC, GSC, FSYS and G2D) must be always
> enabled to access any register related to power management unit or devices
> connected to it. For the time being, until a proper solution based on
> runtime PM is applied, mark those clocks as critical (instead of ignore
> unused or even no flags) to prevent disabling them.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

And on an Exynos5800 Peach Pi Chromebook:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
