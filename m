From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/6] ARM: s3c24xx: Improve a size determination in
 s3c2410_iotiming_get()
Date: Wed, 4 Oct 2017 20:12:20 +0200
Message-ID: <20171004181220.fwsz76kcj2l7dqd3@kozik-lap>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
 <3cccfa2f-4bcd-9c45-c56c-2b71b2ae4a42@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3cccfa2f-4bcd-9c45-c56c-2b71b2ae4a42@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 02, 2017 at 07:59:19PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 2 Oct 2017 19:16:58 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied, squashed with 5/6 and changed commit message as I had
troubles with understanding this one. Try to use simple sentences...

Best regards,
Krzysztof

