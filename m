From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC v4 2/7] Revert
 "extcon: usb-gpio: switch to use pm wakeirq apis"
Date: Thu, 09 Jun 2016 10:10:38 +0200
Message-ID: <5759247E.6060901@samsung.com>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
 <1465393686-16644-3-git-send-email-k.kozlowski@samsung.com>
 <57592220.9030201@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48817 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932091AbcFIIKn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 04:10:43 -0400
In-reply-to: <57592220.9030201@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Felipe Balbi <balbi@kernel.org>, kishon@ti.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 06/09/2016 10:00 AM, Roger Quadros wrote:
> -balbi@ti
> +balbi@kernel
> 
> Hi,
> 
> On 08/06/16 16:48, Krzysztof Kozlowski wrote:
>> This reverts commit 8106e404174253639731cc30a44f5b3ab764c5b7.
> 
> The above commit id is not present in v4.7-rc1 and this patch doesn't apply properly.
> Can you please rebase this series on v4.7-rc1?

The commit is present in extcon tree for v4.8. The extcon patches will
be applied (probably) to that tree so what is the point of rebasing on
v4.7-rc1?

Also the point of this particular patch is to show that previous change
should be just dropped. Don't replace things to complicated devm-like
functions just to simplify one path in the driver...

Best regards,
Krzysztof
