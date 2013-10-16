From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Wed, 16 Oct 2013 07:35:16 +0530
Message-ID: <20131016020516.GT2954@intel.com>
References: <201310111059.19791.heiko@sntech.de>
 <20131013145642.GJ2954@intel.com>
 <201310132011.11285.heiko@sntech.de>
 <525DC274.8090808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:49671 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751605Ab3JPC6Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 22:58:16 -0400
Content-Disposition: inline
In-Reply-To: <525DC274.8090808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 16, 2013 at 07:32:20AM +0900, Kukjin Kim wrote:
> On 10/14/13 03:11, Heiko St=FCbner wrote:
> >Am Sonntag, 13. Oktober 2013, 16:56:42 schrieb Vinod Koul:
> >>On Fri, Oct 11, 2013 at 10:59:19AM +0200, Heiko St=FCbner wrote:
> >>>[I messed up the linux-arm-kernel list address yesterday, so I res=
end it
> >>>with a fixed address, sorry for the noise]
> >>>
> >>>When Olof reported the warning about the unused s3c2410_dma_resour=
ce, I
> >>>thought the best way forward would be to simply implement the miss=
ing
> >>>pieces and so it has users :-) .
> >>>
> >>>Therefore this series adds the necessary platform-devices for s3c2=
410,
> >>>s3c2440 and s3c2442. This especially also includes the
> >>>channel-constraints of those socs.
> >>>
> >>>As I do not have access to any of those socs these changes are of =
course
> >>>compile-tested only.
> >>
> >>Do you want this to be applied thru dma or arm tree?
> >
> >hmm, the original series went into the samsung tree for 3.13, so may=
be this
> >addition should go the same way?
> >
> I think so, let me pick this up into Samsung tree for v3.13.
Okay, sounds good. Ack for dmaengine patch sent

~Vinod
