From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 10:45:42 +0900
Message-ID: <AANLkTimbHbO77POKuu=3XAO6Cq7UaAjJ291hwQqKTcNW@mail.gmail.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
	<1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
	<AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:60640 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063Ab0JUBpn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 21:45:43 -0400
Received: by bwz18 with SMTP id 18so25827bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2010 18:45:42 -0700 (PDT)
In-Reply-To: <AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>

On Thu, Oct 21, 2010 at 10:32 AM, Kyungmin Park <kmpark@infradead.org> wrote:
> On Thu, Oct 21, 2010 at 9:58 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> From: Seungwhan Youn <sw.youn@samsung.com>
>>
>> This patch adds to enable/disable DMA operation clock on S3C-PL330
>> DMA controller driver.
>
> The title and description seems to clock gating but actual code is
> just enable at probe and disable at remove.
>
> Can you make it REAL clock gating, enable clock only when using?

Of course we can. But that will need some intrusive changes.
Later, we'll implement that desirable feature.
For now, many SoCs don't detect PL330 since the clocks are gated
by default and we don't enable them in driver. So, this is just to get
latest SoCs' PL330 working.
