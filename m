From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add pmu sysreg node to Exynos3250
Date: Fri, 30 May 2014 20:55:41 +0900
Message-ID: <538871BD.2030002@samsung.com>
References: <1401085776-14212-1-git-send-email-cw00.choi@samsung.com>
 <538870F8.9090507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39182 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaE3Lzo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 07:55:44 -0400
In-reply-to: <538870F8.9090507@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, ben-linux@fluff.org, linux@arm.linux.org.uk, l.krishna@samsung.com, chanho61.park@samsung.com, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 05/30/2014 08:52 PM, Tomasz Figa wrote:
> On 26.05.2014 08:29, Chanwoo Choi wrote:
>> This patch add pmusysreg node for Exynos3250 to access PMU (Power Management Unit)
>> register in a centralized way using syscon driver.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
>>  arch/arm/boot/dts/exynos3250.dtsi                     | 5 +++++
>>  2 files changed, 6 insertions(+)
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 

Thanks for your review.

Best Regards,
Chanwoo Choi
