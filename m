From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [patch 3/9] ARM: S3C24XX: Fix invalid SPDX identifier
Date: Mon, 23 Apr 2018 17:26:59 +0200
Message-ID: <20180423152659.xrvk73z3mj3j66mq@kozik-lap>
References: <20180422220208.772527041@linutronix.de>
 <20180422220832.982315239@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180422220832.982315239@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Arnaud Patard <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 23, 2018 at 12:02:11AM +0200, Thomas Gleixner wrote:
> GPL-1.0 is not part of the valid identifier list and as its meaning is GPL
> version 1.0 only this would be incompatible with the kernel license.
> 
> As this code was included into the kernel, assume its GPL-1.0+
> 
> Fixes: 84b2170109e4 ("ARM: S3C24XX: Add SPDX license identifiers")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  arch/arm/mach-s3c24xx/h1940-bluetooth.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

+Cc samsung-soc

Thanks, applied.

Best regards,
Krzysztof
