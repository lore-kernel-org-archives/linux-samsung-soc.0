From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos542x: add GSCL block parent clock
 management to pm domain
Date: Thu, 28 Jan 2016 21:59:01 +0900
Message-ID: <CAJKOXPehV37en9ZeL1o_pbriFp8vfKYiHbEOg5A1pByAnJM5fw@mail.gmail.com>
References: <5667B38E.5020207@samsung.com>
	<1449648455-18279-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36792 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966540AbcA1M7D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2016 07:59:03 -0500
In-Reply-To: <1449648455-18279-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>

2015-12-09 17:07 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Add support for restoring GScaler parent clocks configuration when GSCL
> power domain is turned on.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Applied, thanks!

BR,
Krzysztof
