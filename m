From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: S3C24XX: Add DMA slave maps for remaining s3c24xx
 SoCs
Date: Sat, 5 Nov 2016 17:50:32 +0200
Message-ID: <20161105155032.GC8183@kozik-lap>
References: <1478252753-8231-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36500 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754854AbcKEPuk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Nov 2016 11:50:40 -0400
Received: by mail-wm0-f65.google.com with SMTP id c17so8558568wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Nov 2016 08:50:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478252753-8231-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, sam.van.den.berge@telenet.be, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com

On Fri, Nov 04, 2016 at 10:45:53AM +0100, Sylwester Nawrocki wrote:
> This patch adds DMA slave map tables for the remaining s3c24xx
> SoC types so the whole platform can be switched to the new API.
> A few devices for which there was no DMA support with current
> code are omitted from the tables.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c24xx/common.c | 76 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
