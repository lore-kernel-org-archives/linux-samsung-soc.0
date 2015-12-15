From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 10/11] arm/samsung: Change s3c_pm_run_res() to use System
 RAM type
Date: Tue, 15 Dec 2015 09:19:58 +0900
Message-ID: <566F5CAE.5020004@samsung.com>
References: <1450136246-17053-1-git-send-email-toshi.kani@hpe.com>
 <1450136246-17053-10-git-send-email-toshi.kani@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47232 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932649AbbLOAUF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2015 19:20:05 -0500
In-reply-to: <1450136246-17053-10-git-send-email-toshi.kani@hpe.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Toshi Kani <toshi.kani@hpe.com>, akpm@linux-foundation.org, bp@alien8.de
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On 15.12.2015 08:37, Toshi Kani wrote:
> Change s3c_pm_run_res() to check with IORESOURCE_SYSTEM_RAM,
> instead of strcmp() with "System RAM", in the resource table.
> 
> No functional change is made to the interface.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Toshi Kani <toshi.kani@hpe.com>
> ---
>  arch/arm/plat-samsung/pm-check.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
