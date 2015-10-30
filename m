From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Fri, 30 Oct 2015 17:38:01 +0900
Message-ID: <56332C69.1050608@samsung.com>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 30.10.2015 15:25, Alim Akhtar wrote:
> RTC found in s2mps15 is almost same as one found on s2mps13
> with few differences in RTC_UPDATE register fields, like:
> 1> Bit[4] and Bit[1] are reversed
>    - On s2mps13
>           WUDR -> bit[4], AUDR -> bit[1]
>    - On s2mps15
> 	  WUDR -> bit[1], AUDR -> bit[4]
> 2> In case of s2mps13, for alarm register, need to set both
>    WDUR and ADUR high, whereas for s2mps15 only set AUDR to high.
> 3> On s2mps15, WUDR, RUDR and AUDR functions should never be used
>    at the same time.
> 
> This patch add required changes to enable s2mps15 rtc timer.
> 
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/rtc/rtc-s5m.c           |   37 +++++++++++++++++++++++++++++++++----
>  include/linux/mfd/samsung/rtc.h |    2 ++
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 

The usage of rtc_udr_mask is now a little bit messy and not-consistent
but this can be fixed in separate patch.

Current approach is the simplest way to add S2MPS15 and looks correct:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
