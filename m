From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: Move syscon reboot/poweroff to common dtsi for
 Exynos
Date: Tue, 16 Feb 2016 10:58:20 -0300
Message-ID: <56C32AFC.6030905@osg.samsung.com>
References: <1455042606-10075-1-git-send-email-javier@osg.samsung.com>
 <56C02265.40103@samsung.com> <56C1D4D1.2050108@osg.samsung.com>
 <56C25982.4020301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48506 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932411AbcBPN6e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Feb 2016 08:58:34 -0500
In-Reply-To: <56C25982.4020301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

On 02/15/2016 08:04 PM, Krzysztof Kozlowski wrote:
> On 15.02.2016 22:38, Javier Martinez Canillas wrote:
>>>
>>> In some of the DTSI this was under "soc" node, not at top-level.
>>> Unfortunately we do not have consistency here - some DTSI have "soc",
>>
>> Yes, I noticed this but as you said not all DTSI have a soc node
>> and that's why I made it top level in the DTSI.
>>
>>> some not. Anyway I think we should move to "soc" version.
>>>
>>
>> Not sure I'm following, did you mean to do it as a follow up or
>> to add a soc node for the missing DTSI as a part of this series?
>
> I meant to send a v2 with this under "soc" node even though on some DTS
> we do not have the "soc". Optional follow up would be to make DTS
> consistent and move nodes under "soc"... but that would be also a lot of
> churn.
>

Thanks for the clarification. I'll post a v2 then moving under a soc node.
  
> Best regards,
> Krzysztof

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
