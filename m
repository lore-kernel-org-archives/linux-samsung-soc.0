From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: replace hardcoded reserved memory
 ranges with auto-allocated ones
Date: Wed, 08 Jun 2016 09:48:28 +0200
Message-ID: <5757CDCC.3010407@samsung.com>
References: <2241b7f4-4565-d17b-10f3-5c27cd9985da@osg.samsung.com>
 <1465301018-9671-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31525 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098AbcFHHsc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:48:32 -0400
In-reply-to: <1465301018-9671-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 06/07/2016 02:03 PM, Marek Szyprowski wrote:
> Generic reserved memory regions bindings allow to automatically allocate
> region of given parameters (alignment and size), so use this feature
> instead of the hardcoded values, which had no dependency on the real
> hardware. This patch also increases "left" region from 8MiB to 16MiB to
> make the codec really usable with nowadays steams (with 8MiB reserved
> region it was not even possible to decode 480p H264 video).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied all three on top of topic branch.

Thanks,
Krzysztof
