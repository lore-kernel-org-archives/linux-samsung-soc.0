From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re:
Date: Thu, 21 Jul 2011 11:54:46 +0530
Message-ID: <4E27C62E.8010005@linaro.org>
References: <1311246765-4161-1-git-send-email-padma.v@samsung.com>	<4E27B914.3050809@linaro.org>
	<CAAgF-BcTUTN5B59NO+yo7o=r=AtzvEHHOPwLBUgL15ifyYfFWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAAgF-BcTUTN5B59NO+yo7o=r=AtzvEHHOPwLBUgL15ifyYfFWA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: padma venkat <padma.kvr@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, Padmavathi Venna <padma.v@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 21 July 2011 11:13 AM, padma venkat wrote:
> Hi Tushar,
>
> On Thu, Jul 21, 2011 at 10:58 AM, Tushar Behera
> <tushar.behera@linaro.org>  wrote:
>> On Thursday 21 July 2011 04:42 PM, Padmavathi Venna wrote:
>>>

[snip]

>>> +       gc = irq_alloc_generic_chip("s5p64x0-eint", 1, S5P_IRQ_EINT_BASE,
>>> +                                   S5P_VA_GPIO, handle_level_irq);
>>
>>                                ^^^^
> Added spaces purposefully to make the parameters aligned properly in
> the next line

But spaces should never be used for indentation.

Quoting from http://www.kernel.org/doc/Documentation/CodingStyle

"Outside of comments, documentation and except in Kconfig, spaces are 
never used for indentation"

>> nitpick: Should be TABS
>
> Thanks&Regards
> Padma

[snip]

-- 
Tushar Behera
