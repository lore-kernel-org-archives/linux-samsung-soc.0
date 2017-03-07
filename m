From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Tue, 7 Mar 2017 21:22:58 +0200
Message-ID: <20170307192258.vi5z2haodwlgeey6@kozik-lap>
References: <CGME20170210022252epcas1p2cad2a32fb74a5ecc17ed73387579c6ab@epcas1p2.samsung.com>
 <20170210022238.12401-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35515 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755680AbdCGTvs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 14:51:48 -0500
Content-Disposition: inline
In-Reply-To: <20170210022238.12401-1-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>

On Fri, Feb 10, 2017 at 11:22:38AM +0900, Andi Shyti wrote:
> Add the device tree node for the ir-spi driver which enable the
> ir led for remote controlling.
> 
> This patch sets first the GPR3[3] gpio line as a regulator-fixed
> for enabling an external regulator which powers the IR LED.
> 
> Removes also the default assignment of GPG3[7] related to the
> MOSI line of the SPI3 bus.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
> Changelog v1 -> v2
> ==================
> v1: https://marc.info/?l=linux-kernel&m=148645523229894&w=2
> 
>  - used 'GPIO_ACTIVE_HIGH' instead of '0'
>  - added back the gpg3-5 gpio initialization related to the SPI3
>    CS line that was erroneously removed
>    
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Thanks, applied with fixed title prefix.

Best regards,
Krzysztof
