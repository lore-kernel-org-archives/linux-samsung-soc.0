From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos542x: add GSCL block parent clock
 management to pm domain
Date: Wed, 9 Dec 2015 22:38:12 +0900
Message-ID: <56682EC4.3040101@samsung.com>
References: <5667B38E.5020207@samsung.com>
 <1449648455-18279-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449648455-18279-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 09.12.2015 o 17:07, Marek Szyprowski pisze:
> Add support for restoring GScaler parent clocks configuration when GSCL
> power domain is turned on.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Changelog is always nice, even though the traffic on samsung-soc is not
huge now.

Anyway, thanks for update:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
