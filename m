From: kasim ling <kasimling@gmail.com>
Subject: Re: How to enable usb in exynos4412
Date: Mon, 2 Dec 2013 10:58:38 +0800
Message-ID: <CAHaF_khY8XQKqPmx=V1jdhKyvTdPXxFkAdYObJ1vZ+HSEgbhkQ@mail.gmail.com>
References: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl> <2200229.bjG2XWDipV@amdc1227>
 <BLU0-SMTP92C7727197877F7B4E95D9ADEE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:56386 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439Ab3LBC67 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 21:58:59 -0500
In-Reply-To: <BLU0-SMTP92C7727197877F7B4E95D9ADEE0@phx.gbl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: randy <lxr1234@hotmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, stern@rowland.harvard.edu, devicetree@vger.kernel.org, balbi@ti.com

(Resend in plain text mode)
Hi, Randy,
I'm also working with FriendlyARM Tiny4412 board and I've had a
working 3.13-rc2-based kernel tree with USB host function working. You
can refer to my commit at
https://github.com/kasimling/linux/commit/a452fb006c657de5c038f04d8f610567580ea99c.
You can also check out branch "tiny4412_3.13-dev" of repository
"https://github.com/kasimling/linux.git".


BR,
Alex
