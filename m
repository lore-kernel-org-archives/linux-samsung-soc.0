From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: AFTR does not work on arndale 5250
Date: Fri, 04 Apr 2014 15:06:31 +0200
Message-ID: <533EAE57.1080202@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:63436 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbaDDNGQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:06:16 -0400
Received: by mail-we0-f172.google.com with SMTP id t61so3431252wes.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:06:14 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


Hi,

I tried to make the idle AFTR state working on arndale 5250 but that=20
leads to a kernel reboot and crash.

How to reproduce ?

echo 0 > /sys/devices/system/cpu/cpu1/online

Reproductible on v3.14 and samsung/for-next

Any ideas ?

Thanks

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
