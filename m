From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: [PATCH 1/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Sun, 3 Apr 2016 22:49:05 +0200
Message-ID: <570181C1.60209@free.fr>
References: <cover.1459167385.git.bugs.a.b@free.fr>
 <9c3c2a79cbaabd460131270e8a422bfa787b923a.1459167385.git.bugs.a.b@free.fr>
 <56FB6183.8030701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp1-g21.free.fr ([212.27.42.1]:18291 "EHLO smtp1-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984AbcDCUtK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 16:49:10 -0400
In-Reply-To: <56FB6183.8030701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

Le 30/03/2016 07:17, Chanwoo Choi a =C3=A9crit :
> Hi Adel,
>=20
> On 2016=EB=85=84 03=EC=9B=94 28=EC=9D=BC 23:08, Adel Belhouane wrote:
>> This patch adds timer node for exynos542x/5800.
>=20
> Did you test this arch_timer after deleting the MCT Device Tree node =
from dts file?
>=20
> As I knew, the generic arch time uses same H/W with MCT device in Exy=
nos SoC.
> So, If we remove the MCT device-tree node from dts, the arch timer is=
 not working.
> Just, I tested it on Exynos3250 SoC.

I got the same conclusion you got: it doesn't boot without the MCT
definition. But I'm not asking to change the MCT interface with the
Arch Timer interface (even if I understand it would give faster results
for some usages from the thread Krysztof Kozlowski gave before), I'm ju=
st
asking for both. The usage conflict was resolved with the commit
1d80415db64b that prevents the MCT interface from resetting the (same
hardware) timer thus no more disrupting the Arch Timer interface.

The goal is enabling KVM.

best regards,
Adel Belhouane.
