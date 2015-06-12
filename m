From: Thomas Pietrowski <thopiekar@gmail.com>
Subject: Feedback on hardware support for Odroid U3
Date: Fri, 12 Jun 2015 15:53:11 +0200
Message-ID: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36415 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752847AbbFLNxL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 09:53:11 -0400
Received: by ykaz81 with SMTP id z81so17891432yka.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 06:53:11 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello again,

first after fixing my booting problems I now get different warnings aft=
er boot.
- config: http://pastebin.com/MHUu51pF
- log: http://pastebin.com/9YMgMmFL
- repo: arm-soc
I read the last days that you are still working on the clk drivers, so
as these warnings appear to be related to that you might be interested
on them.

Additionally my CPU fan it running at full RPM all the time. I checked
the temperature just to be sure and it says it's 20=C2=B0C. Is this pro=
blem
known or can I help debugging it?
