From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 1/3] Fix missing struct for s3c2410_dma_chan in	s3c2410_dma_suspend_chan
Date: Wed, 01 Jun 2011 20:01:34 +0400
Message-ID: <4DE6625E.2070907@ru.mvista.com>
References: <201106011348.47145.heiko@sntech.de> <201106011350.44375.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56070 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757841Ab1FAQDM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 12:03:12 -0400
Received: by wya21 with SMTP id 21so4212291wya.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jun 2011 09:03:11 -0700 (PDT)
In-Reply-To: <201106011350.44375.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, rjw@sisk.pl, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello.

Heiko St=FCbner wrote:

> s3c2410_dma_chan is not a type itself, so struct is required.

    Your signoffs are missing, so your patches can't be applied...

WBR, Sergei
