From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/8] ARM: s3c64xx: Drop initialization of unused struct
 s3c_audio_pdata fields
Date: Wed, 28 Dec 2016 19:53:44 +0200
Message-ID: <20161228175344.3krz2hqrem56ypg6@kozik-lap>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <1478791076-19528-8-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35422 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751731AbcL1RyB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 12:54:01 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-8-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:55PM +0100, Sylwester Nawrocki wrote:
> Remove initialization of dma_{filter, playback, capture, capture_mic}
> fields where it is not used any more.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/dev-audio.c | 19 -------------------
>  1 file changed, 19 deletions(-)
>

Sylwester,

This and 8/8 should be safe to apply, right?

BR,
Krzysztof
