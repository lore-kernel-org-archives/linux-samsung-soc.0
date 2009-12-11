From: Barry Song <21cnbao@gmail.com>
Subject: 2.6.28 and newest linux kernel for samsung
Date: Fri, 11 Dec 2009 14:44:30 +0800
Message-ID: <3c17e3570912102244w21418964y8fb3f0e01ef0e39a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f212.google.com ([209.85.217.212]:35889 "EHLO
	mail-gx0-f212.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755461AbZLKGon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 01:44:43 -0500
Received: by gxk4 with SMTP id 4so789179gxk.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Dec 2009 22:44:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,
I found there are many drivers which have existed in samsung 2.6.28
tree. For example, s3c6410 jpeg/multi functions codecs/2D/3D, audio
board drivers, framebuffer and so on. But they are not in 2.6.31 or
newest tree.
Is there any plan about that? And is there any way to use those
drivers in new kernel since some are using old kernel or subsystem
API?
Thanks
Barry
