From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Move syscon reboot/poweroff to common dtsi for
 Exynos
Date: Tue, 16 Feb 2016 08:04:34 +0900
Message-ID: <56C25982.4020301@samsung.com>
References: <1455042606-10075-1-git-send-email-javier@osg.samsung.com>
 <56C02265.40103@samsung.com> <56C1D4D1.2050108@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46457 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753355AbcBOXEk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 18:04:40 -0500
In-reply-to: <56C1D4D1.2050108@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

On 15.02.2016 22:38, Javier Martinez Canillas wrote:
>>
>> In some of the DTSI this was under "soc" node, not at top-level.
>> Unfortunately we do not have consistency here - some DTSI have "soc",
> 
> Yes, I noticed this but as you said not all DTSI have a soc node
> and that's why I made it top level in the DTSI.
> 
>> some not. Anyway I think we should move to "soc" version.
>>
> 
> Not sure I'm following, did you mean to do it as a follow up or
> to add a soc node for the missing DTSI as a part of this series?

I meant to send a v2 with this under "soc" node even though on some DTS
we do not have the "soc". Optional follow up would be to make DTS
consistent and move nodes under "soc"... but that would be also a lot of
churn.

Best regards,
Krzysztof
