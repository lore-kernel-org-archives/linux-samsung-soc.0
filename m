From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: add DP clock reference to exynos5250 device
 tree
Date: Wed, 05 Jun 2013 20:25:25 +0900
Message-ID: <08da01ce61df$6013ba70$203b2f50$%kim@samsung.com>
References: <003001ce4e1b$24a28fc0$6de7af40$@samsung.com>
 <CAGm_ybh_Uvs2dX3Ecgcwy=GFO6QH-Hj1jz3f1=cDbZGq0Q4qDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15268 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752862Ab3FELZ1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 07:25:27 -0400
In-reply-to: <CAGm_ybh_Uvs2dX3Ecgcwy=GFO6QH-Hj1jz3f1=cDbZGq0Q4qDQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <sajjan.linux@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'sunil joshi' <joshi@samsung.com>

Vikas Sajjan wrote:
>=20
> Hi Mr. Jingoo Han,
>=20
> On Sat, May 11, 2013 at 1:12 PM, Jingoo Han <jg1.han@samsung.com> wro=
te:
> The transition to common clock happened; however, DP (Display Port)
> clock node was not added. Thus, DP (Display Port) clock node should
> be added to the device tree.
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Tested on Exynos5250
>=20
> =A0arch/arm/boot/dts/exynos5250.dtsi | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)

[...]

> =A0I have already sent similar patch on 8th May 2013.
>=20
> http://www.spinics.net/lists/linux-samsung-soc/msg18136.html

Vikas, please don't use html typed e-mail :-(

OK, I found Jingoo's ack on that.

Let me take that with Jingoo's ack and Doug's review tag.

Thanks.

- Kukjin
