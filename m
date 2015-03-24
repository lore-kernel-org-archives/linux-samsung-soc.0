From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] Re: [PATCH v2 2/2] mfd: sec-core: Modify RTC
 compatible name of S2MPS13
Date: Tue, 24 Mar 2015 15:02:01 +0100
Message-ID: <CAJKOXPeh1McgSxJD23G=2QijRAQM2YGHbDFeGiA4bQQ-mRX-FA@mail.gmail.com>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
	<1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
	<20150323123458.GE24804@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150323123458.GE24804@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2015-03-23 13:34 GMT+01:00 Lee Jones <lee.jones@linaro.org>:
> On Tue, 17 Mar 2015, Krzysztof Kozlowski wrote:
>
>> From: Chanwoo Choi <cw00.choi@samsung.com>
>>
>> This patch modify the RTC compatible name of S2MPS13 because S2MPS13's RTC is
>> equal to S2MPS14's RTC.
>>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> ---
>>
>> Changes since v1:
>> 1. New patch.
>> ---
>>  drivers/mfd/sec-core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Applied, thanks.

Hi,

Sorry for the mess but we did this wrong.
The S2MPS13 RTC is slightly different than S2MPS14 and that difference
is important. It is embarrassing... but the difference was written
small-print as a note in datasheet. Really. I found it after carefully
comparing two PDFs. The impact of difference was not detected because
of error in DTS for Exynos5433-based board.

This patch should be dropped (or reverted) and "s2mps13-rtc" should be
used for S2MPS13 RTC mfd_cell. The RTC driver (rtc/rtxc-s5m) should
have its own support for RTC which I will add in separate patch.

Lee, once again sorry for the mess. How would you like to proceed? Can
you just drop this commit?

Best regards,
Krzysztof
