From: christian pellegrin <chripell@fsfe.org>
Subject: Re: [PATCH v2.6.34-rc2] s3c: Fix CONFIG_MTD_NAND_S3C2410_CLKSTOP
Date: Tue, 4 May 2010 09:13:41 +0200
Message-ID: <o2wcabda6421005040013rc335f723qc0f2f6018f0ba578@mail.gmail.com>
References: <1269937323-7541-1-git-send-email-chripell@fsfe.org>
	 <20100504065701.GB26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f217.google.com ([209.85.218.217]:42313 "EHLO
	mail-bw0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756381Ab0EDHNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 03:13:44 -0400
Received: by bwz9 with SMTP id 9so1907779bwz.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 May 2010 00:13:42 -0700 (PDT)
In-Reply-To: <20100504065701.GB26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, May 4, 2010 at 8:57 AM, Ben Dooks <ben-linux@fluff.org> wrote:
>
> please let me know why you feel the need to use test_and_set_bit on
> a variable that is single use.
>

As I mentioned in the description the select function is not called in
a balanced way by upper layers, so there is a need to count it in the
driver (otherwise you end by calling clk_disable too many times if I
remember well). Perhaps the atomic operations are not needed but I'm
not sure about this so I preferred to take the cautionary approach (I
haven't studied if calls to select are serialized in the upper MTD
layer or even the block layer). Feel free to use a simple integer, but
I confirm that something like this patch is needed in 2.6.33 and
2.6.34 if you want clock stopping enabled.

Thanks,

-- 
Christian Pellegrin, see http://www.evolware.org/chri/
"Real Programmers don't play tennis, or any other sport which requires
you to change clothes. Mountain climbing is OK, and Real Programmers
wear their climbing boots to work in case a mountain should suddenly
spring up in the middle of the computer room."
