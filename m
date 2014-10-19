From: Suriyan Ramasami <suriyan.r@gmail.com>
Subject: Help: Exynos5410/Exynos5422 - NIDEN/DBGEN bits for Perf monitor
Date: Sun, 19 Oct 2014 12:10:21 -0700
Message-ID: <CANoR_OD8O-ee_VtDGe6hPytpLr99ZTa0wZweVnjVWY4UgaObDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:53231 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495AbaJSTKX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 Oct 2014 15:10:23 -0400
Received: by mail-wi0-f170.google.com with SMTP id hi2so6924269wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2014 12:10:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello All and greetings!

   I am trying to enable the perf counters (other than the cycle
counters) on the Exynos5410/5422 SOCs. I have read thru ARM
documentation and have hit a stage where looks like there are bits
which need to be modified for enabling them and these are very SOC
specific.

I am especially interested in knowing how to enable the
NIDEN/DBGEN/SPIDEN/SPNIDEN lines to enable some sort of non intrusive
debug, which is then used by the linux kernel.

Any help or pointers in this area are much appreciated. Also, if you
can point me to someone else who could help, that would be great too.

Thanks a lot!
- Suriyan
