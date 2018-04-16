From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: s3c24xx: mini2440: use device properties for at24
 eeprom
Date: Mon, 16 Apr 2018 20:18:42 +0200
Message-ID: <20180416181842.efu2uaorbcgzq7pi@kozik-lap>
References: <20180404115147.16448-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180404115147.16448-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 04, 2018 at 01:51:47PM +0200, Bartosz Golaszewski wrote:
> We want to work towards phasing out the at24_platform_data structure.
> There are few users and its contents can be represented using generic
> device properties. Using device properties only will allow us to
> significantly simplify the at24 configuration code.
> 
> Remove the at24_platform_data structure and replace it with an array
> of property entries. Drop the byte_len/size property, as the model name
> already implies the EEPROM's size.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
