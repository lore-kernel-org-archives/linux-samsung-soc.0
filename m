From: Phil Carmody <phil.carmody@partner.samsung.com>
Subject: RE: [RFC PATCH 00/11] ARM: s3c64xx: Let amba-pl08x driver handle DMA
Date: Thu, 20 Jun 2013 12:24:47 +0300
Message-ID: <001201ce6d98$03d9b920$0b8d2b60$%carmody@partner.samsung.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <20130619174047.GB1403@sirena.org.uk> <3697657.tZFV7pR81Q@flatron>
 <20130619192211.GH1403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19975 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965172Ab3FTJY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 05:24:58 -0400
In-reply-to: <20130619192211.GH1403@sirena.org.uk>
Content-language: en-gb
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, alsa-devel@alsa-project.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <djbw@fb.co>

(Apologies if this is mangled, fighting both Outlook and remote desktop :-(
)

linux-kernel-owner@vger.kernel.org wrote on Behalf Of Mark Brown
> On Wed, Jun 19, 2013 at 08:26:12PM +0200, Tomasz Figa wrote:
> > On Wednesday 19 of June 2013 18:40:47 Mark Brown wrote:
> 
> > > -		ret = pd->get_signal(plchan->cd);
> > > +		ret = (pd->get_signal)(plchan->cd);
> 
> > Hmm, that's strange. The former is a completely valid piece of
> code...
> 
> I know, hence...
> 
> > > to get it to build which makes me suspect the compiler a bit as
> well...
> 
> ...my comment about suspecting the compiler.

Can you just make that minimal change, and diff the objdump of the two .o's?
It would be worth a bug-report against the toolchain if different code was
being generated. If objdump spews huge numbers of diffs (due to one address
changing and pushing everything else out of kilter), then feel free to
forward both .o's or both objdumps to me, and I can run a script over them,
which knows to ignore unimportant address changes. 

Praying that this mail is readable to you, as it's not readable as I write
it,
Phil
