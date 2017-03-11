From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/8] watchdog: s3c2410: Fix infinite interrupt in soft
 mode
Date: Sat, 11 Mar 2017 19:29:09 +0200
Message-ID: <20170311172909.5brghl4szwijumtt@kozik-lap>
References: <20170311172527.16368-1-krzk@kernel.org>
 <20170311172527.16368-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170311172527.16368-3-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Mar 11, 2017 at 07:25:21PM +0200, Krzysztof Kozlowski wrote:
> In soft (no-reboot) mode, the driver self-pings watchdog upon expiration
> of an interrupt.  However the interrupt itself was not cleared thus on
> first hit, the system enters infinite interrupt handling loop.
> 
> On Odroid U3 (Exynos4412), when booted with s3c2410_wdt.soft_noboot=1
> argument the console is flooded:
> 	# killall -9 watchdog
> 	[   60.523760] s3c2410-wdt 10060000.watchdog: watchdog timer expired (irq)
> 	[   60.536744] s3c2410-wdt 10060000.watchdog: watchdog timer expired (irq)
> 
> Fix this by writing something to the WTCLRINT register to clear the
> interrupt.  The register WTCLRINT however appeared in S3C6410 so a new
> watchdog quirk and flavor are needed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt    |  9 +++++----
>  drivers/watchdog/s3c2410_wdt.c                      | 21 ++++++++++++++++++---
>  2 files changed, 23 insertions(+), 7 deletions(-)
>

This can be ignored, already applied.


Best regards,
Krzysztof
