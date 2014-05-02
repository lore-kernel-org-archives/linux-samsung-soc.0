From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: fixed gpio key node for exynos4412
Date: Fri, 02 May 2014 20:00:06 +0200
Message-ID: <5363DD26.1020704@gmail.com>
References: <53633D4B.9070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:50733 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901AbaEBSAI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 14:00:08 -0400
In-Reply-To: <53633D4B.9070500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

Hi Beomho,

On 02.05.2014 08:38, Beomho Seo wrote:
> This patch fixed gpio key device node.
> First, fix incorrect gpio property.
> And then, add ok-key node where locate bottom center.
> I have tested on exynos4412-trats2 board.

While at it, could you also remove interrupt-parent and interrupts 
properties from nodes of the keys? They have been added here by a 
mistake and they are not part of the gpio-keys device tree bindings.

Best regards,
Tomasz
