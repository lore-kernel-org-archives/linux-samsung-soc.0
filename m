From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5422: add missing parent GSCL
 block clocks
Date: Wed, 09 Dec 2015 13:49:55 +0900
Message-ID: <5667B2F3.9040807@samsung.com>
References: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08.12.2015 22:46, Marek Szyprowski wrote:
> This patch adds clocks, which are required for preserving parent clock
> configuration on GSCL power domain on/off.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   | 8 ++++----
>  include/dt-bindings/clock/exynos5420.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)

I suppose that, with ack from clock folks, this can go through samsung-soc?

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
