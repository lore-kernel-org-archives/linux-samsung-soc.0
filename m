From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/8] ARM: s3c64xx: Add DMA slave maps for PL080 devices
Date: Wed, 16 Nov 2016 18:57:29 +0200
Message-ID: <20161116165729.GB3727@kozik-lap>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <1478791076-19528-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33547 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKPQ5f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:57:35 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:50PM +0100, Sylwester Nawrocki wrote:
> This patch adds DMA slave map tables to the pl080 devices's
> platform_data in order to support the new channel request API.
> A few devices for which there was no DMA support with current
> code are omitted in the tables.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/pl080.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
