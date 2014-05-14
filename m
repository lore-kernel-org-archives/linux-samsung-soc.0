From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/8] cpufreq: use cpufreq-cpu0 driver for exynos based platforms
Date: Wed, 14 May 2014 14:51:22 +0200
Message-ID: <7170433.Ah6fefFrHR@wuerfel>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, devicetree@vger.kernel.org, l.majewski@samsung.com, kgene.kim@samsung.com, mturquette@linaro.org, heiko@sntech.de, viresh.kumar@linaro.org, t.figa@samsung.com, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, shawn.guo@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 14 May 2014 06:41:08 Thomas Abraham wrote:
> 
> The patch series removes the use of Exynos specific cpufreq driver and enables
> the use of cpufreq-cpu0 driver for Exynos4210, Exynos4x12 and Exynos5250 based
> platforms. This is being done for few reasons.
> 
> (a) The Exynos cpufreq driver reads/writes clock controller registers
>     bypassing the Exynos CCF driver which is sort of problematic.
> (b) Removes the need for having clock controller register definitions
>     in the cpufreq driver and also removes the need for statically
>     io-remapping clock controller address space (helps in moving towards
>     multiplatform kernel).
> 

Thanks a lot for your continued effort. Looks great overall, but I have one
comment about the general way the cpu0 cpufreq driver works, not specific
to the exynos implementation. See my reply to patch 4.

	Arnd
