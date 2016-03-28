From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 05/21] PM / devfreq: Add governer type with unique number
Date: Mon, 28 Mar 2016 15:46:37 +0900
Message-ID: <56F8D34D.8040408@samsung.com>
References: <386437144.28901459134748866.JavaMail.weblogic@epmlwas02a>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37825 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311AbcC1Gqk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 02:46:40 -0400
In-reply-to: <386437144.28901459134748866.JavaMail.weblogic@epmlwas02a>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@samsung.com, =?UTF-8?B?67CV6rK966+8?= <kyungmin.park@samsung.com>, =?UTF-8?B?7YGs7Ims7Iuc7Yag7ZSE?= <k.kozlowski@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux.amoon@gmail.com" <linux.amoon@gmail.com>, "m.reichl@fivetechno.de" <m.reichl@fivetechno.de>, "tjakobi@math.uni-bielefeld.de" <tjakobi@math.uni-bielefeld.de>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 2016=EB=85=84 03=EC=9B=94 28=EC=9D=BC 12:12, MyungJoo Ham wrote:
>> This patch just adds the governor type to identify them
>> by using the defined constant.
>=20
> We do not need this one.

Ok. I'll drop this patch on next patchset(v7).

Best Regards,
Chanwoo Choi
