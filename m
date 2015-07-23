From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] PM / devfreq: event: Remove incorrect property in
 exynos-ppmu DT binding
Date: Thu, 23 Jul 2015 10:30:14 +0200
Message-ID: <55B0A616.2070608@osg.samsung.com>
References: <1436770732-9430-1-git-send-email-javier@osg.samsung.com>
 <55B0A376.2080906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53981 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752209AbbGWIaU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jul 2015 04:30:20 -0400
In-Reply-To: <55B0A376.2080906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>

Hello Chanwoo,

On 07/23/2015 10:19 AM, Chanwoo Choi wrote:
> Hi Javier,
> 
> On 07/13/2015 03:58 PM, Javier Martinez Canillas wrote:
>> The exynos-ppmu driver is only a clock consumer and not a clock
>> provider but its Device Tree binding listed #clock-cells as an
>> optional property.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> 
>> ---
>> 
>> Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt | 1
>> - 1 file changed, 1 deletion(-)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
>> b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt 
>> index b54bf3a2ff57..aed486692880 100644 ---
>> a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt 
>> +++
>> b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt 
>> @@ -17,7 +17,6 @@ Required properties: Optional properties: -
>> clock-names : the name of clock used by the PPMU, "ppmu" - clocks :
>> phandles for clock specified in "clock-names" property --
>> #clock-cells: should be 1.
>> 
>> Example1 : PPMU nodes in exynos3250.dtsi are listed below.
>> 
>> 
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> + Devfreq maintainer (Myungjoo Ham)

Thanks for the review and for cc'ing Myungjoo. The get_maintainer.pl script
didn't tell me that so I think Documentation/devicetree/bindings/devfreq/
sub-dir should be added to the DEVICE FREQUENCY (DEVFREQ) entry in the
MAINTAINERS file.

> I think that this patch will be more appropriate on devfreq git tree 
> than linux-samsung git tree.
>

Agreed.

> Thanks, Chanwoo Choi --

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
