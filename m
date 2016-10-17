From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/2] ARM: dts: Add TOPEET itop core board SCP package
 version
Date: Mon, 17 Oct 2016 19:27:59 +0300
Message-ID: <20161017162759.GA25818@kozik-lap>
References: <1474300103-26659-1-git-send-email-ayaka@soulik.info>
 <1474300103-26659-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33540 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935893AbcJQQ2O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 12:28:14 -0400
Content-Disposition: inline
In-Reply-To: <1474300103-26659-2-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org

On Mon, Sep 19, 2016 at 11:48:22PM +0800, Randy Li wrote:
> The TOPEET itop is a samsung exnynos 4412 core board, which have
> two package versions. This patch add the support for SCP version.
> 
> Currently supported are USB3503A HSIC, USB OTG, eMMC, rtc and
> PMIC. The future features are in the based board. Also MFC and
> watchdog have been enabled.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 501 ++++++++++++++++++++++++
>  1 file changed, 501 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi

I wanted to apply it... but then I saw a bunch of checkpatch trivial issues.
Really, after v8? The code must compile (v6 did not compile...), there
should be no warnings from smatch, sparse and checkpatch (only the last
one is applicable for DTS). Unless of course checkpatch would be
wrong... but in this case it is correct. You did not follow coding
style:

WARNING: please, no spaces at the start of a line
#134: FILE: arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi:109:
+        devfreq = <&bus_leftbus>;$

ERROR: code indent should use tabs where possible
#135: FILE: arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi:110:
+        status = "okay";$


Best regards,
Krzysztof
