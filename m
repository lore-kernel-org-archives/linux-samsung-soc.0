From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 9/9] ARM: s5pv210_defconfig: Enable options needed to
 boot typical Linux distro
Date: Sat, 7 Jul 2018 10:49:55 +0200
Message-ID: <20180707084955.qsurxetcqafebazn@kozik-lap>
References: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530901970-14972-10-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530901970-14972-10-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 06, 2018 at 08:32:50PM +0200, Paweł Chmiel wrote:
> This commit enables few options which are required to boot
> typical Linux distro. It was tested by booting ArchLinux ARM
> from sdcard.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/configs/s5pv210_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
