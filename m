From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH] ARM: s3c64xx: smartq: Avoid sparse warnings
Date: Mon, 11 Jul 2016 17:47:19 +0200
Message-ID: <20160711154719.GA7702@kozik-lap>
References: <20160711084836.12835-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36708 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753613AbcGKPrY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 11:47:24 -0400
Received: by mail-lf0-f51.google.com with SMTP id q132so76700120lfe.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jul 2016 08:47:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160711084836.12835-1-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Jul 11, 2016 at 10:48:36AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The smartq_map_io() and smartq_machine_init() functions are used by both
> SmartQ 5 and SmartQ 7 machines and exported via the mach-smartq.h header
> file. However that header file is not included by the mach-smartq.c file
> that implements them, causing sparse warnings.
> 
> Include mach-smartq.h from mach-smartq.c to fix these warnings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/mach-s3c64xx/mach-smartq.c | 1 +
>  1 file changed, 1 insertion(+)
>

Thanks, applied.

Best regards,
Krzysztof
