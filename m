From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 09/10] ARM: S5PC100: Modify platform data for pl330
 driver
Date: Wed, 12 Oct 2011 13:52:12 +0900
Message-ID: <063501cc889a$b52eb520$1f8c1f60$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-5-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-6-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-7-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-8-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-9-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-10-git-send-email-thomas.abraham@linaro.org>
 <CAJL_dMvX-_ZpvJOUuD28RnoQpz6GFYiTvsWidfy3yeiu3Q04bA@mail.gmail.com>
 <CAJuYYwSj4D1bMbUtaPe=33GrS=e1_7+POHRWCb8Yzgpv8_Muzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29133 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752169Ab1JLEwO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 00:52:14 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSX002C4S5GQ330@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 13:52:12 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSX007QYS70P440@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 13:52:12 +0900 (KST)
In-reply-to: <CAJuYYwSj4D1bMbUtaPe=33GrS=e1_7+POHRWCb8Yzgpv8_Muzg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Anca Emanuel' <anca.emanuel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Thomas Abraham wrote:
>=20
> Hi Anca,
>=20
> On 12 October 2011 09:41, Anca Emanuel <anca.emanuel@gmail.com> wrote=
:
> > On Mon, Oct 10, 2011 at 9:15 PM, Thomas Abraham
> > <thomas.abraham@linaro.org> wrote:
> > <spnip>
> >
> >> +u8 pdma1_peri[] =3D {
> >> + =A0 =A0 =A0 DMACH_UART0_RX,
> >> + =A0 =A0 =A0 DMACH_UART0_TX,
> >> + =A0 =A0 =A0 DMACH_UART1_RX,
> >> + =A0 =A0 =A0 DMACH_UART1_TX,
> >> + =A0 =A0 =A0 DMACH_UART2_RX,
> >> + =A0 =A0 =A0 DMACH_UART2_TX,
> >> + =A0 =A0 =A0 DMACH_UART3_RX,
> >> + =A0 =A0 =A0 DMACH_UART3_TX,
> >> + =A0 =A0 =A0 DMACH_IRDA,
> >> + =A0 =A0 =A0 DMACH_I2S0_RX,
> >> + =A0 =A0 =A0 DMACH_I2S0_TX,
> >> + =A0 =A0 =A0 DMACH_I2S0S_TX,
> >> + =A0 =A0 =A0 DMACH_I2S1_RX,
> >> + =A0 =A0 =A0 DMACH_I2S1_TX,
> >> + =A0 =A0 =A0 DMACH_I2S2_RX,
> >> + =A0 =A0 =A0 DMACH_I2S2_TX,
> >> + =A0 =A0 =A0 DMACH_SPI0_RX,
> >> + =A0 =A0 =A0 DMACH_SPI0_TX,
> >> + =A0 =A0 =A0 DMACH_SPI1_RX,
> >> + =A0 =A0 =A0 DMACH_SPI1_TX,
> >> + =A0 =A0 =A0 DMACH_SPI2_RX,
> >> + =A0 =A0 =A0 DMACH_SPI2_TX,
> >> + =A0 =A0 =A0 DMACH_PCM0_RX,
> >> + =A0 =A0 =A0 DMACH_PCM1_TX,
> >
> > typo ? =A0DMACH_PCM0_TX
>=20
> Yes. That is a mistake. I cross-checked others with the user manual
> and they are fine.
>=20

OK, I think you don't need to re-send because I can fix it when I apply=
=2E
It would be helpful to me if you could check your patches again :)

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> Thanks for pointing this out.
>=20
> >
> >> + =A0 =A0 =A0 DMACH_PCM1_RX,
> >> + =A0 =A0 =A0 DMACH_PCM1_TX,
> >> + =A0 =A0 =A0 DMACH_MSM_REQ0,
> >> + =A0 =A0 =A0 DMACH_MSM_REQ1,
> >> + =A0 =A0 =A0 DMACH_MSM_REQ2,
> >> + =A0 =A0 =A0 DMACH_MSM_REQ3,
> >> =A0};
> >
