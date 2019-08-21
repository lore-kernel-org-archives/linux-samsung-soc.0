From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: s3c64xx: squash samsung_usb_phy.h into
 setup-usb-phy.c
Date: Wed, 21 Aug 2019 19:56:09 +0200
Message-ID: <20190821175609.GA6768@kozik-lap>
References: <20190819155602.20843-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819155602.20843-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 12:56:02AM +0900, Masahiro Yamada wrote:
> This is only used by arch/arm/mach-s3c64xx/setup-usb-phy.c
> 
> $ git grep samsung_usb_phy_type
> include/linux/usb/samsung_usb_phy.h:enum samsung_usb_phy_type {
> $ git grep USB_PHY_TYPE_DEVICE
> arch/arm/mach-s3c64xx/setup-usb-phy.c:  if (type == USB_PHY_TYPE_DEVICE)
> arch/arm/mach-s3c64xx/setup-usb-phy.c:  if (type == USB_PHY_TYPE_DEVICE)
> include/linux/usb/samsung_usb_phy.h:    USB_PHY_TYPE_DEVICE,
> $ git grep USB_PHY_TYPE_HOST
> include/linux/usb/samsung_usb_phy.h:    USB_PHY_TYPE_HOST,
> 
> Actually, 'enum samsung_usb_phy_type' is unused; the 'type' parameter
> has 'int' type. Anyway, there is no need to declare this enum in the
> globally visible header. Squash the header.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/mach-s3c64xx/setup-usb-phy.c        |  5 +++++
>  arch/arm/plat-samsung/include/plat/usb-phy.h |  2 --
>  include/linux/usb/samsung_usb_phy.h          | 17 -----------------
>  3 files changed, 5 insertions(+), 19 deletions(-)

Thanks, applied.

Best regards,
Krzysztof
