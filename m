From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: SAMSUNG: Delete an error message for a failed
 memory allocation in three functions
Date: Wed, 4 Oct 2017 21:04:28 +0200
Message-ID: <20171004190428.6agsco3456oeyab5@kozik-lap>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
 <ae29b97e-9a60-fdf4-5bd2-af33f6081446@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ae29b97e-9a60-fdf4-5bd2-af33f6081446@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 04, 2017 at 01:11:56PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Oct 2017 09:33:52 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/plat-samsung/adc.c          | 8 ++------
>  arch/arm/plat-samsung/platformdata.c | 4 +---
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
