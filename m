From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 09:33:49 +0300
Message-ID: <014301d10b01$488873f0$d9995bd0$@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
 <1445255206-11148-7-git-send-email-pankaj.dubey@samsung.com>
 <56258683.7070204@samsung.com> <5625B92C.10505@samsung.com>
 <5625C07D.4030706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17792 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751043AbbJTGdx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 02:33:53 -0400
In-reply-to: <5625C07D.4030706@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com

 Hello!

> AFAIR Fedin was talking about missing functionality, not about adding
> the contribution by himself. So he might add it or he might not. I did
> not receive any commitments from him.

 I am waiting for the driver to be integrated, because i see it's constantly redesigned. Then i'll post my patches. By the way, they
will be useful only if pin controller driver for 5410 is accepted upstream, several authors have done it but i still didn't see it
in upstream.
 Pin controller is needed in order to configure multi-functional pins correctly.

> The driver should be "proper" for
> the time being (which could mean !PM dependency). If there is a need,
> then the dependency will be removed.

 I can do it later if you prefer.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
