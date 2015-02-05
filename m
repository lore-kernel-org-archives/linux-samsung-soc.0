From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 3/3] ARM: EXYNOS: Remove left over 'extra_save'
Date: Thu, 5 Feb 2015 21:37:15 +0530
Message-ID: <CAGcde9GiJRWFwtObWCOZeOo1Ax2MfjtaOEv0iNPNo5W9UDjTFw@mail.gmail.com>
References: <1423121002-25117-1-git-send-email-k.kozlowski@samsung.com> <1423121002-25117-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:54497 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757435AbbBEQHh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 11:07:37 -0500
In-Reply-To: <1423121002-25117-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof

On 5 February 2015 at 12:53, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
>
> Since 32b0aa9aaeb4 ("ARM: EXYNOS: Remove i2c sys configuration related
> code") the Exynos 5250 no longer saves additional registers under
> 'exynos_pm_data.extra_save' field.
>
> No one else uses this code so get rid of it making also 'exynos_pm_data'
> const everywhere.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
