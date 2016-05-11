From: Matthew Leach <matthew@mattleach.net>
Subject: Re: [PATCH] ARM: dts: exynos: Enable AX88760 USB hub on Origen board
Date: Wed, 11 May 2016 19:18:31 +0100
Message-ID: <87y47gwj9k.fsf@mattleach.net>
References: <1462950412-16681-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1462950412-16681-1-git-send-email-k.kozlowski@samsung.com>
 (Krzysztof Kozlowski's message of "Wed, 11 May 2016 09:06:52 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Sorry for not acting on the feedback sooner - I lost the email in my
Inbox!

I've tested the patch on my Origen board and it works fine.  One small
comment in-line.

Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:

> From: Matthew Leach <matthew@mattleach.net>
>
> Enable the Origen's usb phy and ohci devices in the device tree.  Also
> add the "samsung,vbus-gpio" property to enable the GPX3(5) gpio pin so
> the AX88760 hub is powered.
>
> Signed-off-by: Matthew Leach <matthew@mattleach.net>
> [k.kozlowski: Extend nodes by label notation instead of path]
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 8bca699b7f20..4c59bdb0e6f3 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -77,12 +77,29 @@
>  			clock-frequency = <24000000>;
>  		};
>  	};
> +

I think we could loose this line break?

Thanks,
-- 
Matt
