From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 10:54:10 +0900
Message-ID: <AANLkTinYHSUP5AspWbzD8hfKJtEaFAfcUYC0sOPy+WKX@mail.gmail.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
	<1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
	<AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
	<AANLkTimbHbO77POKuu=3XAO6Cq7UaAjJ291hwQqKTcNW@mail.gmail.com>
	<AANLkTinaDckVpJhadBcnhccdougyCG-FbXe23dh=_ep8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64058 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756815Ab0JUByL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 21:54:11 -0400
Received: by bwz18 with SMTP id 18so30156bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2010 18:54:10 -0700 (PDT)
In-Reply-To: <AANLkTinaDckVpJhadBcnhccdougyCG-FbXe23dh=_ep8@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>

On Thu, Oct 21, 2010 at 10:49 AM, Kyungmin Park <kmpark@infradead.org> wrote:
>>> Can you make it REAL clock gating, enable clock only when using?
>>
>> Of course we can. But that will need some intrusive changes.
>> Later, we'll implement that desirable feature.
>> For now, many SoCs don't detect PL330 since the clocks are gated
>> by default and we don't enable them in driver. So, this is just to get
>> latest SoCs' PL330 working.
>
> I see even though I don't know "later" is how much

We (apparently) don't have fixed policy about which devices have their clocks
enabled by default and which don't.
So, by default PL330 clock is enabled on some platforms and not on others.
This patch only makes sure the PL330 works on all platforms at boot-time.


> and include the s5pc210 code also at this patchset.
Yes, all platforms should be enabled for PL330 driver.
