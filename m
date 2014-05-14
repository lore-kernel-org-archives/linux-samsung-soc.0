From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v4 8/8] cpufreq: exynos: remove all exynos specific cpufreq
 driver support
Date: Wed, 14 May 2014 09:20:10 +0200
Message-ID: <20140514092010.02e16520@amdc2363>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
 <1400029876-5830-9-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63325 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357AbaENHUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 03:20:21 -0400
In-reply-to: <1400029876-5830-9-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, heiko@sntech.de, viresh.kumar@linaro.org, t.figa@samsung.com, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, shawn.guo@linaro.org

Hi Thomas,

> -config ARM_EXYNOS_CPU_FREQ_BOOST_SW
> -	bool "EXYNOS Frequency Overclocking - Software"
> -	depends on ARM_EXYNOS_CPUFREQ
> -	select CPU_FREQ_BOOST_SW
> -	select EXYNOS_THERMAL
> -	help
> -	  This driver supports software managed overclocking (BOOST).
> -	  It allows usage of special frequencies for Samsung Exynos
> -	  processors if thermal conditions are appropriate.
> -
> -	  It reguires, for safe operation, thermal framework with
> properly
> -	  defined trip points.
> -
> -	  If in doubt, say N.
> -

If I might ask, where this switch,to enable BOOST, will be moved? All
in all, I would like to be able to enable boost :-).

In my opinion we should have the Kconfig option to enable/disable the
CPU_FREQ_BOOST_SW and this may be used with cpufreq-cpu0 driver as I've
pointed out in the other patch.

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
