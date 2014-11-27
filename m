From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 11/19] clk: samsung: exynos5433: Add clocks for
 CMU_BUS{0|1|2} domains
Date: Thu, 27 Nov 2014 20:56:35 +0900
Message-ID: <54771173.6090408@samsung.com>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com>
 <1417073716-22997-12-git-send-email-cw00.choi@samsung.com>
 <6217579.xNXtO7YiDs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <6217579.xNXtO7YiDs@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, mark.rutland@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Dear Arnd,

On 11/27/2014 08:41 PM, Arnd Bergmann wrote:
> On Thursday 27 November 2014 16:35:08 Chanwoo Choi wrote:
>> +  - "samsung,exynos5433-cmu-bus0", "samsung,exynos5433-cmu-bus1"
>> +    and "samsung,exynos5433-cmu-bus2" - clock controller compatible for CMU_BUS
>> +    which generates global data buses clock and global peripheral buses clock.
>>  
>>  - reg: physical base address of the controller and length of memory mapped
>>    region.
>>
> 
> This looks like you are duplicating the bindings and the code, but
> it's really the same hardware multiple times with minor variations
> that you should be able to describe properly here. Why not make
> three nodes with the same compatible string and have them handled
> by the same code?

Each CMU_BUSx domain of Exynos5433 have different base address as following:
- CMU_BUS0's base address and range : 0x1360_0000 ~ 0x1360_0b04
- CMU_BUS1's base address and range : 0x1480_0000 ~ 0x1480_0b04
- CMU_BUS2's base address and range : 0x1340_0000 ~ 0x1340_0b04

So, I implement CMU_BUSx domain which has each compatible string.

Best Regards,
Chanwoo Choi
