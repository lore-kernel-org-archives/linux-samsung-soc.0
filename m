From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 5/5] ARM: dts: exynos4412: Rename OPP nodes as
 opp@<opp-hz>
Date: Thu, 5 Nov 2015 07:27:01 +0530
Message-ID: <20151105015701.GD2116@ubuntu>
References: <cover.1446687367.git.viresh.kumar@linaro.org>
 <a911512c457ac95b6d8cb46eb631786cb4b64da9.1446687367.git.viresh.kumar@linaro.org>
 <563AB620.5090904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:36201 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756427AbbKEB5G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2015 20:57:06 -0500
Received: by pacdm15 with SMTP id dm15so46215262pac.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2015 17:57:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <563AB620.5090904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, robh+dt@kernel.org, sboyd@codeaurora.org, lee.jones@linaro.org, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, nm@ti.com, devicetree@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Kukjin Kim <kgene@kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>

On 05-11-15, 10:51, Krzysztof Kozlowski wrote:
> I see this patch does not depend on the rest of patchset so I presume
> this can co through samsung-soc?

Yeah, I wouldn't mind that. But I would wait for a confirmation from
Rafael for the bindings first, for an unlikely case where he doesn't
like the fourth patch ;)

-- 
viresh
