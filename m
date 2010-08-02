From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Please remind 'WARNING: about Samsung merge window over'
Date: Mon, 2 Aug 2010 08:31:38 +0100
Message-ID: <20100802073138.GB10608@n2100.arm.linux.org.uk>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com> <AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52199 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab0HBHcA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 03:32:00 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, nala.la@samsung.com, kimty@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Aug 02, 2010 at 03:24:13PM +0900, Kyungmin Park wrote:
> Absurd !!!
> 
> Did you mentioned that samsung merge window over before?
> why it's reminder mail? it's unilateral notification at this time.

It's standard Linux kernel development procedure.

The merge window is not for new code - the merge window is for code which
has already been merged by maintainers to submit it to Linus in an orderly
manner and fixup any conflicts which may occur.

New code which hasn't been reviewed by the beginning of the merge window
and which hasn't been in linux-next for a _reasonable_ amount of time
should wait until the following merge window unless there's a _very_ good
reason to make an exception.
