From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 1/4] mfd: max77686: Don't suggest in binding to use a
 deprecated property
Date: Mon, 27 Jul 2015 12:40:56 +0200
Message-ID: <55B60AB8.9080306@osg.samsung.com>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-2-git-send-email-javier@osg.samsung.com>
 <20150720081020.GD3061@x1> <55ACC986.5040408@osg.samsung.com>
 <55B607B7.6050803@osg.samsung.com> <20150727103316.GV11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54504 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752311AbbG0KlB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 06:41:01 -0400
In-Reply-To: <20150727103316.GV11162@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Mark,

On 07/27/2015 12:33 PM, Mark Brown wrote:
> On Mon, Jul 27, 2015 at 12:28:07PM +0200, Javier Martinez Canillas wrote:
>> On 07/20/2015 12:12 PM, Javier Martinez Canillas wrote:
> 
>>> This PMIC uses a single I2C address for all the regulators and these are
>>> controlled by writing to different I2C register addresses. So the regulator
>>> nodes don't have a reg property in this case.
> 
>>> By looking at other regulators bindings, besides the generic regulator.txt
>>> and fixed-regulator.txt DT bindings, there are only 5 (out of 40) that use
>>> the node-name@unit-address convention mentioned in the ePAPR document.
> 
>>> AFAICT all these are for regulators that are actually in different addresses
>>> but I could be wrong so let's see what Mark says.
> 
>> Any opinions on this?
> 
> I just don't care, this is just syntactic noise which has no practical
> meaning as far as I can tell.
>

thanks, I'll then leave the regulator's node name as is in the patch
since that is consistent with the rest of the regulator DT bindings.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
