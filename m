From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/5] rtc: rtc-s3c: Fix access unit from byte to word on
 RTCCON
Date: Wed, 08 Sep 2010 00:17:53 +0100
Message-ID: <4C86C821.9080505@fluff.org>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com> <1283837381-9575-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:38921 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750871Ab0IGXSH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:18:07 -0400
In-Reply-To: <1283837381-9575-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it

On 07/09/10 06:29, Kukjin Kim wrote:
> From: Changhwan Youn <chaos.youn@samsung.com>
> 
> S3C2410_RTCCON of TYPE_S3C64XX RTC should be read/written by readw and writew,
> because TYPE_S3C64XX RTC uses bit8 and bit9.
> 
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>

Anyone else tried this on s3c24xx?
