From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH 1/3] ARM: dts: Add TOPEET itop core board SCP
 package version
Date: Wed, 31 Aug 2016 20:42:26 +0200
Message-ID: <20160831184226.GA23416@kozik-lap>
References: <a35686c3-294b-a16a-2b0e-0ef2fd460244@kernel.org>
 <1472648307-3818-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472648307-3818-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 31, 2016 at 08:58:27PM +0800, Randy Li wrote:
> The TOPEET itop is a samsung exnynos 4412 core board, which have
> two package versions. This patch add the support for SCP version.
> 
> Currently supported are USB3503A HSIC, USB OTG, eMMC, rtc and
> PMIC. The future features are in the based board. Also MFC and
> watchdog have been enabled.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 490 ++++++++++++++++++++++++
>  1 file changed, 490 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi

You are not making the review process easier... I asked for:
1. Not chaining the consecutive versions of patchset to the previous
ones. But now you removed chain replies totally (also from patches).
2. Versioning all patches.... but this is a resend of v1?

The changelog and cover letters disappeared...

Please, make it simple:
[PATCH v5 0/3] ARM: dts: exynos: some cover letter etc etc
  \---[PATCH v5 1/3] ARM: dts: exynos: Add TOPEET itop core board SCP
  \---[PATCH v5 2/3] ARM: dts: exynos: something more
  \---[PATCH v5 3/3] ARM: dts: exynos: something even more

git format-patch and git send-email do this by default. In every
sensible mail program this looks like that and is easy to read.

I don't have a clue what happened to these patches and what is current
status...

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
