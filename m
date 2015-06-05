From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: max77843: Clear IRQ bits state before request IRQ
Date: Fri, 05 Jun 2015 14:13:13 +0900
Message-ID: <55712FE9.1070006@samsung.com>
References: <1462057843.591181433480053438.JavaMail.weblogic@epmlwas08a>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1462057843.591181433480053438.JavaMail.weblogic@epmlwas08a>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: =?UTF-8?B?6rmA7J6s7JuQ?= <jaewon02.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/05/2015 01:54 PM, MyungJoo Ham wrote:
>>   
>>  IRQ signal before driver probe is needless because driver sends
>> current state after platform booting done.
>> So, this patch clears MUIC IRQ bits before request IRQ.
>>
>> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
>> ---
>>  drivers/extcon/extcon-max77843.c |    9 +++++++++
>>  1 file changed, 9 insertions(+)
> 
> Q1. Is this because the pending bits are USELESS?
> or because the pendeing bits incurs INCORRECT behaviors?

The max77843 datasheet includes following sentence:
- "All bits are cleared after a read" about INT1/INT2/INT3 register.
There are no problem about interrupt handling.

> 
> Q2. Does clearing (by reading) INT1 do everything you need?
> What about INT2 and INT3?

The MAXIM MAX77843 MUIC support the one more interrupts (e.g., ADC1K, VBVolt, ChgTyp ...).
The each interrupt is included in the one register among INT1/2/3.

This patch clear the all interrupts of MAX77843 before requesting the interrupts.

> 
> Q3. I presume that "driver sends current state after..." is
> coming from the invokation of "queue_delayed_work()" at the end 
> of the probe function. It appears that you are only serving
> the pending status of "cable detection" with it while INT1
> seems to have more functionalities. Does that delayed work
> do everything that are pending, really?

When completed kernel booting, the delayed work of extcon-max77843.c driver
use the MAX77843_MUIC_STATUSx register to detect the type of connected
external connectors. So, there are no problme about clearing all bits of INT1/2/3 interrupt register.

If user-space platform don't finish the initialization of all user-process daemons
and extcon driver send the uevent during only kernel booting, the uevent is not handled
on user-space daemons.

Thanks,
Chanwoo Choi
