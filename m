From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PC100: Cleanup the GPIOlib code
Date: Sat, 02 Oct 2010 20:13:52 +0900
Message-ID: <014a01cb6222$e88324f0$b9896ed0$%kim@samsung.com>
References: <1285937894-2864-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTimCGD3b6oBQ2LbS=VxC-FBSBp3adMN4q_KgseZz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60908 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752201Ab0JBLNi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Oct 2010 07:13:38 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9N00M2ETUPU810@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 20:13:37 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9N00FUDTUPJD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 20:13:37 +0900 (KST)
In-reply-to: <AANLkTimCGD3b6oBQ2LbS=VxC-FBSBp3adMN4q_KgseZz@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> 
> Hi,
> 
Hi,

> There's some comments.
> At least the s5p series use the same .config = &gpio_cfg, so move it
> to common code and then can delete it at each SOC gpiolib.
> 
Hmm..ok..will consider it later.

> Please also check the other team how modified it since there's some
> comments from G  "why do you set each config at for loop. just put it
> at each configuration as is.
> 
Already has been discussed about that with Ben and following is
his comment.
"given that &gpio_cfg is the default, it would have been easier to
make a wrapper for the registration code and have it set any null
config settign to gpio_cfg."
And I agree with Ben's suggestion.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
