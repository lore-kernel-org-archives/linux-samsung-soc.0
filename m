From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv3 1/2] ARM: dts: exynos5420: add nodes for jpeg codec
Date: Mon, 25 May 2015 18:14:55 +0900
Message-ID: <CAJKOXPfSo-_ngR452V=ucjOLpOt=sNaSMMnVfuFEJEdb4oTt6g@mail.gmail.com>
References: <1425904366-14447-1-git-send-email-andrzej.p@samsung.com>
	<1425904366-14447-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1425904366-14447-2-git-send-email-andrzej.p@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2015-03-09 21:32 GMT+09:00 Andrzej Pietrasiewicz <andrzej.p@samsung.com>:
> Add nodes for jpeg codec in Exynos5420 SoC.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The patch adding bindings documentation and changing s5p-jpeg driver
was merged (7c15fd4bf3d3 merged in 4.1-rc1 cycle) so this can be
safely picked up by Samsung tree. Kukjin, can you apply it?

Best regards,
Krzysztof
