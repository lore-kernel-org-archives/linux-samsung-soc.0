From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 2/2] ARM: dts: add TOPEET itop elite based board
Date: Tue, 18 Oct 2016 20:37:48 +0300
Message-ID: <20161018173748.GB30003@kozik-lap>
References: <devicetree@vger.kernel.org>
 <1476811129-4450-1-git-send-email-ayaka@soulik.info>
 <1476811129-4450-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33862 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752675AbcJRRhz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 13:37:55 -0400
Content-Disposition: inline
In-Reply-To: <1476811129-4450-3-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org

On Wed, Oct 19, 2016 at 01:18:49AM +0800, Randy Li wrote:
> The TOPEET itop exynos 4412 have three versions base board. The
> Elite version is the cheap one without too much peripheral devices
> on it.
> 
> Currently supported are serial console, wired networking(USB),
> USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
> PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
> enabled.
> 
> The FIMC is not used for camera currently, I enabled it just for a
> colorspace converter.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, applied, with missing Rob's ack, minor changes in commit msg and
fix in pin function (you used macro for pull up/down instead of
function).

Best regards,
Krzysztof
