From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: Delete two error messages for a failed
 memory allocation in samsung_bl_set()
Date: Wed, 4 Oct 2017 20:38:35 +0200
Message-ID: <20171004183835.7mtvoyia7ta4uqxl@kozik-lap>
References: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
 <7f06d074-231b-85b9-3649-304edce6bc2c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36581 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdJDSii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 14:38:38 -0400
Content-Disposition: inline
In-Reply-To: <7f06d074-231b-85b9-3649-304edce6bc2c@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 02, 2017 at 10:39:56PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 2 Oct 2017 22:20:39 +0200
> 
> Omit extra messages for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/mach-s3c64xx/dev-backlight.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
