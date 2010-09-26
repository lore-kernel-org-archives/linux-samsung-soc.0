From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2 4/5] h1940: Fix backlight and LCD power functions
Date: Mon, 27 Sep 2010 00:15:36 +0100
Message-ID: <4C9FD418.8030101@fluff.org>
References: <1283871605-32068-5-git-send-email-anarsoul@gmail.com> <1284241518-32587-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:58648 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758496Ab0IZXPo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Sep 2010 19:15:44 -0400
In-Reply-To: <1284241518-32587-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 11/09/10 22:45, Vasily Khoruzhick wrote:

Could I have a better explanation of what this part is doing
please.

for future reference, you don't need to put 'this patch' in
the description, that part is pretty clear.

> v2: init gpio mode/value right after gpio_request

It would be helpful to move the changes between submisisons
to under the --- lines to make them easier to remove when
applying to the tree.

> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2410/include/mach/h1940-latch.h |    2 +-
>  arch/arm/mach-s3c2410/mach-h1940.c               |   80 ++++++++++++++++++----
>  2 files changed, 66 insertions(+), 16 deletions(-)
