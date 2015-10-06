From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND] phy: exynos-usb2: add vbus regulator support
Date: Tue, 6 Oct 2015 19:59:22 +0530
Message-ID: <5613DAC2.7050508@ti.com>
References: <1444138860-23595-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPdZ+ed7UacrAChfMS+SfQxPZgvkshoJiSd0_yxRTSpTSA@mail.gmail.com>
 <5613D5FF.4040702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:48372 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752785AbbJFO32 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 10:29:28 -0400
In-Reply-To: <5613D5FF.4040702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi,

On Tuesday 06 October 2015 07:39 PM, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-10-06 15:47, Krzysztof Kozlowski wrote:
>> 2015-10-06 22:41 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>>> Exynos USB2 PHY has separate power supply, which is usually provided by
>>> VBUS regulator. This patch adds support for it. VBUS regulator is
>>> optional, to keep compatibility with boards, which have VBUS provided
>>> from some always-on power source.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>> This is just a resend of a patch posted in the following thread:
>>> https://lkml.org/lkml/2015/8/21/306
>>>
>>> I really hope that it will finally get merged to v4.4. For more
>>> information and background, please refer to the mentioned thread.
>>>
>>> Marek Szyprowski
>>> ---
>>>   .../devicetree/bindings/phy/samsung-phy.txt        |  3 +++
>>>   drivers/phy/phy-samsung-usb2.c                     | 25
>>> ++++++++++++++++++++--
>>>   drivers/phy/phy-samsung-usb2.h                     |  2 ++
>>>   3 files changed, 28 insertions(+), 2 deletions(-)
>> Any particular reason to dropping my tested-by? Do you changed here
>> anything?
> 
> Nope, I just forgot to add your "Tested-by: Krzysztof Kozlowski
> <k.kozlowski@samsung.com>".
> 
> This was a pure resend, no changes to the patch has been made. I just
> noticed
> that it is over 6 weeks since the initial submission and the patch is still
> not in linux-next...

It won't be in linux-next. I've just merged this patch to linux-phy
-next and will be sent during the next merge window. Only fixes will be
merged during the -rc releases.

Thanks
Kishon
