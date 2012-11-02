From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore
Date: Fri, 02 Nov 2012 16:15:30 +0400
Message-ID: <5093B962.1060903@mvista.com>
References: <1351852733-3346-1-git-send-email-dp@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:50353 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab2KBMQo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Nov 2012 08:16:44 -0400
Received: by mail-lb0-f174.google.com with SMTP id n3so2576648lbo.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Nov 2012 05:16:42 -0700 (PDT)
In-Reply-To: <1351852733-3346-1-git-send-email-dp@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

Hello.

On 02-11-2012 14:38, Dimitris Papastamos wrote:

> We are using S3C_EINT(4) instead of S3C_EINT(5).

> Change-Id: Ia197069ddc736813f2711c763469eaf655ea58ac

    Remove this line please -- it has no place in the upstream patch.

> Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>

WBR, Sergei
