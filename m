From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Enabling 8 cores on 5420
Date: Fri, 30 May 2014 11:25:28 +0200
Message-ID: <53884E88.2090408@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:40048 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755029AbaE3JZO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 05:25:14 -0400
Received: by mail-we0-f181.google.com with SMTP id w61so1679217wes.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 02:25:12 -0700 (PDT)
Received: from [192.168.1.150] (AToulouse-654-1-345-44.w90-55.abo.wanadoo.fr. [90.55.184.44])
        by mx.google.com with ESMTPSA id en6sm4390463wib.11.2014.05.30.02.25.10
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Fri, 30 May 2014 02:25:11 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


Hi all,

I am trying an upstream kernel + some patches to enable ethernet on=20
arndale octa.

Unfortunately, only 4 cores boot up. The other ones fail to boot.

[12.179453] CPU6: failed to come online
[13.189479] CPU7: failed to come online
[14.199479] CPU4: failed to come online
[15.209743] CPU5: failed to come online

What should I do to enable those 8 cores ? Is there a patchset somewher=
e=20
to do so ?

Thanks

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
