From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH RESEND v3] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Tue, 30 Nov 2010 17:01:02 +0200
Message-ID: <201011301701.03443.anarsoul@gmail.com>
References: <000201cb8fae$4d61fd20$e825f760$%kim@samsung.com> <201011301633.05545.anarsoul@gmail.com> <4CF50FD5.1090705@metafoo.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f66.google.com ([209.85.215.66]:56641 "EHLO
	mail-ew0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752837Ab0K3PBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Nov 2010 10:01:37 -0500
Received: by ewy24 with SMTP id 24so1369950ewy.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2010 07:01:36 -0800 (PST)
In-Reply-To: <4CF50FD5.1090705@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On Tuesday 30 November 2010 16:53:09 Lars-Peter Clausen wrote:

> Both the cpu init code and the machine init code are run at arch_initcall.

Yeah, you're right.
