From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] This patch adds support HR-Timer(High Resolution
	Timer) and dynamic tick system for S5P SoCs. There are many clock
	sources for HR-Timer on S5P SoCs. The PWM timer, RTC, System Timer,
	and MCT can be used for clock source. This patch can only support
	PWM timer for clocksource of S5P64x0 and S5PV210.
Date: Tue, 8 Mar 2011 09:49:55 +0000
Message-ID: <20110308094955.GB25874@n2100.arm.linux.org.uk>
References: <1299456554-15280-1-git-send-email-sbkim73@samsung.com> <1299456554-15280-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58510 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513Ab1CHJuL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 04:50:11 -0500
Content-Disposition: inline
In-Reply-To: <1299456554-15280-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

> Subject: [PATCH 1/3] This patch adds support HR-Timer(High Resolution=
 Timer)
        and dynamic tick system for S5P SoCs. There are many clock
        sources for HR-Timer on S5P SoCs. The PWM timer, RTC, System Ti=
mer,
        and MCT can be used for clock source. This patch can only suppo=
rt PWM
        timer for clocksource of S5P64x0 and S5PV210.

Please don't fill the subject line with the entire patch description.
Subject lines are always supposed to be a brief summary of the message
being sent, or with patches a brief summary of what the patch is about.

Put the rest of the patch description in the body of the message.

Don't say things like "This patch adds", "Adding support for", etc.  Wh=
en
the patch has been merged, years later it doesn't make sense to read su=
ch
patch descriptions.

"S5P: Common HRT and NO_HZ support" is sufficient to summarise the patc=
h.

Note that some mail clients only show you the first 40 or so characters=
 of
the subject line in their message index.  To illustrate:

6472 N   Mar 07 Sangbeom Kim    (  19) [PATCH V3 0/3] ARM: S5P: Add HRT=
 support
6473     Mar 07 Sangbeom Kim    ( 530) =E2=94=9C=E2=94=80>[PATCH 1/3] T=
his patch adds support HR
6474 N   Mar 07 Sangbeom Kim    ( 208) =E2=94=9C=E2=94=80>[PATCH 2/3] T=
his patch modify s5pv210_
6475 N   Mar 07 Sangbeom Kim    ( 112) =E2=94=94=E2=94=80>[PATCH 3/3] T=
his patch update mach-s5p

So to have half the subject space wasted by "This patch modify" is not
very productive.
