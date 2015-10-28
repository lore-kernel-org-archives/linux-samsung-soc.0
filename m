From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
Date: Wed, 28 Oct 2015 10:06:47 +0900
Message-ID: <56301FA7.3000206@samsung.com>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61352 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754908AbbJ1BG5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 21:06:57 -0400
In-reply-to: <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On 26.10.2015 20:59, Andrzej Hajda wrote:
> DECON-TV(Display and Enhancement Controller for TV) is a variation
> of DECON IP. Its main purpose is to produce video stream for HDMI IP.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi Krzysztof,
> 
> I have decided to skip cleanup part as it would require more work,
> not related to this patchset.
> 
> Regards
> Andrzej
> 
>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for splitting this, looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
