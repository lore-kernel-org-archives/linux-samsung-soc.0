From: Sriram V <vshrirama@gmail.com>
Subject: smp affinity
Date: Thu, 15 Sep 2016 19:08:46 +0530
Message-ID: <CAH9_wRMYbay+x6tXyTLFR55Gnh69vqCQ67MNGCZ3VGuxe9O6=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yb0-f177.google.com ([209.85.213.177]:35489 "EHLO
        mail-yb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753383AbcIONir (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 09:38:47 -0400
Received: by mail-yb0-f177.google.com with SMTP id d69so32982088ybf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Sep 2016 06:38:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I am unable to set irq affinity for any irq. It results in the following error

echo 4 > /proc/irq/535/smp_affinity
sh: write error: Input/output error

I tried other irq's as well. But the results are the same.


Any idea why can't i set irq affinity on exynos?


Thanks,
Sriram
