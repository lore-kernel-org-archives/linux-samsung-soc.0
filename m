From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 05/15] ARM: S5P6442: Change to using s3c_gpio_cfgpin_range()
Date: Mon, 31 May 2010 10:18:03 +0900
Message-ID: <AANLkTikp-Zaj1LsBlLK1BhvhxfCXbtMyB5KxsUd-I8HN@mail.gmail.com>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
	<1275026212-27510-6-git-send-email-ben-linux@fluff.org>
	<AANLkTilPCk0NqJ7od6ZBorqPrlG0xCjdPaim1Q3WwZMH@mail.gmail.com>
	<20100531010907.GO7248@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:56995 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754318Ab0EaBSI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 May 2010 21:18:08 -0400
Received: by vws11 with SMTP id 11so1571509vws.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 May 2010 18:18:04 -0700 (PDT)
In-Reply-To: <20100531010907.GO7248@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, May 31, 2010 at 10:09 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Fri, May 28, 2010 at 03:24:02PM +0900, Kyungmin Park wrote:
>> Hi,
>>
>> Looks good but I'm afraid it's more difficult to find pin
>> configuration from typo.
>
> Do you meant that there's now no explicit mention of all pins invovled?

When develop new device drivers, developers can be give wrong pin
number easily so can't find a what's the problem.

So how about to add sysfs which pins have function number to check it easily?

>
> Note, may decided to drop or re-do this series.

I vote for working continuously .

Thank you,
Kyungmin Park
