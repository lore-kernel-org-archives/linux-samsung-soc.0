From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/3] ARM: S5P: Add System define for arch_reset()
Date: Thu, 24 Jun 2010 22:19:20 +0900
Message-ID: <AANLkTinpn_cNnIS5vZrY8DMe9t2bg2KMHS4CNThoIt0m@mail.gmail.com>
References: <1277332317-30192-1-git-send-email-kgene.kim@samsung.com>
	<1277332317-30192-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTim2s6syCjpl5v_qVloktrzz27JsSrR6kgWqNHUm@mail.gmail.com>
	<012e01cb139e$c9ac8bc0$5d05a340$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:36082 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736Ab0FXNTV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 09:19:21 -0400
Received: by vws9 with SMTP id 9so2462698vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jun 2010 06:19:20 -0700 (PDT)
In-Reply-To: <012e01cb139e$c9ac8bc0$5d05a340$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>

On Thu, Jun 24, 2010 at 10:11 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Kyungmin Park wrote:
>>
>> On Thu, Jun 24, 2010 at 7:31 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > From: Jongpill Lee <boyko.lee@samsung.com>
>> >
>> > This patch adds system define for arch_reset() using Watchdog reset.
>> > And adds IO mapping for using WDT.
>>
>> Are there any reason to use the WDT to system reset?
>
> Yeah, I already commented about that.
> Now Samsung SoC hardware engineer recommends to use the reset of watchdog
> instead of software reset by restriction of hardware environment.
>
>> As original purpose of WDT. doesn't it better to use system reset?
>
> Original purpose? I think, WDT can be used as software reset.
I agree with Kyungmin Park.
Ideally WDT shud be used as a way to detect deadlock/starvation. When
the bootloader realizes the reset was due to WDT, different course of action
should be taken than that for reset due to, say, reboot command.
