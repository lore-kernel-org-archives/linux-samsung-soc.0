From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 8/9] ARM: s5pv210_defconfig: Enable drivers for
 Samsung Aries based phones
Date: Sat, 7 Jul 2018 10:49:43 +0200
Message-ID: <20180707084943.omc3efkrxbqxaofx@kozik-lap>
References: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530901970-14972-9-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530901970-14972-9-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 06, 2018 at 08:32:49PM +0200, Paweł Chmiel wrote:
> Enable config options required for Samsung Aries based phones.
> ARM_APPENDED_DTB is also needed, because stock bootloader
> does not support loading dtb files.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/configs/s5pv210_defconfig | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
