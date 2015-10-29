From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v3 3/4] drivers: exynos-srom: Add support for bank
 configuration
Date: Thu, 29 Oct 2015 09:54:01 +0300
Message-ID: <006b01d11216$9831dc40$c89594c0$@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
 <048021141f295b0e70c852134d4ac9cc6f7f1da4.1446018918.git.p.fedin@samsung.com>
 <56318175.6000006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60268 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbbJ2GyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 02:54:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWY0035SZ62IC20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 06:54:02 +0000 (GMT)
In-reply-to: <56318175.6000006@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>

 Hello!

> > +	for_each_child_of_node(np, child)
> > +		decode_sromc(srom, child);
> 
> You ignore the return value here so bank may be not configured but
> device probe will return 0.

 Yes, so that banks which are described correctly, will still be configured.

> Maybe clean up and fail the probe?

 I think it's not fatal, so cleanup is not necessary. May be dev_warn() in this case?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
