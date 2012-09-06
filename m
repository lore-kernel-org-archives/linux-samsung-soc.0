From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos4: allow i2c0 bus to be configured
 using pinctrl interface
Date: Thu, 06 Sep 2012 12:13:11 +0200
Message-ID: <5320531.svfjn4BD9X@amdc1227>
References: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org>
 <1346923381-14144-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14159 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752855Ab2IFKNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 06:13:16 -0400
In-reply-to: <1346923381-14144-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-i2c@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, w.sang@pengutronix.de, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, dong.aisheng@linaro.org

Hi Thomas,

On Thursday 06 of September 2012 14:53:01 Thomas Abraham wrote:
>  		compatible = "samsung,s3c2440-i2c";
>  		reg = <0x13860000 0x100>;
>  		interrupts = <0 58 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2c0_bus>;

If pinctrl-names property is omitted then the state index is used as a name 
(e.g. pinctrl-0 would be named "0"). Maybe it would be better to use this 
approach (with respective adjustment in first patch)? What do you think?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
