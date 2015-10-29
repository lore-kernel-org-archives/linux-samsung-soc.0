From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v3 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Thu, 29 Oct 2015 10:45:16 +0300
Message-ID: <008001d1121d$c0fef160$42fcd420$@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
 <046d990092dc85cf50db9082fc894d93a3ece7c0.1446018918.git.p.fedin@samsung.com>
 <563183F9.6020806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62519 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751536AbbJ2HpU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 03:45:20 -0400
In-reply-to: <563183F9.6020806@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, devicetree@vger.kernel.org

 Hello!

> You missed here a lot of potential Cc. Please use get_maintainer.pl
> script. It *must* be sent to devicetree list.
> 
> Please send it also to DeviceTree maintainers because you are adding
> quite generic names for bindings so they may have interesting thoughts
> on this.
> 
> LKML list is also missing.

 Ok. Next version will go there too.

> Any vendor prefix here? How generic is this?

 I just don't know... Does *everything* really need a vendor prefix? How readable would that be? "compatible" property already says
that it's samsung-exynos-specific. And IMHO it's quite obvious that properties of vendor-specific device are automatically
vendor-specific.
 Ok, i am currently fixing up the rest and will post v4 soon, and will Cc: it to devicetree ML.

 P.S. I intentionally omit the rest of the text in order to avoid overquoting, since we are already focused on some specific things.
If someone wants to get the whole picture, he/she could just browse back to the start of the thread. Or is it considered wrong
approach in this particular ML?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
