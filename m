From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add missing clock/pin-control entries for I2S0
 on Exynos4
Date: Mon, 09 Jun 2014 13:06:50 +0200
Message-ID: <5395954A.5070203@samsung.com>
References: <1402133454-28445-1-git-send-email-tushar.b@samsung.com>
 <5395841B.8000702@samsung.com> <53958FF0.40101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51441 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932194AbaFILHB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 07:07:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6W00J43EVJQTA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Jun 2014 12:06:55 +0100 (BST)
In-reply-to: <53958FF0.40101@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>, Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 09/06/14 12:44, Tushar Behera wrote:
> IMHO, the clock entries belong here as the audss clock provider
> essentially remains same for all Exynos4 based systems.
> 
> As for pin-control entry, I believe we can move them to respective SoC
> dtsi files.
> 
> Does that sound okay to you?

I guess that's fine, I tend to agree with you about the clocks.

--
Thanks,
Sylwester
