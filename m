From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/6] ARM: s3c24xx: Delete an error message for a failed
 memory allocation in s3c2412_iotiming_get()
Date: Wed, 4 Oct 2017 20:03:56 +0200
Message-ID: <20171004180356.ar3bfkvppvaxjkwi@kozik-lap>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
 <381d4a29-d777-93ee-ed4d-3f41a5ed97cc@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <381d4a29-d777-93ee-ed4d-3f41a5ed97cc@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 02, 2017 at 08:01:28PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 2 Oct 2017 19:37:07 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/mach-s3c24xx/iotiming-s3c2412.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Thanks, applied, squashed with 1/6.

Best regards,
Krzysztof

