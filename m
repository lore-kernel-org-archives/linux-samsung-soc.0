From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request
 API
Date: Thu, 10 Nov 2016 20:42:10 +0200
Message-ID: <20161110184210.GA11835@kozik-lap>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34724 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755525AbcKJSmR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 13:42:17 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:48PM +0100, Sylwester Nawrocki wrote:
> This patch series aims to convert the s3c64xx platform to use
> the new DMA channel request API, i.e. this is only meaningful 
> for non-dt systems using s3c64xx SoCs.
> 
> Presumably the first 2 or 4 patches in this series could be queued 
> for v4.10-rc1 and the remaining patches could be left for subsequent
> release, to avoid non-trivial conflict with patches already applied 
> in the ASoC tree.

Sounds good to me. Should I put the ARM/s3c64xx commits on separate
branch in case someone would like to pull a tag with it?

Best regards,
Krzysztof
