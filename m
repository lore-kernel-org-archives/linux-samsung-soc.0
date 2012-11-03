From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore
Date: Sun, 04 Nov 2012 02:08:08 +0400
Message-ID: <509595C8.6090605@mvista.com>
References: <1351861289-19691-1-git-send-email-dp@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:60794 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567Ab2KCWJW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 18:09:22 -0400
Received: by mail-la0-f46.google.com with SMTP id h6so3342589lag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Nov 2012 15:09:21 -0700 (PDT)
In-Reply-To: <1351861289-19691-1-git-send-email-dp@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

Hello.

On 02-11-2012 17:01, Dimitris Papastamos wrote:

> We are using S3C_EINT(4) instead of S3C_EINT(5).

> Change-Id: I84e77fd75d59c6b8fecbcb11e81dc78dbf07f156

    You still hasven't removed this line. :-)

> Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>

WBR, Sergei
