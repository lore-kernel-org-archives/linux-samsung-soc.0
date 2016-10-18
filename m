From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 1/2] ARM: dts: Add TOPEET itop core board SCP package
 version
Date: Tue, 18 Oct 2016 20:34:14 +0300
Message-ID: <20161018173414.GA30003@kozik-lap>
References: <devicetree@vger.kernel.org>
 <1476811129-4450-1-git-send-email-ayaka@soulik.info>
 <1476811129-4450-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476811129-4450-2-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 19, 2016 at 01:18:48AM +0800, Randy Li wrote:
> The TOPEET itop is a samsung exnynos 4412 core board, which have
> two package versions. This patch add the support for SCP version.
> 
> Currently supported are USB3503A HSIC, USB OTG, eMMC, rtc and
> PMIC. The future features are in the based board. Also MFC and
> watchdog have been enabled.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 501 ++++++++++++++++++++++++
>  1 file changed, 501 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi


Thanks, applied, with minor changes in commit msg and fix in pin
function (you used macro for pull up/down instead of function).

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
