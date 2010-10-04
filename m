From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to	the
 regulator framework
Date: Mon, 04 Oct 2010 21:50:04 +0900
Message-ID: <4CA9CD7C.5080907@samsung.com>
References: <4CA5623D.3000002@samsung.com>
 <20101001053139.GE30949@sirena.org.uk>
 <AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
 <20101001072425.GD20529@opensource.wolfsonmicro.com>
 <AANLkTi=4XjbTDb_vukFicO2tXYvww-dGFyaErwx1i-BF@mail.gmail.com>
 <20101001182752.GD21157@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32475 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755608Ab0JDMuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 08:50:06 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9R009PVNNH2W40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 21:50:05 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9R0050CNNH65@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 21:50:05 +0900 (KST)
In-reply-to: <20101001182752.GD21157@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>

Mark Brown wrote:
> On Fri, Oct 01, 2010 at 05:25:43PM +0900, Kyungmin Park wrote:
>> On Fri, Oct 1, 2010 at 4:24 PM, Mark Brown
> 
>>> It's still good to show the actual connection on the board for clarity -
>>> like I say, the regulator API can handle always on regulators and
>>> keeping the regulator setup in software close to the schematic helps
>>> make the code easier to follow.
> 
>> It's best but in most case schematic is confidential. so it's impossible.
> 
> Right, this is normal - even with widely available reference boards the
> schematics are often distributed only under NDA.  Since the information
> exposed is at the same level as describing where the devices are on
> buses and so on this isn't usually a problem.
> 
>> And as you concerns there's no power issues related with codes. it's
>> already verified design. I think wolfsonmicro already confirmed.
> 
> Using a fixed voltage regulator won't cause a problem in operation, the
> issue is one of code quality.

Hi, Mark.

Do you have additional comment on this patch?

Best Regards,
Chanwoo Choi
