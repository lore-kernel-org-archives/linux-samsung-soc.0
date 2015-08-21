From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] rtc: s5m: fix to update ctrl register
Date: Fri, 21 Aug 2015 09:44:55 +0900
Message-ID: <55D67487.3040503@samsung.com>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
 <20150820231551.GE3769@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <20150820231551.GE3769@piout.net>
Sender: stable-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, sbkim73@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 21.08.2015 08:15, Alexandre Belloni wrote:
> Hi,
> 
> On 13/08/2015 at 17:49:24 +0900, Joonyoung Shim wrote :
>> According to datasheet, the S2MPS13X and S2MPS14X should update write
>> buffer via setting WUDR bit to high after ctrl register is updated.
>>
>> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
>> tools/testing/selftests/timers/rtctest.c test program and hour format is
>> used to 12 hour mode in Odroid-XU3 board.
>>
> 
>>From what I understood, I should expect a v2 of tihat patch also setting
> RUDR, is that right? OR would you prefer that I apply that one and then
> fix RUDR in a following patch?

Right, I would expect that as well... or a comment if this is not needed.

Best regards,
Krzysztof


> 
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Cc: <stable@vger.kernel.org>
> 
> can you update the stable tag with the kernel version introducing the
> issue?
> 
>> ---
>>  drivers/rtc/rtc-s5m.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
> 
>> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
>> index 8c70d78..03828bb 100644
>> --- a/drivers/rtc/rtc-s5m.c
>> +++ b/drivers/rtc/rtc-s5m.c
>> @@ -635,6 +635,18 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
>>  	case S2MPS13X:
>>  		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>>  		ret = regmap_write(info->regmap, info->regs->ctrl, data[0]);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		ret = regmap_update_bits(info->regmap,
>> +				info->regs->rtc_udr_update,
>> +				info->regs->rtc_udr_mask,
>> +				info->regs->rtc_udr_mask);
> 
> Very small indentation issue here, it should be aligned with the open
> parenthesis.
> 
> 
