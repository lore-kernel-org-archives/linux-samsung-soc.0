From: Thomas Pietrowski <thopiekar@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Wed, 5 Aug 2015 15:07:53 +0200
Message-ID: <CAE-5t2sRjsD=NFdfOdtu6t1o=tb4TGKnhxPa5+rEXaWXm3P6nw@mail.gmail.com>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com>
	<557BC91C.10007@gmail.com>
	<16487700.5L20qaootX@home>
	<557BFEAA.1090802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:34643 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390AbbHENHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 09:07:53 -0400
Received: by ykax123 with SMTP id x123so34608753yka.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2015 06:07:53 -0700 (PDT)
In-Reply-To: <557BFEAA.1090802@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Sorry for the long delay. Got now linux-stable 4.2.0-rc5 running here,
but I still miss the fan support.
Searched the web again for the patch and found this on LKML:
https://lkml.org/lkml/2014/12/18/138

Then looked at the "arm-soc" repository but found this patch nowhere.
Are you planing to add this in future releases?
