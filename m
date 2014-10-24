From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/5] clk: samsung: exynos4415: Add clocks using common
 clock framework
Date: Fri, 24 Oct 2014 19:59:22 +0900
Message-ID: <544A310A.7090803@samsung.com>
References: <1413775749-17539-1-git-send-email-cw00.choi@samsung.com>
 <1413775935-17743-2-git-send-email-cw00.choi@samsung.com>
 <544A2FF2.1000105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <544A2FF2.1000105@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, mturquette@linaro.org, thomas.abraham@linaro.org, linus.walleij@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, jh80.chung@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com, yj44.cho@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 10/24/2014 07:54 PM, Sylwester Nawrocki wrote:
> On 20/10/14 05:32, Chanwoo Choi wrote:
>> This patch adds the new clock driver of Exynos4415 SoC based on Cortex-A9
>> using common clock framework. The CMU (Clock Management Unit) of Exynos4415
>> controls PLLs(Phase Locked Loops) and generates system clocks for CPU, buses
>> and function clocks for individual IPs.
>>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: Tomasz Figa <tomasz.figa@gmail.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> The patch looks good to me, I've applied it to my tree and will
> be sending in a pull request to Mike next week, if there is no
> objections.

Thanks,

I'll send new patchset(v2) for following Exynos4412 patches right now.

  clk: samsung: exynos4415: Add clocks using common clock framework
  clk: samsung: Document binding for Exynos4415 clock controller

Best Regards,
Chanwoo Choi
