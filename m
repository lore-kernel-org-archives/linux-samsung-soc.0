From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Constify local exynos_pmu_data structure
Date: Thu, 29 Oct 2015 07:38:53 +0530
Message-ID: <CAGcde9GCbzt2F8DznfV+w5Lo3Gm-ORCxCiG3BRJryxiuyX-7bw@mail.gmail.com>
References: <1446082845-4974-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37726 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbJ2CJP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 22:09:15 -0400
In-Reply-To: <1446082845-4974-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Pavel Fedin <p.fedin@samsung.com>

On 29 October 2015 at 07:10, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> The Exynos5420 instance of exynos_pmu_data structure is not modified and
> can be made const.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Pavel Fedin <p.fedin@samsung.com>

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
