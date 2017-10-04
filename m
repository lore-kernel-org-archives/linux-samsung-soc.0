From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: s3c64xx: Delete an unnecessary return statement
 in samsung_bl_set()
Date: Wed, 4 Oct 2017 20:40:58 +0200
Message-ID: <20171004184058.vn74ricacf476j7q@kozik-lap>
References: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
 <6d599b4d-93e3-3e3e-875a-f24ee879ca74@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36296 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbdJDSlC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 14:41:02 -0400
Content-Disposition: inline
In-Reply-To: <6d599b4d-93e3-3e3e-875a-f24ee879ca74@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 02, 2017 at 10:40:44PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 2 Oct 2017 22:30:55 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: void function return statements are not generally useful
> 
> Thus remove such a statement in the affected function.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/mach-s3c64xx/dev-backlight.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
