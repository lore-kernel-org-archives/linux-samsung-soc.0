From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 7/7] irqchip: s3c24xx: add devicetree support
Date: Tue, 02 Apr 2013 17:17:42 +0900
Message-ID: <22ca01ce2f7a$8c17d210$a4477630$%kim@samsung.com>
References: <201303262305.49725.heiko@sntech.de>
 <201303262310.35354.heiko@sntech.de> <51536B85.1070205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13124 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759704Ab3DBIR4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:17:56 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM008CECDIJP80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 17:17:42 +0900 (KST)
In-reply-to: <51536B85.1070205@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rob Herring' <robherring2@gmail.com>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, 'Rob Herring' <rob.herring@calxeda.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

Rob Herring wrote:
>=20
> On 03/26/2013 05:10 PM, Heiko St=FCbner wrote:
> > Add the necessary code to initialize the interrupt controller
> > thru devicetree data using the irqchip infrastructure.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Acked-by: Rob Herring <rob.herring@calxeda.com>
>=20
Rob, thanks for your ack.

Applied with your ack.

- Kukjin
