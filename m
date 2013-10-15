From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH 1/3 v3] exynos: i2c: Fix i2c driver to handle NACKs properly
Date: Tue, 15 Oct 2013 08:06:09 +0200
Message-ID: <525CDB51.70408@denx.de>
References: <1380799354-14460-1-git-send-email-ch.naveen@samsung.com> <1381813971-16006-1-git-send-email-ch.naveen@samsung.com>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout-m0-k.invitel.net ([91.82.116.154]:54987 "EHLO
	relay-m2-k.invitel.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758417Ab3JOGOn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 02:14:43 -0400
In-Reply-To: <1381813971-16006-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, sjg@chromium.org, naveenkrishna.ch@gmail.com, d.mueller@elsoft.ch, trini@ti.com, mk7.kang@samsung.com, cpgs@samsung.com

Hello Naveen,

Am 15.10.2013 07:12, schrieb Naveen Krishna Chatradhi:
> The Exynos5 i2c driver does not handle NACKs properly. This change:
>
> - fixes the NACK processing problem (do not continue transaction if
>    address cycle was NACKed)
>
> - eliminates a fair amount of duplicate code
>
> Signed-off-by: Vadim Bendebury<vbendeb@chromium.org>
> Reviewed-by: Simon Glass<sjg@google.com>
> Signed-off-by: Naveen Krishna Chatradhi<ch.naveen@samsung.com>
> ---
> Changes since v1:
> Fixed complilation warning in function i2c_init()
>
> Changes since v2:
> None
>
>   drivers/i2c/s3c24x0_i2c.c |  214 +++++++++++++++++++--------------------------
>   1 file changed, 90 insertions(+), 124 deletions(-)

Hmm.. I think your patchset is for u-boot, or? But I could not find
the u-boot ml on cc... instead some linux ml ... if so, please resend
to the u-boot ml ...

(matches for all three patches from you)

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
