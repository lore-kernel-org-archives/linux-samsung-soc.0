From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: ARM: SAMSUNG: Improve a size determination in 13 functions
Date: Tue, 10 Oct 2017 11:28:08 +0200
Message-ID: <6d573f66-8735-f745-e0bd-27cc29880eb0@users.sourceforge.net>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
 <7f196313-ad49-2cd8-e45f-be487e089547@users.sourceforge.net>
 <20171004191102.mnswu25bjxynuh4o@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:57090 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755662AbdJJJ2n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 05:28:43 -0400
In-Reply-To: <20171004191102.mnswu25bjxynuh4o@kozik-lap>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Thanks, applied.

Is the chosen commit description “Simplify the size argument of kzalloc() memory allocation
by using …” really appropriate when calls were adjusted for further two function names
by this update suggestion?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=09e1cf829c45a2f030c7fd49533a86b0935d068a

Regards,
Markus
