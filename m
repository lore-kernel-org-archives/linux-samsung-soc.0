From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
Subject: Re: [PATCH] Add poll_get_char & poll_put_char to uart_ops for the samsung UARTS.
Date: Sun, 26 Feb 2012 19:34:43 +0100
Message-ID: <201202261934.44079.GNUtoo@no-log.org>
References: <20120212182201.GA17975@debian> <CAHQa92Vjwh3gtME2u19EZz57My3H7R=fQK4CoJR9s_ktpsy_Ww@mail.gmail.com> <201202251227.42284.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp203.alice.it ([82.57.200.99]:54931 "EHLO smtp203.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752368Ab2BZSe4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Feb 2012 13:34:56 -0500
In-Reply-To: <201202251227.42284.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Pichon Julien <pichon.jln@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

>It might be goot to included the linux-arm-kernel list to get a wider 
>audience. I always felt, that the samsung ml isn't read by many.
Why not the linux-serial mailing list?
I sent a patch there and it was accepted in Greg Kroah-Hartman's tree really 
fast(it didn't hit linux-next yet tough).

Denis.
