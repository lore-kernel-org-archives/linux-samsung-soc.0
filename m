From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks
 from device tree
Date: Fri, 23 Aug 2013 17:19:50 -0600
Message-ID: <5217EE16.6020702@wwwdotorg.org>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <1500724.07LRpFtgcx@flatron> <5217DE06.3070005@wwwdotorg.org> <2159266.zeHHUDxisq@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2159266.zeHHUDxisq@flatron>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-gpio@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/23/2013 05:04 PM, Tomasz Figa wrote:
> On Friday 23 of August 2013 16:11:18 Stephen Warren wrote:
>> On 08/22/2013 05:22 PM, Tomasz Figa wrote:
>>> This patch extends vic_of_init to parse valid interrupt sources
>>> and resume sources masks from device tree.
>>>
>>> If mask values are not specified in device tree, all sources
>>> are assumed to be valid, as before this patch.
>>
>> Can you explain further why the VIC needs this information up-front?
>> Presumably it can accumulate it as devices request interrupts.
> 
> It does not need this information just for operation, but this makes the 
> hardware description more detailed and allows better sanity checking of 
> interrupts being requested.

Ah, OK. It may be worth mentioning the intent of the properties. I
suppose this is purely a representation of HW then, so it's reasonable
to include it in the binding. I'm not sure /quite/ how useful it is;
after all the error-checking that it enables will never trigger assuming
the rest of the DT is written to "request" the correct interrupts.
However, I guess there is little harm in allowing these properties.

Bikeshedding a bit, but perhaps rename wakeup-mask to valid-wakeup-mask
(and perhaps valid-mask to valid-source-mask for consistency, although I
see you already renamed that to be consistent with other bindings...)?
To me, wakeup-mask sounds like a configuration of which sources should
be configured to wakeup the system; something to do with
configuration/policy rather than HW capabilities.

Either way, the binding,
Acked-by: Stephen Warren <swarren@nvidia.com>

(I assume those 2 new properties always have 1 cell since the controller
can only support up to 32 IRQ sources? If not, then perhaps add wording
to describe how long the properties should be).
