From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] Samsung PWM support cleanup
Date: Wed, 14 Aug 2013 16:30:55 +0900
Message-ID: <10a701ce98c0$36afd980$a40f8c80$@org>
References: <3516906.8u5IrARqm7@flatron>
 <20130814060702.GH16635@quad.lixom.net> <109a01ce98bd$1843cae0$48cb60a0$@org>
 <CAOesGMhUncZmuuptZ3dU4UjVmvjKNb+GJqhwNwvYuUM=R3LwqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56878 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758279Ab3HNHbD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 03:31:03 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00FKTFIVP770@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 16:30:55 +0900 (KST)
In-reply-to: <CAOesGMhUncZmuuptZ3dU4UjVmvjKNb+GJqhwNwvYuUM=R3LwqA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org

Olof Johansson wrote:
> 
> On Wed, Aug 14, 2013 at 12:08 AM, Kukjin Kim <kgene@kernel.org> wrote:
> > Olof Johansson wrote:
> >>
> >> On Tue, Aug 13, 2013 at 11:16:35PM +0200, Tomasz Figa wrote:
> >> > Dear ARM SoC maintainers,
> >> >
> >> > The following changes since commit
> >> > c095ba7224d8edc71dcef0d655911399a8bd4a3f:
> >> >
> >> >   Linux 3.11-rc4 (2013-08-04 13:46:46 -0700)
> >> >
> >> > are available in the git repository at:
> >> >
> >> >   git://github.com/tom3q/linux.git tags/v3.12-pwm-cleanup-for-olof
> >>
> >> Thanks, applied.
> >>
> > Same here, this will be merged into samsung tree because of dependency.
> 
> What's the dependency? If it's just two patches (which I think it is),
> just send me your acks on them and we can apply them on top instead.
> 
Yeah if there are two patches, I can. But there are another dependent series
such as "[PATCH v2 0/8] Common Clock Framework support for Samsung S3C64xx"
from Tomasz. So I'd like to merge that into the samsung tree.

- Kukjin
