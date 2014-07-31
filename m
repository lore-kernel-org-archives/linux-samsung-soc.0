From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Role of PLL_ENABLE_BIT
Date: Thu, 31 Jul 2014 15:25:56 +0200
Message-ID: <53DA43E4.1000007@gmail.com>
References: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a> <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com> <53DA1576.6020504@suse.de> <CAEe5pB9QzqfNFGMSKNxc7ncGDp-sCUMdm7--uY6aT9YWjHZ5Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:65104 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaGaN0E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 09:26:04 -0400
Received: by mail-wg0-f49.google.com with SMTP id k14so2735482wgh.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 06:26:00 -0700 (PDT)
In-Reply-To: <CAEe5pB9QzqfNFGMSKNxc7ncGDp-sCUMdm7--uY6aT9YWjHZ5Aw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Humberto Naves <hsnaves@gmail.com>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh <yadi.brar@samsung.com>

On 31.07.2014 12:46, Humberto Naves wrote:
> Hi Andreas,
> 
> I guess the original message was not plain text, and majordomo refused
> to deliver it :-(
> The signedness is not an issue, if I just use what I sent in the
> patch, the set_rate function works like a charm. But otherwise, the
> whole system freezes and I have to reboot the machine.

It's possible that the bootloader simply doesn't enable the PLL. I had a
patch somewhere which added enable/disable control for the PLL, which
required a bit more work. It might be a good idea to revisit it then.

Best regards,
Tomasz
