From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Thu, 9 Mar 2017 10:59:39 -0300
Message-ID: <804530d2-5ca2-4f15-4de0-006e27794865@osg.samsung.com>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
 <2fb11816-85e7-14f6-7b61-5d3eba6096aa@osg.samsung.com>
 <7f287a39-a8a4-1b9d-2d9a-36e849bd726b@samsung.com>
 <20935f7d-a41c-2987-daea-50e4c3aa4ab6@samsung.com>
 <1a9ff664-9321-70db-3a69-8adc0e04dca5@osg.samsung.com>
 <f772cc18-8115-17b4-fc2f-efe28e23db18@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <f772cc18-8115-17b4-fc2f-efe28e23db18@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andi Shyti <andi.shyti@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andrzej,

On 03/09/2017 10:49 AM, Andrzej Hajda wrote:
> On 09.03.2017 14:13, Javier Martinez Canillas wrote:
>> Hello Andrzej,
>>
>> On 03/09/2017 08:03 AM, Andrzej Hajda wrote:
>>> Hi again,
>>>
>>> On 09.03.2017 08:51, Andrzej Hajda wrote:
>>>> On 08.03.2017 21:05, Javier Martinez Canillas wrote:
>>>>> Hello Andrzej,
>>>>>
>>>>> On 02/22/2017 08:04 AM, Andrzej Hajda wrote:
>>>>>> In case of arbitration lost adequate interrupt sometimes is not signaled.
>>>>>> As a result transfer timeouts and is not retried, as it should. To avoid
>>>>>> such cases code is added to check transaction status in case of every
>>>>>> interrupt.
>>>>>>
>>>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>>> ---
>>>>> This patch causes regressions on Exynos5 boards (at least I noticed it in
>>>>> Exynos5800 Peach Pi board). I see transmission timeouts when accessing I2C
>>>>> device registers, i.e:
>>>>>
>>>>> $ cat /sys/class/rtc/rtc0/time
>>>>> [   25.924594] exynos5-hsi2c 12e10000.i2c: rx timeout
>>>>> [   65.028365] max77686-rtc max77802-rtc: Fail to read time reg(-22)
>>>>> cat: /sys/class/rtc/rtc0/time: Invalid argument
>>>> Hmm, at 12e10000 Exynos5 has hsi2c_9, and on this bus I have found only
>>>> infineon,slb9645tt TPM module. At least on mainline kernel.
>>>> What kernel do you use? Any additional changes to kernel?
>>>> Do you observe it on mainline kernel?
>>>>
>>>> Regarding the issue, how often it happens?
>>>> Please verify that this is not just coincidence.
>>>>
>>>>> Doing a partial revert of $SUBJECT (reading I2C_TRANS_STATUS register when
>>>>> it was before) "fixes" the problem [0].
>>>> That look crazy, the only difference for non-Exynos7 variant (which is
>>>> in Exynos5 boards) is that with your change HSI2C_TRANS_STATUS is read
>>>> only when HSI2C_INT_I2C happens, am I right?
>>>> Anyway I have realized that in case of Exynos5 the device HSI2C driver
>>>> works with is named "Universal Serial Interface" and has slightly
>>>> different set of registers than HSI2C device present in Exynos52[56]0,
>>>> but I do not know if it matters.
>>>>
>>>> If [0] really fixes the issue I think you can create real patch and send
>>>> for testing, but it looks very suspicious.
>>> Datasheet for Exynos5260 states clearly that TRANSFER_DONE_AUTO bit is
>>> cleared automatically after reading TRANS_STATUS register, so reading
>>> this register has side effect and in case of Exynos5 should be done only
>> Yes, I found that in the Exynos5422 SoC manual as well. But still it wasn't
>> clear to me since AFAICT the logic should be the same. In other words, this
>> is what should happen (added comments to make more clear):
>>
>> static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>> {
>> ...
>> 	int_status = readl(i2c->regs + HSI2C_INT_STATUS);
>> 	/* INT_I2C is set in int_status if interrupt occurred */
>> 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
>> 	trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
>> 	/*
>> 	 * TRANSFER_DONE_AUTO bit will be cleared when HSI2C_TRANS_STATUS
>> 	 * is read but is set in trans_status if transaction succeeded. 
>> 	 */
>>
>> 	/* handle interrupt related to the transfer status */
>> 	if (i2c->variant->hw == HSI2C_EXYNOS7) {
>> ...
>> 	} else if (int_status & HSI2C_INT_I2C) {
>> 	       /*
>> 	        * Both HSI2C_INT_I2C and HSI2C_TRANS_DONE should be set
>> 	        * but the latter isn't. trans_status & HSI2C_TRANS_DONE == 0.
>> 		*/
>> 		} else if (trans_status & HSI2C_TRANS_DONE) {
>> 			i2c->trans_done = 1;
>> 			i2c->state = 0;
>> 		}
>> 	}
>> ...
>>  stop:
>> 	/*
>> 	 * Since i2c->trans_done is 0, the msg_complete completion won't be
>> 	 * signaled and so the wait_for_completion_timeout() will timeout.
>> 	 */
>> 	if ((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
>> 	    (i2c->state < 0)) {
>> 		writel(0, i2c->regs + HSI2C_INT_ENABLE);
>> 		exynos5_i2c_clr_pend_irq(i2c);
>> 		complete(&i2c->msg_complete);
>> 	}
>>
>> 	spin_unlock(&i2c->lock);
>>
>> 	return IRQ_HANDLED;
>> }
>>
>> So I do understand that it has side effects but I don't see how this can
>> change the driver's logic since the state is already stored in variables.
>>
>> But probably I'm missing something obvious...
> 
> As this is rx timeout lets look at rx path only:
> When last byt arrives probably at least three things are performed:
> 1. HSI2C_INT_RX_ALMOSTFULL irq,
> 2. HSI2C_TRANS_DONE bit is set.
> 3. HSI2C_INT_I2C irq,
> 
> It is not clear in which order it is done, 1-2-3 is quite probable, and
> since our read of affected registers is not atomic from IP point of
> view, it is possible following sequence:
> a) ip signals HSI2C_INT_RX_ALMOSTFULL,
> b) irq handler is called for HSI2C_INT_RX_ALMOSTFULL,
> c) driver clears HSI2C_INT_STATUS,
> c) ip sets HSI2C_TRANS_DONE, signals HSI2C_INT_I2C,
> e) driver reads TRANS_STATUS, and resets HSI2C_TRANS_DONE
> f) irq handler is called for HSI2C_INT_I2C, but HSI2C_TRANS_DONE bit is
> already cleared.
> 

Right, this is a good explanation. Thanks a lot for taking the time to write it.

> If you like to experiment you can try to move reading TRANS_STATUS
> before reading INT_STATUS, and check if that changes anything, or event
> something more crazy:
>     trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
>     int_status = readl(i2c->regs + HSI2C_INT_STATUS);
>     writel(int_status, i2c->regs + HSI2C_INT_STATUS);
>     trans_status |= readl(i2c->regs + HSI2C_TRANS_STATUS);
> 
> but this is not material for patch :)
> 
> Your initial proposition [0] is the most suitable solution.
>

Great, I'll add the fixes and your reviewed-by tags and post it as a patch.

> Regards
> Andrzej
> 
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
