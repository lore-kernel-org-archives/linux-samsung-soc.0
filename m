From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv6] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 14 Jul 2015 15:28:34 +0900
Message-ID: <55A4AC12.1090205@samsung.com>
References: <1436833441-8405-1-git-send-email-parkch98@gmail.com>
 <55A45C63.2030907@samsung.com> <06b101d0bdf2$8aad8fb0$a008af10$@kernel.org>
 <CAGc3s_fQmWR_LNz-jbRDdGb3B8g0d+gSQa2=p_0k7yfJUD0PvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60892 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbbGNG2i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 02:28:38 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRG006I5SNNUG00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jul 2015 07:28:35 +0100 (BST)
In-reply-to: <CAGc3s_fQmWR_LNz-jbRDdGb3B8g0d+gSQa2=p_0k7yfJUD0PvA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Ribeiro <mdrjr0@gmail.com>, Kukjin Kim <kgene@kernel.org>
Cc: Chanho Park <parkch98@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On 14.07.2015 14:36, Mauro Ribeiro wrote:
> In my opinion since its something configurable by the board and not
> SoC specific it should be defined (or re-defined) on the board dts.
> 
> If one makes a 5422 board booting from A15's that patch will be
> already invalid and causing the issue that it fixes.

Indeed this is configurable by the board. For Odroid XU3 this is fixed
(hard-wired) but other boards may have it in different way. We already
discussed this and Chanho Park is here:
http://www.spinics.net/lists/linux-samsung-soc/msg44924.html
http://www.spinics.net/lists/linux-samsung-soc/msg44930.html

There were no additional objections to the patchset in that time.

Best regards,
Krzysztof
