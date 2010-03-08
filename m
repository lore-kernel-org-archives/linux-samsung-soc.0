From: christian pellegrin <chripell@fsfe.org>
Subject: Re: [PATCH v2] Fix GPIOs bank H and J not being preserved during
	suspend
Date: Mon, 8 Mar 2010 17:14:05 +0100
Message-ID: <cabda6421003080814j2e17b664x1806a418928e09d4@mail.gmail.com>
References: <cabda6421003080317t37124990v72ac56906719c091@mail.gmail.com>
	 <1268047288-11166-1-git-send-email-chripell@fsfe.org>
	 <20100308155522.GE24864@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:59551 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755360Ab0CHQOH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 11:14:07 -0500
Received: by fxm19 with SMTP id 19so6487128fxm.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Mar 2010 08:14:06 -0800 (PST)
In-Reply-To: <20100308155522.GE24864@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Mar 8, 2010 at 4:55 PM, Ben Dooks <ben-linux@fluff.org> wrote:
>
> Still not getting why you're changing this from x, to x - 1.
>

ok: the reason is that gpio_nr is already incremented by one in the
for instruction. So gpio_nr is not pointing to the first pin of a bank
after the first iteration. Of course this doesn't matter because we
don't have 32 banks of gpio pins and s3c_gpiolib_getchip works even if
we point to a pin in the middle of a bank. But if we get a s3c device
with more than 32 banks the 33rd will be skipped. Or at least this is
the reason why I did this, maybe I'm mistaken.

Anyway this is a minor point, I fixed it when catching why bank H was
not preserved (and so my serial console ttyS1 was dead).

-- 
Christian Pellegrin, see http://www.evolware.org/chri/
"Real Programmers don't play tennis, or any other sport which requires
you to change clothes. Mountain climbing is OK, and Real Programmers
wear their climbing boots to work in case a mountain should suddenly
spring up in the middle of the computer room."
